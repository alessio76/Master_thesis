#include <tf2_ros/static_transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <tf2_ros/transform_listener.h>
#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>
#include "geometric_shapes/shapes.h"
#include "geometric_shapes/mesh_operations.h"
#include "geometric_shapes/shape_operations.h"
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <actionlib/client/simple_action_client.h>
#include <Eigen/Geometry>

#include "pose_estimation/color.h"
#include "pose_estimation/utils.h"
#include "pose_estimation/TrajectoryAction.h"
#include "pose_estimation/plan_service.h"
#include "pose_estimation/pre_grasp_service.h"
#include "sun_wsg50_common/Move.h"
#include "sun_wsg50_common/Conf.h"
#include "std_srvs/Empty.h"
namespace uclv{
    geometry_msgs::Pose average_pose(const std::string& frame_name, int iteration, tf2_ros::Buffer& tfBuffer){
        
        Eigen::Vector3f mean_pos{1,1,1};
        Eigen::Vector4f mean_quat{1, 1, 1, 1};
        geometry_msgs::TransformStamped transformStamped;

        for(int i=2; i<=iteration + 1; i++){
            transformStamped = tfBuffer.lookupTransform("base_link", frame_name, ros::Time(0));
            Eigen::Vector3f new_pos(transformStamped.transform.translation.x, transformStamped.transform.translation.y, transformStamped.transform.translation.z);
            Eigen::Vector4f new_quat(transformStamped.transform.rotation.w, transformStamped.transform.rotation.x, transformStamped.transform.rotation.y, transformStamped.transform.rotation.z);
            mean_pos = (mean_pos * float((i-1)) + new_pos)/float(i);   
            mean_quat = (mean_quat * float((i-1)) + new_quat)/float(i);         

        }

        geometry_msgs::Pose santal_pose;
        santal_pose.position.x = mean_pos[0];
        santal_pose.position.y = mean_pos[1];
        santal_pose.position.z = mean_pos[2];

        santal_pose.orientation.w = mean_quat[0];
        santal_pose.orientation.x = mean_quat[1];
        santal_pose.orientation.y = mean_quat[2];
        santal_pose.orientation.z = mean_quat[3];

        return santal_pose;


    }

    std::vector<Eigen::Isometry3f> build_scene(tf2_ros::StaticTransformBroadcaster& static_broadcaster, bool simulation, const std::string& object_frame_name){
        
        moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
        std::vector<moveit_msgs::CollisionObject> collision_objects;
        moveit_msgs::CollisionObject floor;
        floor.header.frame_id = "base_link";

        // The id of the object is used to identify it.
        floor.id = "floor";

        // Define a box to add to the world.
        shape_msgs::SolidPrimitive primitive;
        primitive.type = primitive.BOX;
        primitive.dimensions.resize(3);
        primitive.dimensions[primitive.BOX_X] = 10;
        primitive.dimensions[primitive.BOX_Y] = 10;
        primitive.dimensions[primitive.BOX_Z] = 0.01;

        shape_msgs::SolidPrimitive test;
        test.type = primitive.BOX;
        test.dimensions.resize(3);
        test.dimensions[primitive.BOX_X] = 0.08;
        test.dimensions[primitive.BOX_Y] = 0.08;
        test.dimensions[primitive.BOX_Z] = 0.08;

        geometry_msgs::Pose floor_pose;
        floor_pose.orientation.w = 1.0;
        floor_pose.position.x = 0;
        floor_pose.position.y = 0;
        floor_pose.position.z = 0;

        floor.primitives.push_back(primitive);
        floor.primitive_poses.push_back(floor_pose);
        floor.operation = floor.ADD;
        collision_objects.push_back(floor);
        /****** FLOOR ADDED ******/


        shapes::Mesh* m = shapes::createMeshFromResource("file:///mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset/santal_ace/santal_centered.obj",Eigen::Vector3d(1e-3,1e-3,1e-3));
        shape_msgs::Mesh mesh;
        shapes::ShapeMsg mesh_msg;
        if(shapes::constructMsgFromShape(m, mesh_msg))
            mesh = boost::get<shape_msgs::Mesh>(mesh_msg);
        else
            ROS_ERROR_STREAM("Cannot create mesh");

        std::ostringstream out;
        tf2_ros::Buffer tfBuffer;
        tf2_ros::TransformListener tfListener(tfBuffer);
        int i=0;
        std::vector<Eigen::Isometry3f> santal_transforms;

        out << object_frame_name << i;
      
        while(tfBuffer.canTransform( out.str(), "base_link",ros::Time(0),ros::Duration(10))){
            //gives the pose for the second frame in the first coordinate system 
            
            geometry_msgs::Pose santal_pose = average_pose(out.str(), 200, tfBuffer);
            /*Eigen::Isometry3f obj_pose(Eigen::Translation3f(0.4, 0, 0.03) * Eigen::Quaternionf(Eigen::AngleAxisf(0, Eigen::Vector3f::UnitX())));
            geometry_msgs::Pose santal_pose=uclv::eigen_to_Pose(obj_pose.translation(), Eigen::Quaternionf(obj_pose.rotation()));*/
            Eigen::Vector3f santal_position(santal_pose.position.x, santal_pose.position.y, santal_pose.position.z);
            Eigen::Quaternionf santal_ori(santal_pose.orientation.w, santal_pose.orientation.x, santal_pose.orientation.y, santal_pose.orientation.z);
            santal_transforms.push_back(Eigen::Isometry3f(Eigen::Translation3f(santal_position) * Eigen::Quaternionf(santal_ori)));

            moveit_msgs::CollisionObject object_to_attach;
            object_to_attach.id = out.str();
                
            object_to_attach.header.frame_id = "base_link";
            object_to_attach.meshes.push_back(mesh);
            object_to_attach.mesh_poses.push_back(santal_pose);

            object_to_attach.operation = object_to_attach.ADD;
            collision_objects.push_back(object_to_attach);
            i++;
            out.str("");
            out.clear();
            out << object_frame_name << i;
            
        }
        
        planning_scene_interface.addCollisionObjects(collision_objects);
        return santal_transforms;
        
    }

    Eigen::Isometry3f set_grasp_pose(const Eigen::Isometry3f& pre_grasp_pose, float pre_grasp_offset){
        
        Eigen::Isometry3f pre_grasp_to_grasp = Eigen::Isometry3f(Eigen::Translation3f(Eigen::Vector3f::UnitZ() * pre_grasp_offset));
        Eigen::Isometry3f grasp_pose = pre_grasp_pose * pre_grasp_to_grasp;
        return grasp_pose;
    }



    bool call_plan_service(std::vector<std::tuple<moveit_msgs::RobotTrajectory, std::string, std::string>>& full_traj, const Eigen::Isometry3f& target_pose,
                        pose_estimation::plan_service& plan_service, const std::string& planning_type, const std::string& planning_group,const std::vector<double>& start_state, 
                        tf2_ros::StaticTransformBroadcaster& static_broadcaster, ros::ServiceClient& plan_client, const std::string& attach_obj_id="",
                        const std::string& move_gripper=""){
        
        Eigen::Vector3f trans = target_pose.translation();
        Eigen::Quaternionf quat = Eigen::Quaternionf(target_pose.rotation());
        //transform to be published on tf for visualization
        geometry_msgs::TransformStamped goal_pose = uclv::eigen_to_TransformedStamped("base_link", "goal_pose", trans, quat);
        static_broadcaster.sendTransform(goal_pose);
        plan_service.request.goal_transform = goal_pose;
        plan_service.request.planning_type = planning_type;
        plan_service.request.planning_group = planning_group;
        plan_service.request.attach_obj_id = attach_obj_id;
        if(start_state.size() <=0)
            plan_service.request.start_state = std::get<0>(full_traj[full_traj.size()-1]).joint_trajectory.points.back().positions;
        else
            plan_service.request.start_state = start_state;
        
        if (plan_client.call(plan_service)){   
            ROS_INFO_STREAM("Calling planning server");
            
            //if the plan is succesfull add it to the full trajectory 
            if(plan_service.response.success){
                full_traj.push_back(std::make_tuple(plan_service.response.trajectory, move_gripper, attach_obj_id));
                return true;
            }

            else{
                ROS_ERROR_STREAM("Planning Failed");
                return false;
            }
        }

        else{

            ROS_ERROR_STREAM("Failed to call planning service");
            return false;
        }

    }

    bool move_gripper(float gripper_width, bool simulation, ros::Publisher& joint_pub, const std::string& gripper_command, ros::NodeHandle& nh){
        static int n=0;
        bool success=true;
        
        if(simulation){
            sensor_msgs::JointState joint_cmd;
        
            joint_cmd.header.seq = n++;
            joint_cmd.header.stamp = ros::Time::now();
            joint_cmd.name.push_back("gripper_joint");
            
            if(gripper_command == "close"){
                joint_cmd.position.push_back(-(68 - gripper_width)/(2*1e3));
            
            }
            else if (gripper_command == "open")
                joint_cmd.position.push_back(0);
            
            joint_cmd.velocity.push_back(0);
            joint_pub.publish(joint_cmd);

        }
        
        //real gripper
        else{
            
            if(gripper_command == "close"){
                
                ros::ServiceClient force_gripper_client = nh.serviceClient<sun_wsg50_common::Conf>("/set_force");
                sun_wsg50_common::Conf set_service;
                set_service.request.val=8.0;

                if (force_gripper_client.call(set_service)){

                    if(set_service.response.error){
                        ROS_ERROR_STREAM(set_service.response.error);
                        success = false;
                    }

                    ros::ServiceClient gripper_client = nh.serviceClient<sun_wsg50_common::Move>("/grasp");
                    sun_wsg50_common::Move close_service;
                    close_service.request.width = gripper_width;
                    close_service.request.speed = 10;

                    if (gripper_client.call(close_service)){

                        if(close_service.response.error){
                            ROS_ERROR_STREAM(close_service.response.error);
                            success = false;
                        }

                    }

                    else{

                        ROS_ERROR_STREAM("Failed to call grasp service");
                        success = false;
                    }
                }

                else{

                    ROS_ERROR_STREAM("Failed to set force service");
                    success = false;
                }
            
            }

            else if (gripper_command == "open"){
                ros::ServiceClient gripper_client = nh.serviceClient<std_srvs::Empty>("/homing");
                std_srvs::Empty open_service;

                if (gripper_client.call(open_service)){

                } 

                else{
                    ROS_ERROR_STREAM("Failed to call grasp service");
                    success = false;
                }
                
            }
        }
        
        return success;
    }

}

int main(int argc, char** argv){
    ros::init(argc, argv, "main_node");
    ros::NodeHandle n;
    bool simulation;
    std::vector<double> start_state;
    n.getParam("simulation",simulation);
    std::string object_frame_name;
    std::vector<double> initial_state{0.7529263496398926, 0.24619631469249725, -2.463223695755005, -0.03696741536259651, -0.14155149459838867, -1.6968756914138794, 0.24923288822174072};
    n.getParam("base_object_frame_name",object_frame_name);
    const std::string topic_name="gripper_joints";
    ros::Publisher joint_pub = n.advertise<sensor_msgs::JointState>(topic_name, 1);
    ros::ServiceClient pre_grasp_client = n.serviceClient<pose_estimation::pre_grasp_service>("pre_grasp_service");
   
    ros::ServiceClient plan_client = n.serviceClient<pose_estimation::plan_service>("plan_service");
    pose_estimation::plan_service plan_service;
    pose_estimation::pre_grasp_service pre_grasp_service;
    actionlib::SimpleActionClient<pose_estimation::TrajectoryAction> action_client("trajectory_action_server",true);
    std::string end_effector_frame;
    
    float pre_grasp_offset;
    float gripper_width;

    n.getParam("end_effector_frame_name", end_effector_frame);
    n.getParam("pre_grasp_offset_name", pre_grasp_offset);
    std::vector<std::tuple<moveit_msgs::RobotTrajectory, std::string, std::string>> full_traj;
    //wait for the planning service to be up
    pre_grasp_client.waitForExistence();

    //wait for the pregrasp service to be up
    plan_client.waitForExistence();
    
    //wait for action server
    action_client.waitForServer();
    
    pose_estimation::TrajectoryGoal trajectory_goal;
   
    const std::string ARM = "yaskawa_arm";
    tf2_ros::StaticTransformBroadcaster static_broadcaster;

    //message to the server
    geometry_msgs::TransformStamped out_message;

    Eigen::Isometry3f grasp_pose;
    Eigen::Isometry3f pre_grasp_pose;
    Eigen::Isometry3f post_grasp_pose;
    std::vector<Eigen::Isometry3f> obj_pose;
    Eigen::Isometry3f pre_place_pose;
    Eigen::Isometry3f place_pose;
    Eigen::Isometry3f post_place_pose;

    //54mm most long side
    //upright 35mm
    //12mm shortest side
    //192.168.2.111 wsg IP   

    obj_pose = uclv::build_scene(static_broadcaster, simulation, object_frame_name);
    ROS_INFO_STREAM(obj_pose.size());
    for(int j=0; j < obj_pose.size(); j++){
        
        std::ostringstream out;
        out << object_frame_name << j;
        pre_grasp_service.request.object_pose = uclv::eigen_to_TransformedStamped("base_link", out.str() , obj_pose[j].translation(), Eigen::Quaternionf(obj_pose[j].rotation()));
        pre_grasp_service.request.planning_group = ARM;
    
        if (pre_grasp_client.call(pre_grasp_service)){   
            ROS_INFO_STREAM("Calling pre_grasp planning");
            //if a feasible pre_grasp pose is found, add it to the trajectory vector
            if(pre_grasp_service.response.success){
                //uclv::askContinue("PRE GRASP TRAJECTORY. Continue?");
                gripper_width = pre_grasp_service.response.gripper_width;
                ROS_INFO_STREAM("Pre grasp planning complete" << "*************" << gripper_width);

                full_traj.push_back(std::make_tuple(pre_grasp_service.response.trajectory, "", ""));
                
                Eigen::Translation3f pre_grasp_trans(pre_grasp_service.response.pre_grasp_pose.transform.translation.x,
                                                    pre_grasp_service.response.pre_grasp_pose.transform.translation.y,
                                                    pre_grasp_service.response.pre_grasp_pose.transform.translation.z);

                Eigen::Quaternionf pre_grasp_rot(pre_grasp_service.response.pre_grasp_pose.transform.rotation.w,
                                                pre_grasp_service.response.pre_grasp_pose.transform.rotation.x,
                                                pre_grasp_service.response.pre_grasp_pose.transform.rotation.y,
                                                pre_grasp_service.response.pre_grasp_pose.transform.rotation.z);
                                                
                pre_grasp_pose = Eigen::Isometry3f(pre_grasp_trans * pre_grasp_rot);
                grasp_pose = uclv::set_grasp_pose(pre_grasp_pose, pre_grasp_offset);
                
                ROS_INFO_STREAM("Calling grasp planning");
                if(uclv::call_plan_service(full_traj, grasp_pose, plan_service, "cartesian", ARM, start_state, static_broadcaster, plan_client, "", "close")){
                    //uclv::askContinue("GRASP TRAJECTORY. Continue?");
                    post_grasp_pose = pre_grasp_pose;
                    
                    ROS_INFO_STREAM("Calling post grasp planning");
                    if(uclv::call_plan_service(full_traj, post_grasp_pose, plan_service, "cartesian", ARM, start_state, static_broadcaster, plan_client, out.str())){
                        //uclv::askContinue("POST GRASP TRAJECTORY?. Continue?");
                        pre_place_pose = Eigen::Isometry3f(Eigen::Translation3f(0.10, -0.40, post_grasp_pose.translation()[2]) * Eigen::Quaternionf(post_grasp_pose.rotation()));

                        ROS_INFO_STREAM("Calling pre place planning");
                        if(uclv::call_plan_service(full_traj, pre_place_pose, plan_service, "cartesian", ARM, start_state, static_broadcaster, plan_client, out.str())){
                            //uclv::askContinue("PRE PLACE TRAJECTORY?. Continue?");
                            place_pose = Eigen::Isometry3f(Eigen::Translation3f(pre_place_pose.translation()[0], pre_place_pose.translation()[1], 0.03*2) * Eigen::Quaternionf(pre_place_pose.rotation()));

                            ROS_INFO_STREAM("Calling place planning");
                            if(uclv::call_plan_service(full_traj, place_pose, plan_service, "cartesian", ARM, start_state, static_broadcaster, plan_client, out.str(), "open")){
                                //uclv::askContinue("PLACE TRAJECTORY?. Continue?");
                                post_place_pose=pre_place_pose;

                                ROS_INFO_STREAM("Calling post planning");
                                if(uclv::call_plan_service(full_traj, post_place_pose, plan_service, "cartesian", ARM, start_state, static_broadcaster, plan_client)){
                                    //uclv::askContinue("POST PLACE TRAJECTORY?. Continue?");

                                        if (!action_client.isServerConnected())
                                                ROS_ERROR_STREAM("Cannot reach trajectory server!" << action_client.getState().getText());

                                            if (uclv::askContinue("EXECUTE TRAJECTORY?")){
                                                for(int i=0; i<full_traj.size(); i++){
                                                    
                                                    trajectory_goal.trajectory = std::get<0>(full_traj[i]);
                                                    action_client.sendGoal(trajectory_goal);

                                                    if (!action_client.waitForResult()){
                                                        ROS_INFO_STREAM("move_group_interface" << "ExecuteTrajectory action returned early" << action_client.getState().getText());
                                                    }

                                                    else{
                                                        
                                                        if(action_client.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                                                            ROS_INFO_STREAM("Trajectory executed succesfully");  
                                                        

                                                        else
                                                            ROS_INFO_STREAM("move_group_interface" << action_client.getState().toString()<< ": " << action_client.getState().getText());
                                                        
                                                    }
                                                    ROS_INFO_STREAM(std::get<1>(full_traj[i]));
                                                    
                                                    if(std::get<1>(full_traj[i]) != "")
                                                        uclv::move_gripper(gripper_width, simulation, joint_pub, std::get<1>(full_traj[i]), n);
                                                    
                                                }
                                            }
                                                 
                                }

                                else{
                                    ROS_ERROR_STREAM("Post place planning failed");
                                    return -1;
                                }
                            }

                            else{
                                ROS_ERROR_STREAM("Place planning failed");
                                return -1;
                            }
                        
                        }

                        else{
                            ROS_ERROR_STREAM("Pre place planning failed");
                            return -1;
                        }
                    }

                    else{
                        ROS_ERROR_STREAM("Post grasp planning failed");
                        return -1;
                    }
                }

                else{
                    ROS_ERROR_STREAM("Grasp planning failed");
                    return -1;
                }
            
            }

            else{
                ROS_ERROR_STREAM("Failed to generate a feasible pre-grasp pose");
                return -1;
            }
        }
        
        else{

            ROS_ERROR_STREAM("Failed to call pre_grasp service");
            return -1;
        }

        full_traj.clear();
    }

    
    return 0;

}

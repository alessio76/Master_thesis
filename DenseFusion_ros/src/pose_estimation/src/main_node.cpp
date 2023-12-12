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

namespace uclv{

    Eigen::Isometry3f sim_scene(){
        
        static tf2_ros::StaticTransformBroadcaster static_broadcaster;
        ROS_INFO_STREAM("Simulation mode");
        moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
        moveit_msgs::CollisionObject object_to_attach;
        object_to_attach.id = "santal";

        shapes::Mesh* m = shapes::createMeshFromResource("file:///mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset/santal_ace/santal_centered.obj",Eigen::Vector3d(1e-3,1e-3,1e-3));
        shape_msgs::Mesh mesh;
        shapes::ShapeMsg mesh_msg;
        shapes::constructMsgFromShape(m, mesh_msg);
        mesh = boost::get<shape_msgs::Mesh>(mesh_msg);

        object_to_attach.header.frame_id = "base_link";
        //Eigen::AngleAxisf(M_PI /2, Eigen::Vector3f::UnitX()
        Eigen::Isometry3f obj_pose(Eigen::Translation3f(0.4, 0, 0) * Eigen::Quaternionf(Eigen::AngleAxisf(M_PI/2, Eigen::Vector3f::UnitZ())));
        geometry_msgs::Pose santal_pose=uclv::eigen_to_Pose(obj_pose.translation(), Eigen::Quaternionf(obj_pose.rotation()));
        
        Eigen::Vector3f santal_position(santal_pose.position.x, santal_pose.position.y, santal_pose.position.z);
        Eigen::Quaternionf santal_ori(santal_pose.orientation.w, santal_pose.orientation.x, santal_pose.orientation.y, santal_pose.orientation.z);
        Eigen::Isometry3f santal_transform(Eigen::Translation3f(santal_position) * Eigen::Quaternionf(santal_ori));
        
        object_to_attach.meshes.push_back(mesh);
        object_to_attach.mesh_poses.push_back(santal_pose);
        object_to_attach.operation = object_to_attach.ADD;
        planning_scene_interface.applyCollisionObject(object_to_attach);

        return santal_transform;
        
    }

    Eigen::Isometry3f set_grasp_pose(const Eigen::Isometry3f& pre_grasp_pose, float pre_grasp_offset){
        
        Eigen::Isometry3f pre_grasp_to_grasp = Eigen::Isometry3f(Eigen::Translation3f(Eigen::Vector3f::UnitZ() * pre_grasp_offset));
                                                               

        Eigen::Isometry3f grasp_pose = pre_grasp_pose * pre_grasp_to_grasp;
        return grasp_pose;
    }



bool call_plan_service(std::vector<std::tuple<moveit_msgs::RobotTrajectory, std::string, std::string>>& full_traj, const Eigen::Isometry3f& target_pose,
                       pose_estimation::plan_service& plan_service, const std::string& planning_space, const std::string& planning_group, 
                       tf2_ros::StaticTransformBroadcaster& static_broadcaster, ros::ServiceClient& plan_client, const std::string& attach_obj_id="",
                       const std::string& move_gripper=""){
    
    std::ostringstream out;
    
    Eigen::Vector3f trans = target_pose.translation();
    Eigen::Quaternionf quat = Eigen::Quaternionf(target_pose.rotation());
    //transform to be published on tf for visualization
    geometry_msgs::TransformStamped goal_pose = uclv::eigen_to_TransformedStamped("base_link", "goal_pose", trans, quat);
    static_broadcaster.sendTransform(goal_pose);
    plan_service.request.goal_transform = goal_pose;
    plan_service.request.planning_space = planning_space;
    plan_service.request.planning_group = planning_group;
    plan_service.request.attach_obj_id = attach_obj_id;
    plan_service.request.start_state = std::get<0>(full_traj[full_traj.size()-1]).joint_trajectory.points.back().positions;
    
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

bool move_gripper(float gripper_width, bool simulation, ros::Publisher& joint_pub, const std::string& gripper_command){
    static int n=0;
    bool success=true;
    
    if(simulation){
        sensor_msgs::JointState joint_cmd;
       
        joint_cmd.header.seq = n++;
        joint_cmd.header.stamp = ros::Time::now();
        joint_cmd.name.push_back("right_joint");
        
        if(gripper_command == "close"){
            joint_cmd.position.push_back(-(68 - gripper_width)/(2*1e3));
           
        }
        else if (gripper_command == "open")
            joint_cmd.position.push_back(0);
        
        joint_cmd.velocity.push_back(0);
        joint_pub.publish(joint_cmd);

    }
    
    else{





    }

    return success;
}


}

int main(int argc, char** argv){
    ros::init(argc, argv, "main_node");

    ros::NodeHandle n;
    const std::string topic_name="gripper_joints";
    ros::Publisher joint_pub = n.advertise<sensor_msgs::JointState>(topic_name, 1);
    ros::ServiceClient pre_grasp_client = n.serviceClient<pose_estimation::pre_grasp_service>("pre_grasp_service");
    ros::ServiceClient move_gripper_client = n.serviceClient<sun_wsg50_common::Move>("/move");
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

    //move_gripper_client.waitForExistence();

    pose_estimation::TrajectoryGoal trajectory_goal;
    bool simulation;
    n.getParam("simulation",simulation);
    const std::string ARM = "yaskawa_arm";
    tf2_ros::StaticTransformBroadcaster static_broadcaster;

    //message to the server
    geometry_msgs::TransformStamped out_message;

    Eigen::Isometry3f grasp_pose;
    Eigen::Isometry3f pre_grasp_pose;
    Eigen::Isometry3f post_grasp_pose;
    Eigen::Isometry3f obj_pose;
    Eigen::Isometry3f pre_place_pose;
    Eigen::Isometry3f place_pose;
    Eigen::Isometry3f post_place_pose;

    //if simulation is true build a fake scene
    if(simulation){
        
      obj_pose = uclv::sim_scene();
        
     
    }
    //54mm most long side
    //upright 35mm
    //12mm shortest side
    //192.168.2.111 wsg IP 
    //otherwise use the real goal pose
    else{
        
       
    
    //set real goal pose

    }

    pre_grasp_service.request.object_pose = uclv::eigen_to_TransformedStamped("base_link", "obj_pose", obj_pose.translation(), Eigen::Quaternionf(obj_pose.rotation()));
    pre_grasp_service.request.planning_group = ARM;
   
    if (pre_grasp_client.call(pre_grasp_service)){   
        ROS_INFO_STREAM("Calling pre_grasp server");
        //if a feasible pre_grasp pose is found, add it to the trajectory vector
        if(pre_grasp_service.response.success){
            gripper_width = pre_grasp_service.response.gripper_width;
            ROS_INFO_STREAM("*************" << gripper_width);

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
            //uclv::askContinue("Calling Grasp plan");
          
            if(uclv::call_plan_service(full_traj, grasp_pose, plan_service, "cartesian", ARM, static_broadcaster, plan_client, "", "close")){
                
                //uclv::askContinue("Calling attach object and post grasp plan");
                post_grasp_pose = pre_grasp_pose;

                if(uclv::call_plan_service(full_traj, post_grasp_pose, plan_service, "cartesian", ARM, static_broadcaster, plan_client, "santal")){
                    pre_place_pose = post_grasp_pose * Eigen::Isometry3f(Eigen::Translation3f(0, 0.2,0) * Eigen::Quaternionf(1,0,0,0));
                    //uclv::askContinue("Calling pre_place plan");

                    if(uclv::call_plan_service(full_traj, pre_place_pose, plan_service, "cartesian", ARM, static_broadcaster, plan_client, "santal")){
                        place_pose = pre_place_pose * Eigen::Isometry3f(Eigen::Translation3f(Eigen::Vector3f::UnitZ() * 0.15));
                        ///uclv::askContinue("Calling place plan");

                        if(uclv::call_plan_service(full_traj, place_pose, plan_service, "cartesian", ARM, static_broadcaster, plan_client, "santal", "open")){
                            post_place_pose=pre_place_pose;
                            ///uclv::askContinue("Calling post_place plan");

                            if(uclv::call_plan_service(full_traj, post_place_pose, plan_service, "cartesian", ARM, static_broadcaster, plan_client)){
                                /****PLANNING*****/

                                /****EXECUTION****/
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
                                                uclv::move_gripper(gripper_width, simulation, joint_pub, std::get<1>(full_traj[i]));
                                            
                                        }
                                        }

                                       
                                    
                            }
                        }
                    
                    
                    }
                }
            }

            else{
                ROS_ERROR_STREAM("Grasp planning failed");
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

    
    return 0;

}

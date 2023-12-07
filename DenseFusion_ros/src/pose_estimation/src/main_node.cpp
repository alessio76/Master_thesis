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
    
        geometry_msgs::Pose santal_pose;
        Eigen::Quaternionf rand_quat=Eigen::Quaternionf::UnitRandom();
        santal_pose.orientation.w = 1.0;
        /*santal_pose.orientation.w = rand_quat.w();
        santal_pose.orientation.z = rand_quat.z();
        santal_pose.orientation.y = rand_quat.y();
        santal_pose.orientation.x = rand_quat.x();*/

        santal_pose.position.x = 0.8;
        //santal_pose.position.y = 0.2;
        santal_pose.position.z = 0.6;
        

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

}


int main(int argc, char** argv){
    ros::init(argc, argv, "main_node");

    ros::NodeHandle n;
    ros::ServiceClient pre_grasp_client = n.serviceClient<pose_estimation::pre_grasp_service>("pre_grasp_service");
    ros::ServiceClient plan_client = n.serviceClient<pose_estimation::plan_service>("plan_service");
    pose_estimation::plan_service plan_service;
    pose_estimation::pre_grasp_service pre_grasp_service;
    actionlib::SimpleActionClient<pose_estimation::TrajectoryAction> action_client("trajectory_action_server",true);
    std::string end_effector_frame;
    float pre_grasp_offset;
    
    n.getParam("end_effector_frame_name", end_effector_frame);
    n.getParam("pre_grasp_offset_name", pre_grasp_offset);
    std::vector<moveit_msgs::RobotTrajectory> full_traj;
    //wait for the planning service to be up
    pre_grasp_client.waitForExistence();

    //wait for the pregrasp service to be up
    plan_client.waitForExistence();
    
    //wait for action server
    action_client.waitForServer();

    pose_estimation::TrajectoryGoal trajectory_goal;
    bool simulation;
    n.getParam("simulation",simulation);
    static const std::string ARM = "yaskawa_arm";
    static tf2_ros::StaticTransformBroadcaster static_broadcaster;

    //message to the server
    geometry_msgs::TransformStamped out_message;

    Eigen::Isometry3f grasp_pose;
    Eigen::Isometry3f pre_grasp_pose;
    Eigen::Isometry3f post_grasp_pose;
    Eigen::Isometry3f obj_pose;
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
            ROS_INFO_STREAM("Pre grasp sucess");

            full_traj.push_back(pre_grasp_service.response.trajectory);

            Eigen::Translation3f pre_grasp_trans(pre_grasp_service.response.pre_grasp_pose.transform.translation.x,
                                                pre_grasp_service.response.pre_grasp_pose.transform.translation.y,
                                                pre_grasp_service.response.pre_grasp_pose.transform.translation.z);

            Eigen::Quaternionf pre_grasp_rot(pre_grasp_service.response.pre_grasp_pose.transform.rotation.w,
                                            pre_grasp_service.response.pre_grasp_pose.transform.rotation.x,
                                            pre_grasp_service.response.pre_grasp_pose.transform.rotation.y,
                                            pre_grasp_service.response.pre_grasp_pose.transform.rotation.z);
                                            
            pre_grasp_pose = Eigen::Isometry3f(pre_grasp_trans * pre_grasp_rot);
            post_grasp_pose = pre_grasp_pose;
            grasp_pose = uclv::set_grasp_pose(pre_grasp_pose, pre_grasp_offset);
            std::array<std::tuple<std::string, Eigen::Isometry3f>, 3> task_poses{
                                                                std::make_tuple("cartesian", pre_grasp_pose),
                                                                std::make_tuple("cartesian", grasp_pose),
                                                                std::make_tuple("cartesian", post_grasp_pose)
                                                                };
            
            std::ostringstream out;
            uclv::askContinue("Continue planning?");
            //first element of task pose is the pregrasp pose, for which the plan has already been made
            for(int i=1; i<task_poses.size(); i++){
        
                Eigen::Vector3f trans = std::get<1>(task_poses[i]).translation();
                Eigen::Quaternionf quat = Eigen::Quaternionf(std::get<1>(task_poses[i]).rotation());
                //transform to be published on tf for visualization
                geometry_msgs::TransformStamped goal_pose = uclv::eigen_to_TransformedStamped("base_link", "goal_pose", trans, quat);
                static_broadcaster.sendTransform(goal_pose);
                plan_service.request.goal_transform = goal_pose;
                plan_service.request.planning_space = std::get<0>(task_poses[i]);
                plan_service.request.planning_group = ARM;
                plan_service.request.start_state = full_traj[i-1].joint_trajectory.points.back().positions;
                
                if (plan_client.call(plan_service)){   
                    ROS_INFO_STREAM("Calling planning server");
                    
                    //if the plan is succesfull add it to the full trajectory 
                    if(plan_service.response.success){
                        full_traj.push_back(plan_service.response.trajectory);
                        ROS_INFO_STREAM(BOLDGREEN << "Plan " << i+1 << " successful" <<  std::flush);
                        uclv::askContinue("Continue planning?");
                    }

                    else{
                        ROS_ERROR_STREAM("Planning Failed");
                        return -1;
                    }
                }

                else{

                    ROS_ERROR_STREAM("Failed to call planning service");
                    return -1;
                }
            }
            /****PLANNING*****/

            /****EXECUTION****/
            if (!action_client.isServerConnected())
                    ROS_ERROR_STREAM("Cannot reach trajectory server!" << action_client.getState().getText());

            if (uclv::askContinue("EXECUTE TRAJECTORY?")){
                for(int i=0; i<full_traj.size(); i++){
                    
                    trajectory_goal.trajectory = full_traj[i];
                    action_client.sendGoal(trajectory_goal);

                    if (!action_client.waitForResult()){
                        ROS_INFO_STREAM("move_group_interface" << "ExecuteTrajectory action returned early" << action_client.getState().getText());
                    }

                    else{
                        
                        if(action_client.getState() == actionlib::SimpleClientGoalState::SUCCEEDED){
                            ROS_INFO_STREAM("Trajectory executed succesfully");  
                            
                        }

                        else{
                            ROS_INFO_STREAM("move_group_interface" << action_client.getState().toString()<< ": " << action_client.getState().getText());
                            
                        }
                    }
                    
                }
            }

            else{
                ROS_ERROR_STREAM("Execution aborted by the user!");
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

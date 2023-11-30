#include <tf2/LinearMath/Quaternion.h>
#include <tf2/LinearMath/Matrix3x3.h>
#include <tf2/LinearMath/Vector3.h>
#include <tf2/LinearMath/Transform.h>
#include <tf2_ros/static_transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_ros/static_transform_broadcaster.h>
#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>
#include "geometric_shapes/shapes.h"
#include "geometric_shapes/mesh_operations.h"
#include "geometric_shapes/shape_operations.h"
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <actionlib/client/simple_action_client.h>

#include "pose_estimation/TrajectoryAction.h"
#include "pose_estimation/plan_service.h"



namespace uclv{
    template<typename V>
    geometry_msgs::TransformStamped set_pub_pose(std::string&& base_frame,std::string&& child_frame,const tf2::Vector3& position, const V& quaternion){
        geometry_msgs::TransformStamped goal_pose;
        goal_pose.header.stamp = ros::Time::now();
        goal_pose.header.frame_id = base_frame;
        goal_pose.child_frame_id = child_frame;

        goal_pose.transform.translation.x = position.getX();
        goal_pose.transform.translation.y = position.getY();
        goal_pose.transform.translation.z = position.getZ();


        goal_pose.transform.rotation.x = quaternion.x();
        goal_pose.transform.rotation.y = quaternion.y();
        goal_pose.transform.rotation.z = quaternion.z();
        goal_pose.transform.rotation.w = quaternion.w();

        return goal_pose;
        }

    tf2::Transform sim_scene(){
        
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
        santal_pose.orientation.w = 1.0;
        santal_pose.position.x = 0.4;

        tf2::Vector3 santal_position(santal_pose.position.x, santal_pose.position.y, santal_pose.position.z);
        tf2::Quaternion santal_ori(santal_pose.orientation.x, santal_pose.orientation.y, santal_pose.orientation.z, santal_pose.orientation.w);
        tf2::Transform santal_transform(santal_ori, santal_position);
      


        object_to_attach.meshes.push_back(mesh);
        object_to_attach.mesh_poses.push_back(santal_pose);
        object_to_attach.operation = object_to_attach.ADD;
        planning_scene_interface.applyCollisionObject(object_to_attach);

        
        /*tf2::Matrix3x3 end_effector_pose(1.0, 0.0, 0.0, 
                                        0.0, -1.0, 0.0, 
                                        0.0, 0.0, -1.0);
        tf2::Transform goal_transform(end_effector_pose, tf2::Vector3(santal_pose.position.x, santal_pose.position.y, santal_pose.position.z));*/
        std::vector<tf2::Vector3> offset_obj_frame{tf2::Vector3(0.15, 0, 0), tf2::Vector3(0, 0.15, 0), tf2::Vector3(0, 0, 0.15)};
        
        tf2::Matrix3x3 end_effector_pose_obj_frame(1.0, 0.0, 0.0, 
                                                   0.0, -1.0, 0.0, 
                                                   0.0, 0.0, -1.0);
        tf2::Transform goal_transform(end_effector_pose_obj_frame, offset_obj_frame[2]);

        //transform to be published on tf for visualization
        geometry_msgs::TransformStamped goal_pose = uclv::set_pub_pose("base_link", "goal_pose_z", (santal_transform * goal_transform).getOrigin(), (santal_transform * goal_transform).getRotation());
        static_broadcaster.sendTransform(goal_pose);

        end_effector_pose_obj_frame= tf2::Matrix3x3(1.0, 0.0, 0.0, 
                                                    0.0, 1.0, 0.0, 
                                                    0.0, 0.0, 1.0);
        goal_transform=tf2::Transform(end_effector_pose_obj_frame, -offset_obj_frame[2]);

        //transform to be published on tf for visualization
        goal_pose = uclv::set_pub_pose("base_link", "goal_pose_-z", (santal_transform * goal_transform).getOrigin(), (santal_transform * goal_transform).getRotation());
        static_broadcaster.sendTransform(goal_pose);

        end_effector_pose_obj_frame= tf2::Matrix3x3(1.0, 0.0, 0.0, 
                                                    0.0, 0.0, -1.0, 
                                                    0.0, 1.0, 0.0);
        goal_transform=tf2::Transform(end_effector_pose_obj_frame, offset_obj_frame[1]);

        //transform to be published on tf for visualization
        goal_pose = uclv::set_pub_pose("base_link", "goal_pose_y", (santal_transform * goal_transform).getOrigin(), (santal_transform * goal_transform).getRotation());
        static_broadcaster.sendTransform(goal_pose);

        end_effector_pose_obj_frame=tf2::Matrix3x3(1.0, 0.0, 0.0, 
                                                    0.0, 0.0, 1.0, 
                                                    0.0, -1.0, 0.0); 
        goal_transform=tf2::Transform(end_effector_pose_obj_frame, -offset_obj_frame[1]);

        //transform to be published on tf for visualization
        goal_pose = uclv::set_pub_pose("base_link", "goal_pose_-y", (santal_transform * goal_transform).getOrigin(), (santal_transform * goal_transform).getRotation());
        static_broadcaster.sendTransform(goal_pose);

         end_effector_pose_obj_frame= tf2::Matrix3x3(0.0, 0.0, -1.0, 
                                                    0.0, 1.0, 0.0, 
                                                    1.0, 0.0, 0.0);
        goal_transform=tf2::Transform(end_effector_pose_obj_frame, offset_obj_frame[0]);

        //transform to be published on tf for visualization
        goal_pose = uclv::set_pub_pose("base_link", "goal_pose_x", (santal_transform * goal_transform).getOrigin(), (santal_transform * goal_transform).getRotation());
        static_broadcaster.sendTransform(goal_pose);

        end_effector_pose_obj_frame= tf2::Matrix3x3(0.0, 0.0, 1.0, 
                                                    0.0, 1.0, 0.0, 
                                                    -1.0, 0.0, 0.0);
        goal_transform=tf2::Transform(end_effector_pose_obj_frame, -offset_obj_frame[0]);

        //transform to be published on tf for visualization
        goal_pose = uclv::set_pub_pose("base_link", "goal_pose_-x", (santal_transform * goal_transform).getOrigin(), (santal_transform * goal_transform).getRotation());
        static_broadcaster.sendTransform(goal_pose);
        
       
        /*
        std::vector<tf2::Vector3> offset_obj_frame{tf2::Vector3(0.15, 0, 0), tf2::Vector3(0, 0.15, 0), tf2::Vector3(0, 0, 0.15)};
        std::vector<tf2::Transform> pre_grasp_poses_obj_frame;
        
        int n_gripper_rotations=4;
        
        
        
        for(int i=0; i<3; i++){
            for(int j=0; j<n_gripper_attemps; j++){
                pre_grasp_poses_obj_frame[i] = santal_transform * goal_transform
                goal_pose = uclv::set_pub_pose("base_link", "goal_pose_z", (santal_transform * goal_transform).getOrigin(), (santal_transform * goal_transform).getRotation());
                pre_grasp_poses_obj_frame[i].setOrigin(-offset_obj_frame[i]);
                pre_grasp_poses_obj_frame[i].setRotation();
            
            }
        }*/
       
        

        return goal_transform;
    }

    geometry_msgs::Transform set_planning_request(const tf2::Vector3& position, const tf2::Quaternion& quaternion){

        geometry_msgs::Transform out_message;
        //set the rotation in the out message
        out_message.rotation.x = quaternion.x();
        out_message.rotation.y = quaternion.y();
        out_message.rotation.z = quaternion.z();
        out_message.rotation.w = quaternion.w();
        
        //set the position in the out message
        out_message.translation.x = position.getX();
        out_message.translation.y = position.getY();
        out_message.translation.z = position.getZ();

        return out_message;
    }

    tf2::Transform pre_grasp_strategy(tf2::Transform& goal_transform){

        tf2::Transform pre_grasp_transform(goal_transform.getRotation(), goal_transform.getOrigin()+tf2::Vector3(0,0,0.1));

    return pre_grasp_transform;

}

}



int main(int argc, char** argv){
    ros::init(argc, argv, "main_node");

    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<pose_estimation::plan_service>("plan_service");
    pose_estimation::plan_service srv;
    actionlib::SimpleActionClient<pose_estimation::TrajectoryAction> action_client("trajectory_action_server",true);

    //wait for the service to be up
    client.waitForExistence();
    
    //wait for action server
    action_client.waitForServer();

    pose_estimation::TrajectoryGoal trajectory_goal;
    bool simulation;
    n.getParam("simulation",simulation);
    static const std::string ARM = "yaskawa_arm";
    static tf2_ros::StaticTransformBroadcaster static_broadcaster;

    //message to the server
    geometry_msgs::Transform out_message;

    //message to be published on tf
    geometry_msgs::TransformStamped goal_pose;
    tf2::Transform grasp_pose;
    //if simulation is true build a fake scene
    if(simulation){
        
       grasp_pose=uclv::sim_scene();
        
    

    }
    //54mm most long side
    //upright 35mm
    //10mm shortest side
    //otherwise use the real goal pose
    /*else{
        
        grasp_pose=uclv::sim_scene();
    
    //set real goal pose

    }

    // Set pre-grasp, grasp and post-grasp poses
    tf2::Transform pre_grasp_pose = uclv::pre_grasp_strategy(grasp_pose);
    tf2::Transform post_grasp_pose=pre_grasp_pose;
    std::array<tf2::Transform, 3> task_poses{pre_grasp_pose, grasp_pose, post_grasp_pose}; 
    std::ostringstream out;

    for(int i=0; i<3; i++){
        //pose for planning
        out_message = uclv::set_planning_request(task_poses[i].getOrigin(), task_poses[i].getRotation());
       
        //out << it->first;

        //transform to be published on tf for visualization
        goal_pose = uclv::set_pub_pose("base_link", "goal_pose", task_poses[i].getOrigin(), task_poses[i].getRotation());
        static_broadcaster.sendTransform(goal_pose);

        srv.request.goal_transform = out_message;
        srv.request.planning_group = ARM;

        if (client.call(srv)){   
            ROS_INFO_STREAM("Calling server");

            if(srv.response.success){

                trajectory_goal.trajectory = srv.response.trajectory;
                ROS_INFO_STREAM("Returned path has: " << trajectory_goal.trajectory.joint_trajectory.points.size() << " points");
                
                if (!action_client.isServerConnected()){
                    ROS_ERROR_STREAM("Cannot reach trajectory server!" << action_client.getState().getText());
                }

                else {
                    action_client.sendGoal(trajectory_goal);

                    if (!action_client.waitForResult()){
                        ROS_INFO_STREAM("move_group_interface" << "ExecuteTrajectory action returned early" << action_client.getState().getText());
                    }

                    else {
                        if (action_client.getState() == actionlib::SimpleClientGoalState::SUCCEEDED){
                            ROS_INFO_STREAM("Trajectory executed succesfully");  
                            
                        }

                        else{
                            ROS_INFO_STREAM("move_group_interface" << action_client.getState().toString()<< ": " << action_client.getState().getText());
                            
                        }
                    }
                }
                    
            }

            else{
                ROS_ERROR_STREAM("Planning Failed");
                }
        }


        else{

            ROS_ERROR_STREAM("Failed to call service");
            return 1;
        }
    }*/
    return 0;

}

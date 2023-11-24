#include <tf2/LinearMath/Quaternion.h>
#include <tf2/LinearMath/Matrix3x3.h>
#include <tf2/LinearMath/Vector3.h>
#include <tf2/LinearMath/Transform.h>
#include <tf2_ros/transform_broadcaster.h>
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

#include <moveit_msgs/ExecuteTrajectoryAction.h>
#include "pose_estimation/plan_service.h"

template<typename V>
geometry_msgs::TransformStamped set_pub_pose(std::string&& base_frame,std::string&& child_frame, tf2::Vector3& position, V& quaternion){
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

tf2::Transform sim_function(){

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

    object_to_attach.meshes.push_back(mesh);
    object_to_attach.mesh_poses.push_back(santal_pose);
    object_to_attach.operation = object_to_attach.ADD;
    planning_scene_interface.applyCollisionObject(object_to_attach);

    tf2::Matrix3x3 end_effector_pose(1.0, 0.0, 0.0, 
                                    0.0, -1.0, 0.0, 
                                    0.0, 0.0, -1.0);
    tf2::Transform goal_transform(end_effector_pose, tf2::Vector3(santal_pose.position.x, santal_pose.position.y, santal_pose.position.z));
      ROS_INFO("in sim %f %f %f",goal_transform.getOrigin().getX(),goal_transform.getOrigin().getY(),goal_transform.getOrigin().getZ());
      ROS_INFO("in sim %f %f %f %f",goal_transform.getRotation().x(),goal_transform.getRotation().y(),goal_transform.getRotation().z(),goal_transform.getRotation().w());
    return goal_transform;
}

geometry_msgs::Transform set_planning_request(tf2::Vector3& position, tf2::Quaternion& quaternion){

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


int main(int argc, char** argv){
  ros::init(argc, argv, "main_node");
  
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<pose_estimation::plan_service>("plan_service");
  pose_estimation::plan_service srv;
  actionlib::SimpleActionClient<moveit_msgs::ExecuteTrajectoryAction>  action_client("execute_trajectory");

  //wait for the service to be up
  client.waitForExistence();
  
  moveit_msgs::ExecuteTrajectoryGoal trajectory_goal;
  bool simulation;
  n.getParam("simulation",simulation);
  static const std::string ARM = "yaskawa_arm";
  static tf2_ros::StaticTransformBroadcaster static_broadcaster;

  //message to the server
  geometry_msgs::Transform out_message;
  
  //message to be published on tf
  geometry_msgs::TransformStamped goal_pose;

  //goal position 
  tf2::Vector3 goal_position;
  tf2::Quaternion goal_quat;
  
  //if simulation is true build a fake scene 
  if(simulation){
    
        tf2::Transform goal_transform=sim_function();
        goal_position=goal_transform.getOrigin();
        ROS_INFO("after sim %f %f %f",goal_position.getX(),goal_position.getY(),goal_position.getZ());
        goal_quat=goal_transform.getRotation();
        ROS_INFO("after sim %f %f %f %f",goal_quat.x(),goal_quat.y(),goal_quat.z(),goal_quat.w());

    }

    //otherwise use the real robot
    else{




    }

    //when the server is ready send the goal and the planning group
    out_message = set_planning_request(goal_position, goal_quat);
    goal_pose = set_pub_pose("base_link", "goal_pose", goal_position, goal_quat);
    static_broadcaster.sendTransform(goal_pose);
    
    srv.request.goal_transform = out_message;
    srv.request.planning_group = ARM;
   
    
    if (client.call(srv)){   
        ROS_INFO_STREAM("Calling server");
    
        if(srv.response.success){
            moveit_msgs::RobotTrajectory planned_trajectory = srv.response.trajectory;
            ROS_INFO_STREAM("Returned path has: " << planned_trajectory.joint_trajectory.points.size() << " points");
            trajectory_goal.trajectory = planned_trajectory;
            
        
            if (!action_client.isServerConnected())
            {
                ROS_INFO_STREAM("ERROR");
            }
            
            action_client.sendGoal(trajectory_goal);
            
            if (!action_client.waitForResult())
            {
                ROS_INFO_STREAM_NAMED("move_group_interface", "ExecuteTrajectory action returned early");
            }
        
            if (action_client.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
            {
             ROS_INFO_STREAM("SUCCESSO");  
            }
            else
            {
                ROS_INFO_STREAM("move_group_interface" << action_client.getState().toString()<< ": " << action_client.getState().getText());
                
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

    return 0;

    }
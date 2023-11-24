#include <moveit/move_group_interface/move_group_interface.h>
#include <tf2_ros/transform_listener.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2/LinearMath/Matrix3x3.h>
#include <tf2/LinearMath/Vector3.h>
#include <tf2/LinearMath/Transform.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>

#include "pose_estimation/plan_service.h"

// The circle constant tau = 2*pi. One tau is one rotation in radians.

template<typename V>
geometry_msgs::Pose create_planning_goal(tf2::Vector3 position, V quaternion){

geometry_msgs::Pose target_pose;
target_pose.orientation.w = quaternion.w();
target_pose.orientation.x = quaternion.x();
target_pose.orientation.y = quaternion.y();
target_pose.orientation.z = quaternion.z();
target_pose.position.x = position.getX();
target_pose.position.y = position.getY();
target_pose.position.z = position.getZ();

return target_pose;


}


tf2::Transform link_t_goal_pose(tf2_ros::Buffer& tfBuffer,tf2::Vector3& base_to_goal_vec3,tf2::Quaternion& base_to_goal_quat ){

tfBuffer.canTransform("grasp", "link_t", ros::Time::now(),ros::Duration(3));

//gives the pose for the second frame in the first coordinate system 
geometry_msgs::TransformStamped transformStamped = tfBuffer.lookupTransform("link_t", "ee_fingers", ros::Time(0));
tf2::Quaternion link_t_to_grasp_quat(transformStamped.transform.rotation.x,
                         transformStamped.transform.rotation.y,
                         transformStamped.transform.rotation.z,
                         transformStamped.transform.rotation.w);

tf2::Vector3 link_t_to_grasp_vec3(transformStamped.transform.translation.x, transformStamped.transform.translation.y, transformStamped.transform.translation.z);
tf2::Transform link_t_to_grasp(link_t_to_grasp_quat, link_t_to_grasp_vec3);
 

tf2::Transform base_to_goal(base_to_goal_quat, base_to_goal_vec3);

tf2::Transform base_to_t=base_to_goal*link_t_to_grasp.inverse();
return base_to_t;

}


bool plan_service(pose_estimation::plan_service::Request  &req, pose_estimation::plan_service::Response &res)
{ 
  
  ROS_INFO_STREAM("Starting executin server");
  //set the movegroups base don the name passed by the client
  moveit::planning_interface::MoveGroupInterface move_group_interface(req.planning_group);
  move_group_interface.setPlanningTime(10.0);
  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  
  //transform the geometry message in tf2 to make calculations
  geometry_msgs::Transform end_effector_desidered_pose(req.goal_transform);
  ROS_INFO("%f %f %f %f",req.goal_transform.rotation.x,req.goal_transform.rotation.y,req.goal_transform.rotation.z,req.goal_transform.rotation.w);
  tf2::Quaternion goal_quat(req.goal_transform.rotation.x, 
                            req.goal_transform.rotation.y, 
                            req.goal_transform.rotation.z, 
                            req.goal_transform.rotation.w);

  tf2::Vector3 goal_pos(req.goal_transform.translation.x,
                          req.goal_transform.translation.y,
                          req.goal_transform.translation.z);


  //transform an end-effector goal into a link_t goal since moveit planns as link_t were the end effector
  tf2_ros::Buffer tfBuffer;
  tf2_ros::TransformListener tfListener(tfBuffer);

  //goal pose for the link_t
  tf2::Transform base_to_t=link_t_goal_pose(tfBuffer, goal_pos, goal_quat);
  tf2::Quaternion base_to_t_quat=base_to_t.getRotation();
  
  //convert the tf2 structur einto a gemetry_msgs one sincmoveit wants the last one
  geometry_msgs::Pose goal_pose=create_planning_goal(base_to_t.getOrigin(),base_to_t.getRotation());
  move_group_interface.setPoseTarget(goal_pose);

  bool success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
  res.success=success;
  res.trajectory=my_plan.trajectory_;
  
  return true;
}


int main(int argc, char** argv)
{
  ros::init(argc, argv, "Planning_node");
  ros::NodeHandle n;
  
  ros::ServiceServer service = n.advertiseService("plan_service", plan_service);
  ROS_INFO("Planning service up");
  ros::AsyncSpinner spinner(2); 
  spinner.start();
  while(ros::ok());
}
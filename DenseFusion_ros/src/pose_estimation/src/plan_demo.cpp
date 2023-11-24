#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <Eigen/Geometry>
#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/DisplayTrajectory.h>
#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>
#include <tf2_ros/transform_listener.h>

#include <moveit_visual_tools/moveit_visual_tools.h>
#include "geometric_shapes/shapes.h"
#include "geometric_shapes/mesh_operations.h"
#include "geometric_shapes/shape_operations.h"

#include <tf2/LinearMath/Quaternion.h>
#include <tf2/LinearMath/Matrix3x3.h>
#include <tf2/LinearMath/Vector3.h>
#include <tf2/LinearMath/Transform.h>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2_ros/static_transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>

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


template<typename V>
geometry_msgs::TransformStamped set_pub_pose(std::string&& base_frame,std::string&& child_frame, tf2::Vector3 position, V quaternion){
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

int main(int argc, char** argv)
{
  ros::init(argc, argv, "Planning_node");
  ros::NodeHandle node_handle;
 
  static tf2_ros::StaticTransformBroadcaster static_broadcaster;
  ros::AsyncSpinner spinner(1);
  spinner.start();
  static const std::string PLANNING_GROUP = "yaskawa_arm";
   moveit_visual_tools::MoveItVisualTools visual_tools("base_link");
  
  moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const moveit::core::JointModelGroup* joint_model_group =
      move_group_interface.getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  
  
  std::vector<std::string> joint_names = move_group_interface.getVariableNames();
  moveit::core::RobotState start_state(* move_group_interface.getCurrentState());

  
  move_group_interface.setPlanningTime(10.0);
  
  moveit_msgs::CollisionObject object_to_attach;
  object_to_attach.id = "santal";

  shapes::Mesh* m = shapes::createMeshFromResource("file:///mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset/santal_ace/santal_centered.obj",Eigen::Vector3d(1e-3,1e-3,1e-3));
  shape_msgs::Mesh mesh;
  shapes::ShapeMsg mesh_msg;
  shapes::constructMsgFromShape(m, mesh_msg);
  mesh = boost::get<shape_msgs::Mesh>(mesh_msg);

  // We define the frame/pose for this cylinder so that it appears in the gripper
  object_to_attach.header.frame_id = "base_link";
  geometry_msgs::Pose santal_pose;
  santal_pose.orientation.w = 1.0;
  santal_pose.position.x = 0.4;

  // First, we add the object to the world (without using a vector)
  object_to_attach.meshes.push_back(mesh);
  object_to_attach.mesh_poses.push_back(santal_pose);
  object_to_attach.operation = object_to_attach.ADD;
  planning_scene_interface.applyCollisionObject(object_to_attach);
  
  tf2::Matrix3x3 end_effector_pose(1, 0, 0, 0, -1, 0, 0, 0, -1);
  tf2::Quaternion goal_quat;
  end_effector_pose.getRotation(goal_quat);
  tf2::Vector3 santal_pos(santal_pose.position.x,santal_pose.position.y,santal_pose.position.z);
  geometry_msgs::TransformStamped goal_pose = set_pub_pose("base_link","goal_pose",santal_pos,goal_quat);
  static_broadcaster.sendTransform(goal_pose);
/**************PRE-GRASP PLANNING****************/

tf2_ros::Buffer tfBuffer;
tf2_ros::TransformListener tfListener(tfBuffer);
tf2::Quaternion base_to_pregrasp_quat(goal_quat.x(),goal_quat.y(),goal_quat.z(),goal_quat.w());
tf2::Vector3 base_to_pregrasp_vec3(santal_pose.position.x,santal_pose.position.y,santal_pose.position.z+0.1);
tf2::Transform base_to_t_pregrasp=link_t_goal_pose(tfBuffer, base_to_pregrasp_vec3, base_to_pregrasp_quat);

tf2::Quaternion base_to_t_quat=base_to_t_pregrasp.getRotation();
goal_pose=set_pub_pose< tf2::Quaternion >("world", "pregrasp",base_to_pregrasp_vec3 , base_to_pregrasp_quat);
static_broadcaster.sendTransform(goal_pose);

geometry_msgs::Pose pregrasp_pose=create_planning_goal(base_to_t_pregrasp.getOrigin(),base_to_t_pregrasp.getRotation());
move_group_interface.setPoseTarget(pregrasp_pose);

moveit::planning_interface::MoveGroupInterface::Plan my_plan;
bool success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
move_group_interface.execute(my_plan);
/******************************/

/**************GRASP PLANNING****************/
tf2::Quaternion base_to_goal_quat(goal_quat.x(),goal_quat.y(),goal_quat.z(),goal_quat.w());
tf2::Vector3 base_to_goal_vec3(santal_pose.position.x,santal_pose.position.y,santal_pose.position.z);
tf2::Transform base_to_t=link_t_goal_pose(tfBuffer, base_to_goal_vec3, base_to_goal_quat);
geometry_msgs::Pose target_pose=create_planning_goal(base_to_t.getOrigin(),base_to_t.getRotation());
move_group_interface.setPoseTarget(target_pose);

success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
move_group_interface.execute(my_plan);
/******************************/

/**************POST-GRASP PLANNING****************/

move_group_interface.setPoseTarget(pregrasp_pose);
success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
move_group_interface.execute(my_plan);
/******************************/



}
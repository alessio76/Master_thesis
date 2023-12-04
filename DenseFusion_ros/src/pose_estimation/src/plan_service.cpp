#include <moveit/move_group_interface/move_group_interface.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>

#include <pose_estimation/utils.h>
#include "pose_estimation/plan_service.h"

// The circle constant tau = 2*pi. One tau is one rotation in radians.
namespace uclv{

  bool plan_service(pose_estimation::plan_service::Request  &req, pose_estimation::plan_service::Response &res){ 
    
    ROS_INFO_STREAM("Starting executin server");
    //set the movegroups base don the name passed by the client
    moveit::planning_interface::MoveGroupInterface move_group_interface(req.planning_group);
    move_group_interface.setPlanningTime(5.0);
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
   
    Eigen::Quaternionf goal_quat(req.goal_transform.transform.rotation.w, 
                              req.goal_transform.transform.rotation.x, 
                              req.goal_transform.transform.rotation.y, 
                              req.goal_transform.transform.rotation.z);

    Eigen::Vector3f goal_pos(req.goal_transform.transform.translation.x,
                            req.goal_transform.transform.translation.y,
                            req.goal_transform.transform.translation.z);


    //transform an end-effector goal into a link_t goal since moveit planns as link_t were the end effector
    tf2_ros::Buffer tfBuffer;
    tf2_ros::TransformListener tfListener(tfBuffer);

    //goal pose for the link_t
    Eigen::Isometry3f base_to_t = link_t_goal_pose(tfBuffer, goal_pos, goal_quat);
    Eigen::Quaternionf base_to_t_quat = Eigen::Quaternionf(base_to_t.rotation());
    
    //convert the tf2 structur einto a gemetry_msgs one sincmoveit wants the last one
    geometry_msgs::Pose goal_pose = eigen_to_Pose(base_to_t.translation(), Eigen::Quaternionf(base_to_t.rotation()));
    move_group_interface.setPoseTarget(goal_pose);

    bool success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
    res.success=success;
    res.trajectory=my_plan.trajectory_;
    
    return true;
  }
}

int main(int argc, char** argv)
  {
    ros::init(argc, argv, "Planning_node");
    ros::NodeHandle n;
    
    ros::ServiceServer service = n.advertiseService("plan_service", uclv::plan_service);
    ROS_INFO("Planning service up");
    ros::AsyncSpinner spinner(2); 
    spinner.start();
    while(ros::ok());
  }
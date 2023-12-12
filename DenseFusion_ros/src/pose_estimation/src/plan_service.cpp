#include <moveit/move_group_interface/move_group_interface.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>

#include <pose_estimation/utils.h>
#include "pose_estimation/plan_service.h"

bool simulation;

// The circle constant tau = 2*pi. One tau is one rotation in radians.
namespace uclv{
   bool cartesian_path_planner(moveit_msgs::RobotTrajectory &trajectory, std::vector<geometry_msgs::Pose> &target_poses, moveit::planning_interface::MoveGroupInterface& move_group){

    const double jump_threshold = 0.0;
    const double eef_step = 0.01;
    double fraction = move_group.computeCartesianPath(target_poses, eef_step, jump_threshold, trajectory);
    if (fraction == 1){
        return true;
    }
    else{
        return false;
    }
  }

  bool plan_service(pose_estimation::plan_service::Request  &req, pose_estimation::plan_service::Response &res){ 
    
    ROS_INFO_STREAM("Starting executin server");
    //set the movegroups base don the name passed by the client
    moveit::planning_interface::MoveGroupInterface move_group_interface(req.planning_group);
    move_group_interface.setPlanningTime(10.0);
    move_group_interface.setMaxVelocityScalingFactor(0.05);
    move_group_interface.setMaxAccelerationScalingFactor(0.05);
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    moveit_msgs::RobotTrajectory trajectory;
    bool success;

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
    geometry_msgs::Pose goal_pose = eigen_to_Pose(base_to_t.translation(), Eigen::Quaternionf(base_to_t.rotation()));
    moveit::core::RobotState start_state(*move_group_interface.getCurrentState());
    start_state.setJointGroupPositions(req.planning_group, req.start_state);
    move_group_interface.setStartState(start_state);

    if(req.attach_obj_id.size() > 0)
      move_group_interface.attachObject(req.attach_obj_id, "ee_fingers", { "tactile_1", "tactile_2" });


    if(req.planning_space == "joint"){

    //convert the tf2 structure into a geometry_msgs one since moveit wants a pose
    move_group_interface.setPoseTarget(goal_pose);
    success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
    trajectory = my_plan.trajectory_;
    }

    else if(req.planning_space == "cartesian"){
        std::vector<geometry_msgs::Pose> target_poses;
        target_poses.push_back(goal_pose);
        success = cartesian_path_planner(trajectory, target_poses, move_group_interface);
    }

    res.success=success;
    res.trajectory=trajectory;
    if(req.attach_obj_id.size() > 0)
      move_group_interface.detachObject(req.attach_obj_id);
    return true;
  }

}

int main(int argc, char** argv)
  {
    ros::init(argc, argv, "Planning_node");
    ros::NodeHandle n;
    n.getParam("simulation",simulation);
    ros::ServiceServer service = n.advertiseService("plan_service", uclv::plan_service);
    ROS_INFO("Planning service up");
    ros::AsyncSpinner spinner(2); 
    spinner.start();
    while(ros::ok());
  }
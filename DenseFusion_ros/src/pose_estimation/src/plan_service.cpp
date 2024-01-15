#include <moveit/move_group_interface/move_group_interface.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>

#include <pose_estimation/utils.h>
#include "pose_estimation/plan_service.h"


std::string end_effector_frame_name;
double max_planning_time;
std::string planner_id;
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
    move_group_interface.setPlanningTime(max_planning_time);
    move_group_interface.setPlannerId(planner_id);
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

    if(req.attach){
      move_group_interface.attachObject(req.attach_obj_id, end_effector_frame_name, { "tactile_1", "tactile_2" });
    }

    
    //goal pose for the link_t
    Eigen::Isometry3f base_to_t = link_t_goal_pose(tfBuffer, goal_pos, goal_quat, end_effector_frame_name);
    Eigen::Quaternionf base_to_t_quat = Eigen::Quaternionf(base_to_t.rotation());
    geometry_msgs::Pose goal_pose = eigen_to_Pose(base_to_t.translation(), Eigen::Quaternionf(base_to_t.rotation()));
    moveit::core::RobotState start_state(*move_group_interface.getCurrentState());
    start_state.setJointGroupPositions(req.planning_group, req.start_state);
    move_group_interface.setStartState(start_state);
   
    if(req.planning_type == "joint" && req.goal_joint.size() >0){
    //convert the tf2 structure into a geometry_msgs one since moveit wants a pose
      move_group_interface.setJointValueTarget(req.goal_joint);
      success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
      trajectory = my_plan.trajectory_;
    }

    else if(req.planning_type == "joint" && req.goal_joint.size() == 0){
      move_group_interface.setPoseTarget(goal_pose);
      success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
      trajectory=my_plan.trajectory_;

    }

    else if(req.planning_type == "cartesian"){
      /*geometry_msgs::PoseStamped inital_pose = move_group_interface.getCurrentPose();
      Eigen::Vector3f initial_pos(inital_pose.pose.position.x, inital_pose.pose.position.y, inital_pose.pose.position.z);
      Eigen::Quaternionf initial_quat(inital_pose.pose.orientation.w, inital_pose.pose.orientation.x, inital_pose.pose.orientation.y, inital_pose.pose.orientation.z);
      std::vector<geometry_msgs::Pose> target_poses = get_linear_path(base_to_t, 10, initial_pos, initial_quat);*/
      std::vector<geometry_msgs::Pose> target_poses;
      target_poses.push_back(goal_pose);
      success = cartesian_path_planner(trajectory, target_poses, move_group_interface);
    }
    
    res.success=success;
    res.trajectory=trajectory;

    if(req.detach)
      move_group_interface.detachObject(req.attach_obj_id);
    return true;
  }

}

int main(int argc, char** argv){
    ros::init(argc, argv, "Planning_node");
    ros::NodeHandle n;
    ros::ServiceServer service = n.advertiseService("plan_service", uclv::plan_service);
    n.getParam("end_effector_frame_name",end_effector_frame_name);
    n.getParam("planner_id",planner_id);
    n.getParam("max_planning_time",max_planning_time);
    ROS_INFO("Planning service up");
    ros::AsyncSpinner spinner(2); 
    spinner.start();
    while(ros::ok());
  }
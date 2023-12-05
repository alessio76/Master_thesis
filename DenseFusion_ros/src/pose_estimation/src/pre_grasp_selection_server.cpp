#include <moveit/move_group_interface/move_group_interface.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2_ros/static_transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>

#include <pose_estimation/utils.h>
#include <pose_estimation/grasp_policies.h>
#include "pose_estimation/pre_grasp_service.h"

float pre_grasp_offset;
// The circle constant tau = 2*pi. One tau is one rotation in radians.
namespace uclv{
  
  pose_estimation::pre_grasp_service::Response pre_grasp_strategy(const Eigen::Isometry3f& obj_pose_world_frame, const std::string& planning_group){
    moveit::planning_interface::MoveGroupInterface move_group_interface(planning_group);
    move_group_interface.setPlanningTime(0.1);
    bool debug=true;

    pose_estimation::pre_grasp_service::Response res;

    static tf2_ros::StaticTransformBroadcaster static_broadcaster;
    bool success = false;
        
    geometry_msgs::TransformStamped pre_grasp_pose;

    res = uclv::first_hit(debug, move_group_interface, obj_pose_world_frame, pre_grasp_offset);

    /*for(int i=0; i < n_base_frames;i++){
        for(int j=0; j < n_gripper_rotations;j++){
            //transform the candidate pose to base frame
            Eigen::Isometry3f pre_grasp = obj_pose_world_frame * pre_grasp_base_poses_obj_frame[i] * Eigen::AngleAxisf((M_PI*j)/2, Eigen::Vector3f::UnitZ());
            pre_grasp_pose = uclv::eigen_to_TransformedStamped("base_link", out.str(),  pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));
            //static_broadcaster.sendTransform(goal_pose);
        }
      
    }*/

    return res;
  }


  bool pre_grasp_service(pose_estimation::pre_grasp_service::Request& req, pose_estimation::pre_grasp_service::Response& res)
  { 
    
    ROS_INFO_STREAM("Starting executing pre_grasp callback");
    
    Eigen::Quaternionf obj_quat( req.object_pose.transform.rotation.w, 
                                 req.object_pose.transform.rotation.x, 
                                 req.object_pose.transform.rotation.y, 
                                 req.object_pose.transform.rotation.z);

    Eigen::Vector3f obj_pos( req.object_pose.transform.translation.x,
                             req.object_pose.transform.translation.y,
                             req.object_pose.transform.translation.z);

    pose_estimation::pre_grasp_service::Response calculated_res = pre_grasp_strategy(Eigen::Isometry3f(Eigen::Translation3f(obj_pos) * obj_quat), req.planning_group);
    res.success = calculated_res.success;
    res.pre_grasp_pose = calculated_res.pre_grasp_pose;

  
    return true;
  }
}

int main(int argc, char** argv){
    ros::init(argc, argv, "Pregrasp_node");
    ros::NodeHandle n;
    n.getParam("pre_grasp_offset_name",pre_grasp_offset);
    ros::ServiceServer service = n.advertiseService("pre_grasp_service", uclv::pre_grasp_service);
    ROS_INFO("Pre_grasp service up");
    ros::AsyncSpinner spinner(2); 
    spinner.start();
    while(ros::ok());
  }
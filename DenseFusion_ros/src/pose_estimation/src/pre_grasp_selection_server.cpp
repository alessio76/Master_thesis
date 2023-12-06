#include <moveit/move_group_interface/move_group_interface.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2_ros/static_transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>

#include <pose_estimation/utils.h>
#include "pose_estimation/pre_grasp_policies.h"
#include "pose_estimation/pre_grasp_service.h"

float pre_grasp_offset;
// The circle constant tau = 2*pi. One tau is one rotation in radians.
namespace uclv{

  bool pre_grasp_service(pose_estimation::pre_grasp_service::Request& req, pose_estimation::pre_grasp_service::Response& res){

    ROS_INFO_STREAM("Starting executing pre_grasp callback");
    
    bool debug=false;
    uclv::PreGraspPolicies grasp_function_selector(pre_grasp_offset, req.planning_group, debug);
    
    Eigen::Quaternionf obj_quat( req.object_pose.transform.rotation.w, 
                                 req.object_pose.transform.rotation.x, 
                                 req.object_pose.transform.rotation.y, 
                                 req.object_pose.transform.rotation.z);

    Eigen::Vector3f obj_pos( req.object_pose.transform.translation.x,
                             req.object_pose.transform.translation.y,
                             req.object_pose.transform.translation.z);

    res = grasp_function_selector.best_hit(Eigen::Isometry3f(Eigen::Translation3f(obj_pos) * obj_quat));

  
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
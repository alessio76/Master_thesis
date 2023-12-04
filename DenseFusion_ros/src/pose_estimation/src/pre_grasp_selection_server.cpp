#include <moveit/move_group_interface/move_group_interface.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2_ros/static_transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>

#include <pose_estimation/utils.h>
#include "pose_estimation/pre_grasp_service.h"

// The circle constant tau = 2*pi. One tau is one rotation in radians.
namespace uclv{
  
  pose_estimation::pre_grasp_service::Response pre_grasp_strategy(const Eigen::Isometry3f& obj_pose_world_frame, const std::string& planning_group){
    moveit::planning_interface::MoveGroupInterface move_group_interface(planning_group);
    move_group_interface.setPlanningTime(0.1);
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    pose_estimation::pre_grasp_service::Response res;

    tf2_ros::Buffer tfBuffer;
    tf2_ros::TransformListener tfListener(tfBuffer);


    float offset = 0.15;
    static tf2_ros::StaticTransformBroadcaster static_broadcaster;

    //number of base frame to start selection the pre_grasp pose
    const int n_base_frames=6;

    //number of rotation to modify the base pre_grasp pose
    const int n_gripper_rotations = 4;

    Eigen::Matrix3f matrix_x;
        matrix_x << 0.0, 0.0, -1.0, 
                    0.0, 1.0, 0.0, 
                    1.0, 0.0, 0.0;

        Eigen::Matrix3f matrix_minus_x;
        matrix_minus_x << 0.0, 0.0, 1.0, 
                          0.0, 1.0, 0.0, 
                          -1.0, 0.0, 0.0;

        Eigen::Matrix3f matrix_y;
        matrix_y << 1.0, 0.0, 0.0, 
                    0.0, 0.0, -1.0, 
                    0.0, 1.0, 0.0;

        Eigen::Matrix3f matrix_minus_y;
        matrix_minus_y << 1.0, 0.0, 0.0, 
                          0.0, 0.0, 1.0, 
                          0.0, -1.0, 0.0;

        Eigen::Matrix3f matrix_z;
        matrix_z << 1.0, 0.0, 0.0, 
                    0.0, -1.0, 0.0, 
                    0.0, 0.0, -1.0;

        Eigen::Matrix3f matrix_minus_z;
        matrix_minus_z << 1.0, 0.0, 0.0, 
                          0.0, 1.0, 0.0, 
                          0.0, 0.0, 1.0;

        
     std::array<Eigen::Isometry3f, n_base_frames> pre_grasp_base_poses_obj_frame{
        Eigen::Translation3f(offset * Eigen::Vector3f::UnitX()) * Eigen::Quaternionf(matrix_x),  //x
        Eigen::Translation3f(-offset *Eigen::Vector3f::UnitX()) * Eigen::Quaternionf(matrix_minus_x),  //-x
        Eigen::Translation3f(offset * Eigen::Vector3f::UnitY()) * Eigen::Quaternionf(matrix_y),  //y
        Eigen::Translation3f(-offset * Eigen::Vector3f::UnitY()) * Eigen::Quaternionf(matrix_minus_y),  //-y
        Eigen::Translation3f(offset * Eigen::Vector3f::UnitZ()) * Eigen::Quaternionf(matrix_z),  //z
        Eigen::Translation3f(-offset * Eigen::Vector3f::UnitY()) * Eigen::Quaternionf(matrix_minus_z)  //-z
        
    };

    //the output pose is in base frame
    std::array<Eigen::Isometry3f, n_base_frames * n_gripper_rotations> pre_grasp_pose_base_frame;
         int i = 0;
         int j = 0;
         bool success = false;
         std::ostringstream out;
        geometry_msgs::TransformStamped pre_grasp_pose;

        while(i < n_base_frames && !success){
            while(j < n_gripper_rotations && !success){
                out << "goal_pose_" << i << '_' << j;

                //transform the candidate pose to base frame
                Eigen::Isometry3f pre_grasp = obj_pose_world_frame * pre_grasp_base_poses_obj_frame[i] * Eigen::AngleAxisf((M_PI*j)/2, Eigen::Vector3f::UnitZ());
                //static_broadcaster.sendTransform(goal_pose);

                //translate the candidate to link_t since the pianificatio is done on link_t
                Eigen::Isometry3f base_to_t = link_t_goal_pose(tfBuffer, pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));

                //transform to geometry_msgs::Pose
                geometry_msgs::Pose plan_pose = uclv::eigen_to_Pose(base_to_t.translation(), Eigen::Quaternionf(base_to_t.rotation()));

                //actually do the plannig
                move_group_interface.setPoseTarget(plan_pose);
                success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);

                //if the plan is successfull save the candidate pose
                if(success) 
                  pre_grasp_pose = uclv::eigen_to_TransformedStamped("base_link", out.str(),  pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));
                
                //else continue the search          
                j++;
            }
            j=0;
            i++;
        }

        res.pre_grasp_pose = pre_grasp_pose;
        res.success = success;

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

int main(int argc, char** argv)
  {
    ros::init(argc, argv, "Pregrasp_node");
    ros::NodeHandle n;
    ros::ServiceServer service = n.advertiseService("pre_grasp_service", uclv::pre_grasp_service);
    ROS_INFO("Pre_grasp service up");
    ros::AsyncSpinner spinner(2); 
    spinner.start();
    while(ros::ok());
  }
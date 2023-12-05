#include "pose_estimation/grasp_policies.h"

namespace uclv{

pose_estimation::pre_grasp_service::Response first_hit(bool debug, moveit::planning_interface::MoveGroupInterface& move_group_interface, const Eigen::Isometry3f& obj_pose_world_frame, float pre_grasp_offset){
    
    bool success = false;
    std::ostringstream out;
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    pose_estimation::pre_grasp_service::Response out_res;
    int i=0;
    int j=0;
    uclv::PreGraspBasePoses BaseObjPoses(pre_grasp_offset);
    static tf2_ros::StaticTransformBroadcaster static_broadcaster;
    geometry_msgs::TransformStamped pre_grasp_pose;

    while(i < uclv::PreGraspBasePoses::N_BASE_FRAMES && !success){
        while(j < uclv::PreGraspBasePoses::N_GRIPPER_ROTATIONS && !success){
            //transform the candidate pose to base frame
            Eigen::Isometry3f pre_grasp = obj_pose_world_frame * BaseObjPoses.pre_grasp_base_poses_obj_frame[i] * Eigen::AngleAxisf((M_PI*j)/2, Eigen::Vector3f::UnitZ());
            
            tf2_ros::Buffer tfBuffer;
            tf2_ros::TransformListener tfListener(tfBuffer);
            //translate the candidate to link_t since the pianificatio is done on link_t
            Eigen::Isometry3f base_to_t = uclv::link_t_goal_pose(tfBuffer, pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));

            //transform to geometry_msgs::Pose
            geometry_msgs::Pose plan_pose = uclv::eigen_to_Pose(base_to_t.translation(), Eigen::Quaternionf(base_to_t.rotation()));
              
            if(debug){
                out.clear();
                out.seekp(0);
                out << "goal_pose_" << i << '_' << j;
                geometry_msgs::TransformStamped goal_pose = uclv::eigen_to_TransformedStamped("base_link", out.str(), pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));
                static_broadcaster.sendTransform(goal_pose);
            }

            //actually do the plannig
            move_group_interface.setPoseTarget(plan_pose);
            success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);

            //if the plan is successfull save the candidate pose
            if(success) 
                pre_grasp_pose = uclv::eigen_to_TransformedStamped("base_link", out.str(), pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));
            
            //else continue the search          
            j++;
        }
        j=0;
        i++;
    }

    out_res.pre_grasp_pose = pre_grasp_pose;
    out_res.success = success;
    return out_res;
    
}


pose_estimation::pre_grasp_service::Response best_hit(bool debug, moveit::planning_interface::MoveGroupInterface& move_group_interface, const Eigen::Isometry3f& obj_pose_world_frame, float pre_grasp_offset){
    }
}





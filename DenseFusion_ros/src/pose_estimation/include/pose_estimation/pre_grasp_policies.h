#ifndef GRASP_H
#define GRASP_H

#include "pose_estimation/pre_grasp_base_poses.h"


namespace uclv{

class PreGraspPolicies{

    private:
        bool success = false;
        std::ostringstream out;
        moveit::planning_interface::MoveGroupInterface::Plan my_plan;
        pose_estimation::pre_grasp_service::Response out_res;
        uclv::PreGraspBasePoses BaseObjPoses;
        tf2_ros::StaticTransformBroadcaster static_broadcaster;
        geometry_msgs::TransformStamped pre_grasp_pose;
        tf2_ros::Buffer tfBuffer;
        tf2_ros::TransformListener tfListener;
        bool debug=false;
        moveit::planning_interface::MoveGroupInterface move_group_interface;
        void visualize_frames(const Eigen::Isometry3f& pre_grasp, int i, int j);

    public:

        PreGraspPolicies(float pre_grasp_offset, const std::string& move_group, bool debug);

        /*
        This function simply generates all the pregrasp poses and gives as result the first feasible
        */
        pose_estimation::pre_grasp_service::Response first_hit(const Eigen::Isometry3f& obj_pose_world_frame);
        
        
        /*
        This function first generates all the poses and then selects as output the pose with the min angular and linear distance from the current end effector frame position.
        Computes the distance between the origins and an angle axis representation of the transform from end effector to pregrasp: then sum the distance to the angle/10 
        calculated on the angle axis form. This is done to account the distance between the frames and the rotation needed to allign them.
        */
        pose_estimation::pre_grasp_service::Response best_hit(const Eigen::Isometry3f& obj_pose_world_frame);
    };
}


#endif
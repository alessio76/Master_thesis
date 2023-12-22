#ifndef GRASP_H
#define GRASP_H

#include "pose_estimation/pre_grasp_base_poses.h"


namespace uclv{

class PreGraspPolicies{

    private:
        bool success = false;
        std::ostringstream out;
        std::string end_effector_frame_name;
        std::string goal_frame_name;
        std::string base_frame_name;
        moveit::planning_interface::MoveGroupInterface::Plan my_plan;
        pose_estimation::pre_grasp_service::Response out_res;
        uclv::PreGraspBasePoses BaseObjPoses;
        tf2_ros::StaticTransformBroadcaster static_broadcaster;
        geometry_msgs::TransformStamped pre_grasp_pose;
        tf2_ros::Buffer tfBuffer;
        tf2_ros::TransformListener tfListener;
        bool debug=false;
        moveit::planning_interface::MoveGroupInterface move_group_interface;
        //gripper widths in mm, along object axis. They represent the distance between the fingers
        //must be divided by 2 if used in simulation
        std::map<std::string, float> gripper_widths;
        float desidered_force;
        void visualize_frames(const Eigen::Isometry3f& pre_grasp, int i, int j);
        float gripper_width_selection(const Eigen::Matrix3f& pre_grasp_rot, const Eigen::Matrix3f& obj_rot);

    public:

        PreGraspPolicies(float pre_grasp_offset, const std::string& move_group, bool debug, float on_x, float on_y, float on_z, float desidered_force, const std::string& end_effector_frame_name, const std::string& goal_frame_name, const std::string& base_frame_name,
        const std::vector<double>& start_joints);

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

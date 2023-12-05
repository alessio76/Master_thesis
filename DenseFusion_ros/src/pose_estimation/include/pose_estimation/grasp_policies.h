#ifndef GRASP_H
#define GRASP_H

#include "pose_estimation/pre_grasp_service.h"
#include "pose_estimation/utils.h"
#include <tf2_ros/static_transform_broadcaster.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <geometry_msgs/TransformStamped.h>



namespace uclv{

class PreGraspBasePoses{

    public:

        //number of base frame to start selection the pre_grasp pose
        static const int N_BASE_FRAMES = 6;

        //number of rotation to modify the base pre_grasp pose
        static const int N_GRIPPER_ROTATIONS = 4;

        Eigen::Matrix3f matrix_x;
        Eigen::Matrix3f matrix_minus_x;
        Eigen::Matrix3f matrix_y;
        Eigen::Matrix3f matrix_minus_y;
        Eigen::Matrix3f matrix_z;
        Eigen::Matrix3f matrix_minus_z;

        std::array<Eigen::Isometry3f, N_BASE_FRAMES> pre_grasp_base_poses_obj_frame;


        PreGraspBasePoses(float pre_grasp_offset){
        
            matrix_x << 0.0, 0.0, -1.0, 
                        0.0, 1.0, 0.0, 
                        1.0, 0.0, 0.0;
            this->pre_grasp_base_poses_obj_frame[0] = Eigen::Translation3f(pre_grasp_offset * Eigen::Vector3f::UnitX()) * Eigen::Quaternionf(matrix_x);  //x

            matrix_minus_x << 0.0, 0.0, 1.0, 
                              0.0, 1.0, 0.0, 
                              -1.0, 0.0, 0.0;
            this->pre_grasp_base_poses_obj_frame[1] = Eigen::Translation3f(-pre_grasp_offset * Eigen::Vector3f::UnitX()) * Eigen::Quaternionf(matrix_minus_x);  //-x

            matrix_y << 1.0, 0.0, 0.0, 
                        0.0, 0.0, -1.0, 
                        0.0, 1.0, 0.0;
            this->pre_grasp_base_poses_obj_frame[2] = Eigen::Translation3f(pre_grasp_offset * Eigen::Vector3f::UnitY()) * Eigen::Quaternionf(matrix_y);  //y

            matrix_minus_y << 1.0, 0.0, 0.0, 
                              0.0, 0.0, 1.0, 
                              0.0, -1.0, 0.0;
            this->pre_grasp_base_poses_obj_frame[3] = Eigen::Translation3f(-pre_grasp_offset * Eigen::Vector3f::UnitY()) * Eigen::Quaternionf(matrix_minus_y);  //-y

            matrix_z << 1.0, 0.0, 0.0, 
                        0.0, -1.0, 0.0, 
                        0.0, 0.0, -1.0;
            this->pre_grasp_base_poses_obj_frame[4] = Eigen::Translation3f(pre_grasp_offset * Eigen::Vector3f::UnitZ()) * Eigen::Quaternionf(matrix_z);  //z
        
            matrix_minus_z << 1.0, 0.0, 0.0, 
                            0.0, 1.0, 0.0, 
                            0.0, 0.0, 1.0;
            this->pre_grasp_base_poses_obj_frame[5] = Eigen::Translation3f(-pre_grasp_offset * Eigen::Vector3f::UnitZ()) * Eigen::Quaternionf(matrix_minus_z);  //-z
        
    }

};

pose_estimation::pre_grasp_service::Response first_hit(bool debug, moveit::planning_interface::MoveGroupInterface& move_group_interface, const Eigen::Isometry3f& obj_pose_world_frame, float pre_grasp_offset);

pose_estimation::pre_grasp_service::Response best_hit(bool debug, moveit::planning_interface::MoveGroupInterface& move_group_interface, const Eigen::Isometry3f& obj_pose_world_frame, float pre_grasp_offset);

}

#endif
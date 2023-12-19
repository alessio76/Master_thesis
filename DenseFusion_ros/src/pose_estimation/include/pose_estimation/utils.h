#ifndef UTILS_H
#define UTILS_H

#include "sensor_msgs/JointState.h"
#include <moveit_msgs/RobotTrajectory.h>
#include <eigen3/Eigen/Geometry>
#include "color.h"
#include <tf2_ros/transform_listener.h>
#include <geometry_msgs/TransformStamped.h>
#include <geometry_msgs/Pose.h>

namespace uclv{


    Eigen::Isometry3f link_t_goal_pose(const tf2_ros::Buffer& tfBuffer, const Eigen::Vector3f& base_to_goal_vec3, const Eigen::Quaternionf& base_to_goal_quat, const std::string& end_effector_frame_name){

        tfBuffer.canTransform(end_effector_frame_name, "link_t", ros::Time::now(),ros::Duration(3));

        //gives the pose for the second frame in the first coordinate system 
        geometry_msgs::TransformStamped transformStamped = tfBuffer.lookupTransform("link_t", end_effector_frame_name, ros::Time(0), ros::Duration(10.0));
        Eigen::Quaternionf link_t_to_grasp_quat(transformStamped.transform.rotation.w,
                                transformStamped.transform.rotation.x,
                                transformStamped.transform.rotation.y,
                                transformStamped.transform.rotation.z);

        Eigen::Vector3f link_t_to_grasp_vec3(transformStamped.transform.translation.x, transformStamped.transform.translation.y, transformStamped.transform.translation.z);
        Eigen::Isometry3f link_t_to_grasp(Eigen::Translation3f(link_t_to_grasp_vec3) * Eigen::Quaternionf(link_t_to_grasp_quat));
        

        Eigen::Isometry3f base_to_goal(Eigen::Translation3f(base_to_goal_vec3) * Eigen::Quaternionf(base_to_goal_quat));

        Eigen::Isometry3f base_to_t = base_to_goal * link_t_to_grasp.inverse();
        return base_to_t;

    }

    geometry_msgs::Pose eigen_to_Pose(const Eigen::Vector3f& position, const Eigen::Quaternionf& quaternion){

        geometry_msgs::Pose target_pose;
        target_pose.orientation.w = quaternion.w();
        target_pose.orientation.x = quaternion.x();
        target_pose.orientation.y = quaternion.y();
        target_pose.orientation.z = quaternion.z();

        target_pose.position.x = position[0];
        target_pose.position.y = position[1];
        target_pose.position.z = position[2];

        return target_pose;


  }

    geometry_msgs::TransformStamped eigen_to_TransformedStamped(const std::string& base_frame, const std::string& child_frame, const Eigen::Vector3f& position, const Eigen::Quaternionf& quaternion){
        geometry_msgs::TransformStamped goal_pose;
        goal_pose.header.stamp = ros::Time::now();
        goal_pose.header.frame_id = base_frame;
        goal_pose.child_frame_id = child_frame;

        goal_pose.transform.translation.x = position[0];
        goal_pose.transform.translation.y = position[1];
        goal_pose.transform.translation.z = position[2];


        goal_pose.transform.rotation.x = quaternion.x();
        goal_pose.transform.rotation.y = quaternion.y();
        goal_pose.transform.rotation.z = quaternion.z();
        goal_pose.transform.rotation.w = quaternion.w();

        return goal_pose;
    }

    void update_coeff(Eigen::Matrix<double, 6, -1> &coeff, const double &tf, const std::vector<double> &qi, const std::vector<double> &qi_dot, const std::vector<double> &qi_dot_dot, const std::vector<double> &qf, const std::vector<double> &qf_dot, const std::vector<double> &qf_dot_dot){
            double tf_2 = pow(tf, 2);
            double tf_3 = pow(tf, 3);
            double tf_4 = pow(tf, 4);
            double tf_5 = pow(tf, 5);

            Eigen::Matrix3d A;
            A << 20.0 * tf_3, 12.0 * tf_2, 6.0 * tf,
                5.0 * tf_4, 4.0 * tf_3, 3.0 * tf_2,
                tf_5, tf_4, tf_3;

            Eigen::Vector3d b;
            Eigen::Vector3d coeff_calc;

            for (int j = 0; j < coeff.cols(); j++){
                coeff(5, j) = qi[j];               // a0
                coeff(4, j) = qi_dot[j];           // a1
                coeff(3, j) = qi_dot_dot[j] / 2.0; // a2

                b(0) = qf_dot_dot[j] - qi_dot_dot[j];
                b(1) = qf_dot[j] - qi_dot[j] - qi_dot_dot[j] * tf;
                b(2) = qf[j] - qi[j] - qi_dot[j] * tf - qi_dot_dot[j] * tf_2 / 2.0;

                coeff_calc = A.inverse() * b;

                coeff(0, j) = coeff_calc[0]; // a5
                coeff(1, j) = coeff_calc[1]; // a4
                coeff(2, j) = coeff_calc[2]; // a3
            }
        }

    double interpolate_traj(const moveit_msgs::RobotTrajectory &trajectory, const double &scale_factor, Eigen::Matrix<double, 6, -1> &coeff, int j){
        // coeff_q1 coeff_q2 coeff_q3 ... coeff_q7
        //  a5
        //  a4
        //  ...
        //  a0

        // coeff.resize(6, this->num_joints);


        double tf = 0;
        auto dur_next = (trajectory.joint_trajectory.points[j + 1].time_from_start).sec + (trajectory.joint_trajectory.points[j + 1].time_from_start).nsec * pow(10, -9);
        auto dur_prev = (trajectory.joint_trajectory.points[j].time_from_start).sec + (trajectory.joint_trajectory.points[j].time_from_start).nsec * pow(10, -9);
        tf = dur_next - dur_prev;

        auto qi = trajectory.joint_trajectory.points[j].positions;
        auto qf = trajectory.joint_trajectory.points[j + 1].positions;

        auto qi_dot = trajectory.joint_trajectory.points[j].velocities;
        auto qf_dot = trajectory.joint_trajectory.points[j + 1].velocities;

        auto qi_dot_dot = trajectory.joint_trajectory.points[j].accelerations;
        auto qf_dot_dot = trajectory.joint_trajectory.points[j + 1].accelerations;

        if (scale_factor != 1.0)
        {
            tf = tf * scale_factor;
            for (int m = 0; m < int(qi.size()); m++)
            {
                qi_dot[m] = qi_dot[m] / scale_factor;
                qi_dot_dot[m] = qi_dot_dot[m] / pow(scale_factor, 2);

                qf_dot[m] = qf_dot[m] / scale_factor;
                qf_dot_dot[m] = qf_dot_dot[m] / pow(scale_factor, 2);
            }
        }

        update_coeff(coeff, tf, qi, qi_dot, qi_dot_dot, qf, qf_dot, qf_dot_dot);

        return tf;
    }


        double quintic_q(const double &t, const Eigen::Matrix<double, 6, -1> &coeff, const int &i){
            double t_2 = pow(t, 2);
            double t_3 = pow(t, 3);
            double t_4 = pow(t, 4);
            double t_5 = pow(t, 5);

            return (coeff(0, i) * t_5 + coeff(1, i) * t_4 + coeff(2, i) * t_3 + coeff(3, i) * t_2 + coeff(4, i) * t + coeff(5, i));
        }

        // Press y to continue, n to exit (other inputs not ammitted)
        bool askContinue(const std::string &prompt = ""){
            char ans;
            ROS_INFO_STREAM(prompt << BOLDBLUE << "- Press y to continue or n to exit: " << std::flush);
            std::cin >> ans;

            switch (tolower(ans))
            {
            case 'y':
                return true;
            case 'n':
                return false;
            default:
                ROS_INFO_STREAM(BOLDRED << "[ERROR]:" << RESET << BOLDWHITE << "Invalid input! Valid inputs are y (yes) or n (no)" << RESET << std::endl);
            }

            throw std::runtime_error("USER STOP!");
        }

    
}
#endif

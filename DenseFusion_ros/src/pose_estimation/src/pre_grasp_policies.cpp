#include "pose_estimation/pre_grasp_policies.h"

namespace uclv{
    
    void PreGraspPolicies::visualize_frames(const Eigen::Isometry3f& pre_grasp, int i, int j){

        out.clear();
        out.seekp(0);
        out << "goal_pose_" << i << '_' << j;
        geometry_msgs::TransformStamped goal_pose = uclv::eigen_to_TransformedStamped("base_link", out.str(), pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));
        static_broadcaster.sendTransform(goal_pose);

    }

    float PreGraspPolicies::gripper_width_selection(const Eigen::Matrix3f& pre_grasp_rot, const Eigen::Matrix3f& obj_rot){

        //calculate the dot product between the versors of the object frame and the sliding versor of the the pre_grasp fram (all expressed in the base frame)
        Eigen::Vector3f allignment = obj_rot.transpose() * pre_grasp_rot.col(1);
        Eigen::Index non_zero_elem;

        //by construction only 1 element will be non 0. For numerical reasons use the max to identify its index
        allignment.array().abs().maxCoeff(&non_zero_elem);

        //based on which versor is aligned with the sliding verson of the end effector use a different gripper width
        switch (static_cast<int>(non_zero_elem)){
        case 0:
            return gripper_widths["on_x"];
            break;
        
        case 1:
            return gripper_widths["on_y"];
            break;
        
        case 2:
            return gripper_widths["on_z"];
            break;
        
        default:
            break;
        }


    }

    /*
    This function simply generates all the pregrasp poses and gives as result the first feasible
    */
   

    PreGraspPolicies::PreGraspPolicies(float pre_grasp_offset, const std::string& move_group, bool debug) : 
    BaseObjPoses(pre_grasp_offset),
    move_group_interface(move_group),
    tfListener(tfBuffer){

        this->debug = debug;
        this->move_group_interface.setPlanningTime(0.1);
       
    }


    pose_estimation::pre_grasp_service::Response PreGraspPolicies::first_hit(const Eigen::Isometry3f& obj_pose_world_frame){
        int i=0;
        int j=0;
        float calculated_gripper_width;

        while(i < uclv::PreGraspBasePoses::N_BASE_FRAMES && !success){
            while(j < uclv::PreGraspBasePoses::N_GRIPPER_ROTATIONS && !success){
                //transform the candidate pose to base frame
                Eigen::Isometry3f pre_grasp = obj_pose_world_frame * BaseObjPoses.pre_grasp_base_poses_obj_frame[i] * Eigen::AngleAxisf((M_PI*j)/2, Eigen::Vector3f::UnitZ());
                
                //translate the candidate to link_t since the pianificatio is done on link_t
                Eigen::Isometry3f base_to_t = uclv::link_t_goal_pose(tfBuffer, pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));

                //transform to geometry_msgs::Pose
                geometry_msgs::Pose plan_pose = uclv::eigen_to_Pose(base_to_t.translation(), Eigen::Quaternionf(base_to_t.rotation()));
                
                if(debug){
                    visualize_frames(pre_grasp, i, j);
                }

                //actually do the plannig
                move_group_interface.setPoseTarget(plan_pose);
                success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);

                //if the plan is successfull save the candidate pose
                if(success){ 
                    pre_grasp_pose = uclv::eigen_to_TransformedStamped("base_link", out.str(), pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));
                    calculated_gripper_width = gripper_width_selection(pre_grasp.rotation(), obj_pose_world_frame.rotation());
                }//else continue the search          
                j++;
            }
            j=0;
            i++;
        }

        out_res.pre_grasp_pose = pre_grasp_pose;
        out_res.success = success;
        out_res.trajectory = my_plan.trajectory_;
        out_res.gripper_width = calculated_gripper_width;
        static_broadcaster.sendTransform(pre_grasp_pose);
        
        return out_res;
        
    }

    /*
    This function first generates all the poses and then selects as output the pose with the min angular and linear distance from the current end effector frame position.
    Computes the distance between the origins and an angle axis representation of the transform from end effector to pregrasp: then sum the distance to the angle/10 
    calculated on the angle axis form. This is done to account the distance between the frames and the rotation needed to allign them.
    */

    pose_estimation::pre_grasp_service::Response PreGraspPolicies::best_hit(const Eigen::Isometry3f& obj_pose_world_frame){
        
        std::map<float, Eigen::Isometry3f> scored_pregrasp;

        //calculate the transform end_effector frame in base_link coordinates
        tfBuffer.canTransform("base_link", "ee_fingers", ros::Time::now(),ros::Duration(3));

        //gives the pose for the second frame in the first coordinate system 
        geometry_msgs::TransformStamped transformStamped = tfBuffer.lookupTransform("base_link", "ee_fingers", ros::Time(0));

        Eigen::Vector3f end_effector_pos(transformStamped.transform.translation.x, transformStamped.transform.translation.y, transformStamped.transform.translation.z);
        
        Eigen::Quaternionf end_effector_quat(transformStamped.transform.rotation.w,
                                            transformStamped.transform.rotation.x,
                                            transformStamped.transform.rotation.y,
                                            transformStamped.transform.rotation.z);
        
        float calculated_gripper_width;
        
        //generate all pregraso pose
        for(int i=0; i < uclv::PreGraspBasePoses::N_BASE_FRAMES;i++){
            for(int j=0; j < uclv::PreGraspBasePoses::N_GRIPPER_ROTATIONS;j++){
                //transform the candidate pose to base frame
                Eigen::Isometry3f pre_grasp = obj_pose_world_frame * BaseObjPoses.pre_grasp_base_poses_obj_frame[i] * Eigen::AngleAxisf((M_PI*j)/2, Eigen::Vector3f::UnitZ()); 
                float dist = (Eigen::Vector3f(pre_grasp.translation()) - end_effector_pos).norm();
                float ang_dist = Eigen::AngleAxisf(end_effector_quat.toRotationMatrix().transpose() * pre_grasp.rotation()).angle();

                //associate each pregrasp pose with a score (the mixed angular-linear distance)
                scored_pregrasp[dist+ang_dist/10.0] = pre_grasp;
            
                if(debug)
                    visualize_frames(pre_grasp, i, j);

            }
        }

        //since std::map sorts in ascending order by defaults, the first feasible pregrasp pose is also the best (the one at minimun angular-linear distance)
        auto it = scored_pregrasp.begin();
        while (it != scored_pregrasp.end() && !success) {
            Eigen::Isometry3f pre_grasp = it->second;
            Eigen::Isometry3f base_to_t = uclv::link_t_goal_pose(tfBuffer, pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));
            geometry_msgs::Pose plan_pose = uclv::eigen_to_Pose(base_to_t.translation(), Eigen::Quaternionf(base_to_t.rotation()));
            move_group_interface.setPoseTarget(plan_pose);
            success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
            
            if(success){
                pre_grasp_pose = uclv::eigen_to_TransformedStamped("base_link", "goal_pose", pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));
                calculated_gripper_width = gripper_width_selection(pre_grasp.rotation(), obj_pose_world_frame.rotation());
            }
            ++it;
        }

        out_res.trajectory = my_plan.trajectory_;
        out_res.pre_grasp_pose = pre_grasp_pose;
        out_res.success = success;
        out_res.gripper_width = calculated_gripper_width;
        static_broadcaster.sendTransform(pre_grasp_pose);
        return out_res;
        }
    
}





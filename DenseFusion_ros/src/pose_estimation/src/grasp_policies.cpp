#include "pose_estimation/grasp_policies.h"

namespace uclv{

void visualize_frames(tf2_ros::StaticTransformBroadcaster& static_broadcaster, std::ostringstream& out, const Eigen::Isometry3f& pre_grasp, int i, int j){

    out.clear();
    out.seekp(0);
    out << "goal_pose_" << i << '_' << j;
    geometry_msgs::TransformStamped goal_pose = uclv::eigen_to_TransformedStamped("base_link", out.str(), pre_grasp.translation(), Eigen::Quaternionf(pre_grasp.rotation()));
    static_broadcaster.sendTransform(goal_pose);

}



pose_estimation::pre_grasp_service::Response first_hit(bool debug, moveit::planning_interface::MoveGroupInterface& move_group_interface, const Eigen::Isometry3f& obj_pose_world_frame, float pre_grasp_offset){
    
    bool success = false;
    std::ostringstream out;
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    pose_estimation::pre_grasp_service::Response out_res;
    int i=0;
    int j=0;
    uclv::PreGraspBasePoses BaseObjPoses(pre_grasp_offset);
    tf2_ros::StaticTransformBroadcaster static_broadcaster;
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
                visualize_frames(static_broadcaster, out, pre_grasp, i, j);
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

   
    static_broadcaster.sendTransform(pre_grasp_pose);
    
    return out_res;
    
}


pose_estimation::pre_grasp_service::Response best_hit(bool debug, moveit::planning_interface::MoveGroupInterface& move_group_interface, const Eigen::Isometry3f& obj_pose_world_frame, float pre_grasp_offset){
    
    std::map<float, Eigen::Isometry3f> scored_pregrasp;
    uclv::PreGraspBasePoses BaseObjPoses(pre_grasp_offset);

    geometry_msgs::TransformStamped pre_grasp_pose;
    tf2_ros::StaticTransformBroadcaster static_broadcaster;

    bool success = false;
    std::ostringstream out;
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    pose_estimation::pre_grasp_service::Response out_res;
    tf2_ros::Buffer tfBuffer;
    tf2_ros::TransformListener tfListener(tfBuffer);
    tfBuffer.canTransform("base_link", "ee_fingers", ros::Time::now(),ros::Duration(3));

    //gives the pose for the second frame in the first coordinate system 
    geometry_msgs::TransformStamped transformStamped = tfBuffer.lookupTransform("base_link", "ee_fingers", ros::Time(0));

    Eigen::Vector3f end_effector_pos(transformStamped.transform.translation.x, transformStamped.transform.translation.y, transformStamped.transform.translation.z);
    
    Eigen::Quaternionf end_effector_quat(transformStamped.transform.rotation.w,
                                          transformStamped.transform.rotation.x,
                                          transformStamped.transform.rotation.y,
                                          transformStamped.transform.rotation.z);

    for(int i=0; i < uclv::PreGraspBasePoses::N_BASE_FRAMES;i++){
        for(int j=0; j < uclv::PreGraspBasePoses::N_GRIPPER_ROTATIONS;j++){
            //transform the candidate pose to base frame
            Eigen::Isometry3f pre_grasp = obj_pose_world_frame * BaseObjPoses.pre_grasp_base_poses_obj_frame[i] * Eigen::AngleAxisf((M_PI*j)/2, Eigen::Vector3f::UnitZ()); 
            float dist = (Eigen::Vector3f(pre_grasp.translation()) - end_effector_pos).norm();
            float ang_dist = Eigen::AngleAxisf(end_effector_quat.toRotationMatrix().transpose() * pre_grasp.rotation()).angle();
          
            scored_pregrasp[dist+ang_dist/10.0] = pre_grasp;
           
            if(debug)
                visualize_frames(static_broadcaster, out, pre_grasp, i, j);

        }
    }

    auto it = scored_pregrasp.begin();
    while (it != scored_pregrasp.end() && !success) {
        
        Eigen::Isometry3f base_to_t = uclv::link_t_goal_pose(tfBuffer, it->second.translation(), Eigen::Quaternionf(it->second.rotation()));
        //transform to geometry_msgs::Pose
        geometry_msgs::Pose plan_pose = uclv::eigen_to_Pose(base_to_t.translation(), Eigen::Quaternionf(base_to_t.rotation()));
        move_group_interface.setPoseTarget(plan_pose);
        success = (move_group_interface.plan(my_plan) == moveit::core::MoveItErrorCode::SUCCESS);
        
        if(success) 
            pre_grasp_pose = uclv::eigen_to_TransformedStamped("base_link", "goal_pose", it->second.translation(), Eigen::Quaternionf(it->second.rotation()));
        
        ++it;
    }

    out_res.pre_grasp_pose = pre_grasp_pose;
    out_res.success = success;
    static_broadcaster.sendTransform(pre_grasp_pose);
    return out_res;
    }
}





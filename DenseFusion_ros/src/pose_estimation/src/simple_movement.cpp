#include <tf2_ros/static_transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <tf2_ros/transform_listener.h>
#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>
#include "geometric_shapes/shapes.h"
#include "geometric_shapes/mesh_operations.h"
#include "geometric_shapes/shape_operations.h"
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <actionlib/client/simple_action_client.h>
#include <Eigen/Geometry>

#include "pose_estimation/color.h"
#include "pose_estimation/utils.h"
#include "pose_estimation/TrajectoryAction.h"
#include "pose_estimation/plan_service.h"
#include "pose_estimation/pre_grasp_service.h"
#include "sun_wsg50_common/Move.h"
#include "std_srvs/Empty.h"

 std::vector<double> initial_state;

namespace uclv{
   
    bool call_plan_service(std::vector<std::tuple<moveit_msgs::RobotTrajectory, std::string, std::string>>& full_traj, const Eigen::Isometry3f& target_pose,
                        pose_estimation::plan_service& plan_service, const std::string& planning_type, const std::string& planning_group,const std::vector<double>& start_state, 
                        tf2_ros::StaticTransformBroadcaster& static_broadcaster, ros::ServiceClient& plan_client, const std::string& attach_obj_id="",
                        const std::string& move_gripper=""){
        
        geometry_msgs::TransformStamped goal_pose;
        std::vector<double> goal_joint;
        
        plan_service.request.planning_type = planning_type;
        plan_service.request.planning_group = planning_group;
        plan_service.request.attach_obj_id = attach_obj_id;
        plan_service.request.start_state = start_state; 
        
        if(plan_service.request.planning_type == "cartesian"){
            ROS_INFO_STREAM("cartesian");
            Eigen::Vector3f trans = target_pose.translation();
            Eigen::Quaternionf quat = Eigen::Quaternionf(target_pose.rotation());
            //transform to be published on tf for visualization
            goal_pose = uclv::eigen_to_TransformedStamped("base_link", "goal_pose", trans, quat);
            plan_service.request.goal_transform = goal_pose;
            static_broadcaster.sendTransform(goal_pose);
        }

        else if(plan_service.request.planning_type == "joint"){
           ROS_INFO_STREAM("joint");
            goal_joint= std::vector<double>{1.062881588935852, 0.48769956827163696, -2.498535633087158, -0.06272614002227783, -0.3274517357349396, -1.6770890951156616, -0.13831827044487};
            plan_service.request.goal_joint = goal_joint;
        }

        
        
       
        if (plan_client.call(plan_service)){   
            ROS_INFO_STREAM("Calling planning server");
            
            //if the plan is succesfull add it to the full trajectory 
            if(plan_service.response.success){
                full_traj.push_back(std::make_tuple(plan_service.response.trajectory, move_gripper, attach_obj_id));
                return true;
            }

            else{
                ROS_ERROR_STREAM("Planning Failed");
                return false;
            }
        }

        else{

            ROS_ERROR_STREAM("Failed to call planning service");
            return false;
        }

    }
}

Eigen::Isometry3f set_grasp_pose(const Eigen::Translation3f& test_trans, const Eigen::Quaternionf& test_rot){
        tf2_ros::Buffer tfBuffer;
        tf2_ros::TransformListener tfListener(tfBuffer);

        tfBuffer.canTransform("base_link" , "ee_fingers", ros::Time::now(),ros::Duration(3));

        //gives the pose for the second frame in the first coordinate system 
        geometry_msgs::TransformStamped transformStamped = tfBuffer.lookupTransform("base_link", "ee_fingers",ros::Time(0));
        
        Eigen::Quaternionf initial_quat(transformStamped.transform.rotation.w,
                                transformStamped.transform.rotation.x,
                                transformStamped.transform.rotation.y,
                                transformStamped.transform.rotation.z);

        Eigen::Vector3f initial_vec3(transformStamped.transform.translation.x, transformStamped.transform.translation.y, transformStamped.transform.translation.z);
        Eigen::Isometry3f initial_pose(Eigen::Translation3f(initial_vec3) * Eigen::Quaternionf(initial_quat));

        Eigen::Isometry3f movement_pose = Eigen::Isometry3f(test_trans * test_rot);
        Eigen::Isometry3f grasp_pose = initial_pose * movement_pose;
        return grasp_pose;
    }

    void get_current_state(const sensor_msgs::JointState::ConstPtr& jointState){
       initial_state = jointState -> position;
    }




int main(int argc, char** argv){
    ros::init(argc, argv, "test_node");
    ros::NodeHandle n;
    bool simulation;
    n.getParam("simulation",simulation);
    std::string object_frame_name;
    n.getParam("base_object_frame_name",object_frame_name);
    const std::string topic_name="gripper_joints";
    std::vector<double> home_state;
    n.getParam("home_state", home_state);
    ros::Publisher joint_pub = n.advertise<sensor_msgs::JointState>(topic_name, 1);
    ros::ServiceClient pre_grasp_client = n.serviceClient<pose_estimation::pre_grasp_service>("pre_grasp_service");
    ros::Publisher jointStatePublisher = n.advertise<sensor_msgs::JointState>("/move_group/fake_controller_joint_states", 10);
    ros::Subscriber jointStateSub = n.subscribe("/motoman/joint_states", 1, get_current_state);

    std::vector<std::string> names{"joint_s", "joint_l", "joint_e", "joint_u", "joint_r", "joint_b", "joint_t"};
   
    

    if (simulation) {
        ros::Duration(1).sleep();
        // Create a JointState message
        sensor_msgs::JointState jointStateMsg;

        for (int i=0; i<names.size(); i++) {
            jointStateMsg.name.push_back(names[i]);
            jointStateMsg.position.push_back(initial_state[i]);
        }

        // Set header information
        jointStateMsg.header.stamp = ros::Time::now();

        // Publish the JointState message
        jointStatePublisher.publish(jointStateMsg);
        
    }
    
    ros::ServiceClient plan_client = n.serviceClient<pose_estimation::plan_service>("plan_service");
    pose_estimation::plan_service plan_service;
    pose_estimation::pre_grasp_service pre_grasp_service;
    actionlib::SimpleActionClient<pose_estimation::TrajectoryAction> action_client("trajectory_action_server",true);
    std::string end_effector_frame;
    
    float pre_grasp_offset;
    float gripper_width;

    n.getParam("end_effector_frame_name", end_effector_frame);
    n.getParam("pre_grasp_offset_name", pre_grasp_offset);
    std::vector<std::tuple<moveit_msgs::RobotTrajectory, std::string, std::string>> full_traj;
    //wait for the planning service to be up
    pre_grasp_client.waitForExistence();

    //wait for the pregrasp service to be up
    plan_client.waitForExistence();
    
    //wait for action server
    action_client.waitForServer();
    
    pose_estimation::TrajectoryGoal trajectory_goal;
   
    const std::string ARM = "yaskawa_arm";
    tf2_ros::StaticTransformBroadcaster static_broadcaster;

    //message to the server
    geometry_msgs::TransformStamped out_message;

    //56mm most long side, 8N 
    //upright 34mm, 8N
    //12mm shortest side, 8N
    //192.168.2.111 wsg IP   
    /*
    pre_place_pose = Eigen::Isometry3f(Eigen::Translation3f(0.25, -0.40, 0.15) * Eigen::Quaternionf(post_grasp_pose.rotation()));
    */
    Eigen::Translation3f test_trans(0,0,0);
    Eigen::Quaternionf test_rot(1,0,0,0);

    Eigen::Isometry3f end_effector_pose = set_grasp_pose(test_trans , test_rot);
    Eigen::Isometry3f target_pose(Eigen::Isometry3f(Eigen::Translation3f(0.25, -0.40, 0.15)  * Eigen::Quaternionf(end_effector_pose.rotation())));


    while(initial_state.size() <= 0){

        ros::spinOnce();

    }

    if(uclv::call_plan_service(full_traj, target_pose, plan_service, "joint", ARM, initial_state, static_broadcaster, plan_client)){
        if (!action_client.isServerConnected())
            ROS_ERROR_STREAM("Cannot reach trajectory server!" << action_client.getState().getText());
      
        if (uclv::askContinue("EXECUTE TRAJECTORY?")){
            for(int i=0; i<full_traj.size(); i++){
                
                trajectory_goal.trajectory = std::get<0>(full_traj[i]);
                action_client.sendGoal(trajectory_goal);

                if (!action_client.waitForResult()){
                    ROS_INFO_STREAM("move_group_interface" << "ExecuteTrajectory action returned early" << action_client.getState().getText());
                }

                else{
                    
                    if(action_client.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                        ROS_INFO_STREAM("Trajectory executed succesfully");  
                    

                    else
                        ROS_INFO_STREAM("move_group_interface" << action_client.getState().toString()<< ": " << action_client.getState().getText());
                    
                }
                
            }
        }
    }

     else{
        ROS_ERROR_STREAM("Planning failed");
        return -1;
    }

    return 0;

}

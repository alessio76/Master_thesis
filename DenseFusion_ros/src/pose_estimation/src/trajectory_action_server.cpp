#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>
#include <pose_estimation/utils.h>
#include <pose_estimation/TrajectoryAction.h>
#include <pose_estimation/color.h>
#include <moveit_msgs/MoveItErrorCodes.h>
#include <moveit/move_group_interface/move_group_interface.h>


namespace uclv
{

  class TrajectoryAction{
    protected:

      ros::NodeHandle nh_;
      actionlib::SimpleActionServer<pose_estimation::TrajectoryAction> as_; // NodeHandle instance must be created before this line. Otherwise strange error occurs.
      // create messages that are used to published feedback/result
      std::string action_name_;
      pose_estimation::TrajectoryFeedback feedback_;
      pose_estimation::TrajectoryResult result_;
      ros::Publisher joint_pub;
      bool success=true;
      double rate=50;
      float scale_factor=5.0;
      std::string result_string;

    public:

      TrajectoryAction(std::string topic_name, std::string name) :
      as_(nh_, name, boost::bind(&TrajectoryAction::executeCB, this, _1), false),
      action_name_(name)
      {
        joint_pub = nh_.advertise<sensor_msgs::JointState>(topic_name, 1);
        as_.start();
      }

      ~TrajectoryAction(void){
      }

      void execute_sim(const moveit_msgs::RobotTrajectory& trajectory){

        

      }

      void execute_robot(const moveit_msgs::RobotTrajectory& trajectory){

            // Create the joint state msg
            sensor_msgs::JointState joint_cmd;
            joint_cmd.position.resize(trajectory.joint_trajectory.points.at(0).positions.size());
            joint_cmd.velocity.resize(trajectory.joint_trajectory.points.at(0).positions.size());
            joint_cmd.name.resize(trajectory.joint_trajectory.points.at(0).positions.size());
            joint_cmd.header = trajectory.joint_trajectory.header;
            joint_cmd.name = trajectory.joint_trajectory.joint_names;
            int num_joints=joint_cmd.name.size();

            double t=0.0;
            double tf=0.0;
            Eigen::Matrix<double, 6, Eigen::Dynamic> coeff = Eigen::Matrix<double, 6, Eigen::Dynamic>::Zero(6, num_joints);
            int num_points_traj = int(trajectory.joint_trajectory.points.size());
            const double sleep_time = 1.0 / rate;

            for (int j = 0; j < num_points_traj - 1; j++)
            {
                tf = interpolate_traj(trajectory, this->scale_factor, coeff, j);
                
                // Create a timer to publish the joint commands at the specified rate
                
                double t0 = ros::Time::now().toSec();
                while (t <= tf)
                {
                    t = ros::Time::now().toSec() - t0;
                    for (int i = 0; i < num_joints; i++)
                    {
                        joint_cmd.position.at(i) = quintic_q(t, coeff, i);
                        joint_cmd.velocity.at(i) = 0.0; // quintic_qdot(t, coeff, i);
                    }

                    joint_pub.publish(joint_cmd);
                    std::cout << "Publishing " << j+1 << "/" << num_points_traj << " " << t << "/" << tf << std::endl;

                    // sleep for (1/rate) seconds
                    ros::Duration(sleep_time).sleep();
                    
                }
                t = 0.0;
            }
        }//wsg32.lab

      void executeCB(const pose_estimation::TrajectoryGoalConstPtr &goal){

        ROS_INFO_STREAM("Trajectory execution started!" << std::endl);

        if (as_.isPreemptRequested()){
            this->result_string = "Goal Preempted";
            this->success=false;
            as_.setPreempted(this->result_, this->result_string);
        }
        
        else{
            this->execute_robot(goal->trajectory);

            // Check if goal is done
            if (ros::ok() && this->success==true){
              this->result_string = "Trajectory execution finished successfully!";
              as_.setSucceeded(this->result_,this->result_string);
            }

            else{
              this->result_string = "Trajectory execution failed!";
              as_.setAborted(this->result_, this->result_string);
            }
              
           
        }

      ROS_INFO_STREAM(BOLDGREEN << this->result_string << RESET << std::endl);
      
      }

    };
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "trajectory_action_server");
  uclv::TrajectoryAction trajAction("/move_group/fake_controller_joint_states","trajectory_action_server");
  ros::spin();

  return 0;
}

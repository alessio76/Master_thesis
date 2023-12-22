#include "ros/ros.h"
#include "sensor_msgs/JointState.h"

sensor_msgs::JointState fake_gripper_joint;

namespace uclv{

  void callback(const sensor_msgs::JointState::ConstPtr& real_gripper_joint){
   
   fake_gripper_joint.header = real_gripper_joint->header;
   fake_gripper_joint.name = real_gripper_joint->name;
   fake_gripper_joint.velocity = real_gripper_joint->velocity;
   fake_gripper_joint.effort = real_gripper_joint->effort;
   fake_gripper_joint.position[0] = (real_gripper_joint->position[0]-0.06)/2.0;
  }

}

int main(int argc, char **argv)
{

  ros::init(argc, argv, "gripper_adapter");
  ros::NodeHandle n;
  std::string source_gripper_topic{"/fake_gripper_joints"};
  std::string dest_gripper_topic;
  n.getParam("remapped_gripper_topic", source_gripper_topic);
  n.getParam("dest_gripper_topic", dest_gripper_topic);

  ros::Publisher fake_gripper_pub = n.advertise<sensor_msgs::JointState>(dest_gripper_topic, 100);
  ros::Subscriber real_gripper_sub = n.subscribe(source_gripper_topic, 1000, uclv::callback);
  ros::Rate loop_rate(50);

  fake_gripper_joint.position.resize(1);
  while (ros::ok())
  {
    ros::spinOnce();
    fake_gripper_pub.publish(fake_gripper_joint);
    loop_rate.sleep();
  }


  return 0;
}
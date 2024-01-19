#include <ros/ros.h>
#include <tf/transform_listener.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/TransformStamped.h>

int main(int argc, char **argv)
{

  ros::init(argc, argv, "pose_adapter");
  ros::NodeHandle n;
  std::string dest_topic{"/pose_topic"};
  std::string camera_frame;
  std::string reference_frame;
  n.getParam("tf_camera_frame", camera_frame);
 

  ros::Publisher pub = n.advertise<geometry_msgs::PoseStamped>(dest_topic, 1);
  reference_frame="camera_color_optical_frame";
  tf::TransformListener tfListener;
  tfListener.waitForTransform(reference_frame, "object_frame_0",ros::Time(0), ros::Duration(10));
  while (ros::ok()){
  
  tf::StampedTransform transformStamped;
  tfListener.lookupTransform(reference_frame, "object_frame_0",ros::Time(0), transformStamped);
  geometry_msgs::PoseStamped poseStamped;

  poseStamped.header.stamp = ros::Time::now(); 
  poseStamped.header.frame_id = reference_frame;
 
  poseStamped.pose.position.x = transformStamped.getOrigin().x();
  poseStamped.pose.position.y = transformStamped.getOrigin().y();
  poseStamped.pose.position.z = transformStamped.getOrigin().z();
  
  poseStamped.pose.orientation.x = transformStamped.getRotation().x();
  poseStamped.pose.orientation.y = transformStamped.getRotation().y();
  poseStamped.pose.orientation.z = transformStamped.getRotation().z();
  poseStamped.pose.orientation.w = transformStamped.getRotation().w();
  pub.publish(poseStamped);
  ros::spinOnce();
  }
  


  return 0;
}
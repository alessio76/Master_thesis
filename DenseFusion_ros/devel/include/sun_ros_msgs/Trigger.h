// Generated by gencpp from file sun_ros_msgs/Trigger.msg
// DO NOT EDIT!


#ifndef SUN_ROS_MSGS_MESSAGE_TRIGGER_H
#define SUN_ROS_MSGS_MESSAGE_TRIGGER_H

#include <ros/service_traits.h>


#include <sun_ros_msgs/TriggerRequest.h>
#include <sun_ros_msgs/TriggerResponse.h>


namespace sun_ros_msgs
{

struct Trigger
{

typedef TriggerRequest Request;
typedef TriggerResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Trigger
} // namespace sun_ros_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::sun_ros_msgs::Trigger > {
  static const char* value()
  {
    return "937c9679a518e3a18d831e57125ea522";
  }

  static const char* value(const ::sun_ros_msgs::Trigger&) { return value(); }
};

template<>
struct DataType< ::sun_ros_msgs::Trigger > {
  static const char* value()
  {
    return "sun_ros_msgs/Trigger";
  }

  static const char* value(const ::sun_ros_msgs::Trigger&) { return value(); }
};


// service_traits::MD5Sum< ::sun_ros_msgs::TriggerRequest> should match
// service_traits::MD5Sum< ::sun_ros_msgs::Trigger >
template<>
struct MD5Sum< ::sun_ros_msgs::TriggerRequest>
{
  static const char* value()
  {
    return MD5Sum< ::sun_ros_msgs::Trigger >::value();
  }
  static const char* value(const ::sun_ros_msgs::TriggerRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::sun_ros_msgs::TriggerRequest> should match
// service_traits::DataType< ::sun_ros_msgs::Trigger >
template<>
struct DataType< ::sun_ros_msgs::TriggerRequest>
{
  static const char* value()
  {
    return DataType< ::sun_ros_msgs::Trigger >::value();
  }
  static const char* value(const ::sun_ros_msgs::TriggerRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::sun_ros_msgs::TriggerResponse> should match
// service_traits::MD5Sum< ::sun_ros_msgs::Trigger >
template<>
struct MD5Sum< ::sun_ros_msgs::TriggerResponse>
{
  static const char* value()
  {
    return MD5Sum< ::sun_ros_msgs::Trigger >::value();
  }
  static const char* value(const ::sun_ros_msgs::TriggerResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::sun_ros_msgs::TriggerResponse> should match
// service_traits::DataType< ::sun_ros_msgs::Trigger >
template<>
struct DataType< ::sun_ros_msgs::TriggerResponse>
{
  static const char* value()
  {
    return DataType< ::sun_ros_msgs::Trigger >::value();
  }
  static const char* value(const ::sun_ros_msgs::TriggerResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // SUN_ROS_MSGS_MESSAGE_TRIGGER_H

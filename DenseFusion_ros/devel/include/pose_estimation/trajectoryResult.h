// Generated by gencpp from file pose_estimation/trajectoryResult.msg
// DO NOT EDIT!


#ifndef POSE_ESTIMATION_MESSAGE_TRAJECTORYRESULT_H
#define POSE_ESTIMATION_MESSAGE_TRAJECTORYRESULT_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sensor_msgs/JointState.h>

namespace pose_estimation
{
template <class ContainerAllocator>
struct trajectoryResult_
{
  typedef trajectoryResult_<ContainerAllocator> Type;

  trajectoryResult_()
    : final_joint_position()  {
    }
  trajectoryResult_(const ContainerAllocator& _alloc)
    : final_joint_position(_alloc)  {
  (void)_alloc;
    }



   typedef  ::sensor_msgs::JointState_<ContainerAllocator>  _final_joint_position_type;
  _final_joint_position_type final_joint_position;





  typedef boost::shared_ptr< ::pose_estimation::trajectoryResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pose_estimation::trajectoryResult_<ContainerAllocator> const> ConstPtr;

}; // struct trajectoryResult_

typedef ::pose_estimation::trajectoryResult_<std::allocator<void> > trajectoryResult;

typedef boost::shared_ptr< ::pose_estimation::trajectoryResult > trajectoryResultPtr;
typedef boost::shared_ptr< ::pose_estimation::trajectoryResult const> trajectoryResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pose_estimation::trajectoryResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pose_estimation::trajectoryResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::pose_estimation::trajectoryResult_<ContainerAllocator1> & lhs, const ::pose_estimation::trajectoryResult_<ContainerAllocator2> & rhs)
{
  return lhs.final_joint_position == rhs.final_joint_position;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::pose_estimation::trajectoryResult_<ContainerAllocator1> & lhs, const ::pose_estimation::trajectoryResult_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace pose_estimation

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::pose_estimation::trajectoryResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pose_estimation::trajectoryResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pose_estimation::trajectoryResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pose_estimation::trajectoryResult_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pose_estimation::trajectoryResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pose_estimation::trajectoryResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pose_estimation::trajectoryResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a7a8bb968834c0094968e45220a10e0a";
  }

  static const char* value(const ::pose_estimation::trajectoryResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa7a8bb968834c009ULL;
  static const uint64_t static_value2 = 0x4968e45220a10e0aULL;
};

template<class ContainerAllocator>
struct DataType< ::pose_estimation::trajectoryResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pose_estimation/trajectoryResult";
  }

  static const char* value(const ::pose_estimation::trajectoryResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pose_estimation::trajectoryResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"#result definition\n"
"sensor_msgs/JointState final_joint_position\n"
"\n"
"================================================================================\n"
"MSG: sensor_msgs/JointState\n"
"# This is a message that holds data to describe the state of a set of torque controlled joints. \n"
"#\n"
"# The state of each joint (revolute or prismatic) is defined by:\n"
"#  * the position of the joint (rad or m),\n"
"#  * the velocity of the joint (rad/s or m/s) and \n"
"#  * the effort that is applied in the joint (Nm or N).\n"
"#\n"
"# Each joint is uniquely identified by its name\n"
"# The header specifies the time at which the joint states were recorded. All the joint states\n"
"# in one message have to be recorded at the same time.\n"
"#\n"
"# This message consists of a multiple arrays, one for each part of the joint state. \n"
"# The goal is to make each of the fields optional. When e.g. your joints have no\n"
"# effort associated with them, you can leave the effort array empty. \n"
"#\n"
"# All arrays in this message should have the same size, or be empty.\n"
"# This is the only way to uniquely associate the joint name with the correct\n"
"# states.\n"
"\n"
"\n"
"Header header\n"
"\n"
"string[] name\n"
"float64[] position\n"
"float64[] velocity\n"
"float64[] effort\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::pose_estimation::trajectoryResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pose_estimation::trajectoryResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.final_joint_position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct trajectoryResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pose_estimation::trajectoryResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pose_estimation::trajectoryResult_<ContainerAllocator>& v)
  {
    s << indent << "final_joint_position: ";
    s << std::endl;
    Printer< ::sensor_msgs::JointState_<ContainerAllocator> >::stream(s, indent + "  ", v.final_joint_position);
  }
};

} // namespace message_operations
} // namespace ros

#endif // POSE_ESTIMATION_MESSAGE_TRAJECTORYRESULT_H

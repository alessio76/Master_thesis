// Generated by gencpp from file sun_robot_msgs/CartesianTrajectoryGoal.msg
// DO NOT EDIT!


#ifndef SUN_ROBOT_MSGS_MESSAGE_CARTESIANTRAJECTORYGOAL_H
#define SUN_ROBOT_MSGS_MESSAGE_CARTESIANTRAJECTORYGOAL_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sun_robot_msgs/CartesianTrajectory.h>

namespace sun_robot_msgs
{
template <class ContainerAllocator>
struct CartesianTrajectoryGoal_
{
  typedef CartesianTrajectoryGoal_<ContainerAllocator> Type;

  CartesianTrajectoryGoal_()
    : trajectory()
    , sampling_freq(0.0)
    , use_trapez(false)  {
    }
  CartesianTrajectoryGoal_(const ContainerAllocator& _alloc)
    : trajectory(_alloc)
    , sampling_freq(0.0)
    , use_trapez(false)  {
  (void)_alloc;
    }



   typedef  ::sun_robot_msgs::CartesianTrajectory_<ContainerAllocator>  _trajectory_type;
  _trajectory_type trajectory;

   typedef double _sampling_freq_type;
  _sampling_freq_type sampling_freq;

   typedef uint8_t _use_trapez_type;
  _use_trapez_type use_trapez;





  typedef boost::shared_ptr< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> const> ConstPtr;

}; // struct CartesianTrajectoryGoal_

typedef ::sun_robot_msgs::CartesianTrajectoryGoal_<std::allocator<void> > CartesianTrajectoryGoal;

typedef boost::shared_ptr< ::sun_robot_msgs::CartesianTrajectoryGoal > CartesianTrajectoryGoalPtr;
typedef boost::shared_ptr< ::sun_robot_msgs::CartesianTrajectoryGoal const> CartesianTrajectoryGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator1> & lhs, const ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator2> & rhs)
{
  return lhs.trajectory == rhs.trajectory &&
    lhs.sampling_freq == rhs.sampling_freq &&
    lhs.use_trapez == rhs.use_trapez;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator1> & lhs, const ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace sun_robot_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e7fd141f55570565cc279335a6a6197c";
  }

  static const char* value(const ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe7fd141f55570565ULL;
  static const uint64_t static_value2 = 0xcc279335a6a6197cULL;
};

template<class ContainerAllocator>
struct DataType< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sun_robot_msgs/CartesianTrajectoryGoal";
  }

  static const char* value(const ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Define the goal\n"
"sun_robot_msgs/CartesianTrajectory trajectory\n"
"float64 sampling_freq\n"
"bool use_trapez\n"
"\n"
"\n"
"================================================================================\n"
"MSG: sun_robot_msgs/CartesianTrajectory\n"
"std_msgs/Header header\n"
"sun_robot_msgs/CartesianTrajectoryPoint[] points\n"
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
"\n"
"================================================================================\n"
"MSG: sun_robot_msgs/CartesianTrajectoryPoint\n"
"geometry_msgs/Pose pose\n"
"geometry_msgs/Twist velocity\n"
"geometry_msgs/Twist acceleration\n"
"duration time_from_start\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Twist\n"
"# This expresses velocity in free space broken into its linear and angular parts.\n"
"Vector3  linear\n"
"Vector3  angular\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.trajectory);
      stream.next(m.sampling_freq);
      stream.next(m.use_trapez);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CartesianTrajectoryGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sun_robot_msgs::CartesianTrajectoryGoal_<ContainerAllocator>& v)
  {
    s << indent << "trajectory: ";
    s << std::endl;
    Printer< ::sun_robot_msgs::CartesianTrajectory_<ContainerAllocator> >::stream(s, indent + "  ", v.trajectory);
    s << indent << "sampling_freq: ";
    Printer<double>::stream(s, indent + "  ", v.sampling_freq);
    s << indent << "use_trapez: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.use_trapez);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SUN_ROBOT_MSGS_MESSAGE_CARTESIANTRAJECTORYGOAL_H

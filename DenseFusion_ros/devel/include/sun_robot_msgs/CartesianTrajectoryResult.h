// Generated by gencpp from file sun_robot_msgs/CartesianTrajectoryResult.msg
// DO NOT EDIT!


#ifndef SUN_ROBOT_MSGS_MESSAGE_CARTESIANTRAJECTORYRESULT_H
#define SUN_ROBOT_MSGS_MESSAGE_CARTESIANTRAJECTORYRESULT_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sun_robot_msgs
{
template <class ContainerAllocator>
struct CartesianTrajectoryResult_
{
  typedef CartesianTrajectoryResult_<ContainerAllocator> Type;

  CartesianTrajectoryResult_()
    {
    }
  CartesianTrajectoryResult_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> const> ConstPtr;

}; // struct CartesianTrajectoryResult_

typedef ::sun_robot_msgs::CartesianTrajectoryResult_<std::allocator<void> > CartesianTrajectoryResult;

typedef boost::shared_ptr< ::sun_robot_msgs::CartesianTrajectoryResult > CartesianTrajectoryResultPtr;
typedef boost::shared_ptr< ::sun_robot_msgs::CartesianTrajectoryResult const> CartesianTrajectoryResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace sun_robot_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sun_robot_msgs/CartesianTrajectoryResult";
  }

  static const char* value(const ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Define the result\n"
;
  }

  static const char* value(const ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CartesianTrajectoryResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::sun_robot_msgs::CartesianTrajectoryResult_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // SUN_ROBOT_MSGS_MESSAGE_CARTESIANTRAJECTORYRESULT_H

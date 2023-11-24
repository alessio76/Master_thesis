// Generated by gencpp from file sun_wsg50_common/Status.msg
// DO NOT EDIT!


#ifndef SUN_WSG50_COMMON_MESSAGE_STATUS_H
#define SUN_WSG50_COMMON_MESSAGE_STATUS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sun_wsg50_common
{
template <class ContainerAllocator>
struct Status_
{
  typedef Status_<ContainerAllocator> Type;

  Status_()
    : status()
    , width(0.0)
    , speed(0.0)
    , acc(0.0)
    , force(0.0)
    , force_finger0(0.0)
    , force_finger1(0.0)  {
    }
  Status_(const ContainerAllocator& _alloc)
    : status(_alloc)
    , width(0.0)
    , speed(0.0)
    , acc(0.0)
    , force(0.0)
    , force_finger0(0.0)
    , force_finger1(0.0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _status_type;
  _status_type status;

   typedef float _width_type;
  _width_type width;

   typedef float _speed_type;
  _speed_type speed;

   typedef float _acc_type;
  _acc_type acc;

   typedef float _force_type;
  _force_type force;

   typedef float _force_finger0_type;
  _force_finger0_type force_finger0;

   typedef float _force_finger1_type;
  _force_finger1_type force_finger1;





  typedef boost::shared_ptr< ::sun_wsg50_common::Status_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sun_wsg50_common::Status_<ContainerAllocator> const> ConstPtr;

}; // struct Status_

typedef ::sun_wsg50_common::Status_<std::allocator<void> > Status;

typedef boost::shared_ptr< ::sun_wsg50_common::Status > StatusPtr;
typedef boost::shared_ptr< ::sun_wsg50_common::Status const> StatusConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sun_wsg50_common::Status_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sun_wsg50_common::Status_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::sun_wsg50_common::Status_<ContainerAllocator1> & lhs, const ::sun_wsg50_common::Status_<ContainerAllocator2> & rhs)
{
  return lhs.status == rhs.status &&
    lhs.width == rhs.width &&
    lhs.speed == rhs.speed &&
    lhs.acc == rhs.acc &&
    lhs.force == rhs.force &&
    lhs.force_finger0 == rhs.force_finger0 &&
    lhs.force_finger1 == rhs.force_finger1;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::sun_wsg50_common::Status_<ContainerAllocator1> & lhs, const ::sun_wsg50_common::Status_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace sun_wsg50_common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::sun_wsg50_common::Status_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sun_wsg50_common::Status_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sun_wsg50_common::Status_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sun_wsg50_common::Status_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sun_wsg50_common::Status_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sun_wsg50_common::Status_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sun_wsg50_common::Status_<ContainerAllocator> >
{
  static const char* value()
  {
    return "51c764be2e2c02863274a528dd8b3470";
  }

  static const char* value(const ::sun_wsg50_common::Status_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x51c764be2e2c0286ULL;
  static const uint64_t static_value2 = 0x3274a528dd8b3470ULL;
};

template<class ContainerAllocator>
struct DataType< ::sun_wsg50_common::Status_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sun_wsg50_common/Status";
  }

  static const char* value(const ::sun_wsg50_common::Status_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sun_wsg50_common::Status_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string status\n"
"float32 width\n"
"float32 speed\n"
"float32 acc\n"
"float32 force\n"
"float32 force_finger0\n"
"float32 force_finger1\n"
;
  }

  static const char* value(const ::sun_wsg50_common::Status_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sun_wsg50_common::Status_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.status);
      stream.next(m.width);
      stream.next(m.speed);
      stream.next(m.acc);
      stream.next(m.force);
      stream.next(m.force_finger0);
      stream.next(m.force_finger1);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Status_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sun_wsg50_common::Status_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sun_wsg50_common::Status_<ContainerAllocator>& v)
  {
    s << indent << "status: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.status);
    s << indent << "width: ";
    Printer<float>::stream(s, indent + "  ", v.width);
    s << indent << "speed: ";
    Printer<float>::stream(s, indent + "  ", v.speed);
    s << indent << "acc: ";
    Printer<float>::stream(s, indent + "  ", v.acc);
    s << indent << "force: ";
    Printer<float>::stream(s, indent + "  ", v.force);
    s << indent << "force_finger0: ";
    Printer<float>::stream(s, indent + "  ", v.force_finger0);
    s << indent << "force_finger1: ";
    Printer<float>::stream(s, indent + "  ", v.force_finger1);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SUN_WSG50_COMMON_MESSAGE_STATUS_H

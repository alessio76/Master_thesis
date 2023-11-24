// Generated by gencpp from file sun_wsg50_common/ConfRequest.msg
// DO NOT EDIT!


#ifndef SUN_WSG50_COMMON_MESSAGE_CONFREQUEST_H
#define SUN_WSG50_COMMON_MESSAGE_CONFREQUEST_H


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
struct ConfRequest_
{
  typedef ConfRequest_<ContainerAllocator> Type;

  ConfRequest_()
    : val(0.0)  {
    }
  ConfRequest_(const ContainerAllocator& _alloc)
    : val(0.0)  {
  (void)_alloc;
    }



   typedef float _val_type;
  _val_type val;





  typedef boost::shared_ptr< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ConfRequest_

typedef ::sun_wsg50_common::ConfRequest_<std::allocator<void> > ConfRequest;

typedef boost::shared_ptr< ::sun_wsg50_common::ConfRequest > ConfRequestPtr;
typedef boost::shared_ptr< ::sun_wsg50_common::ConfRequest const> ConfRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sun_wsg50_common::ConfRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::sun_wsg50_common::ConfRequest_<ContainerAllocator1> & lhs, const ::sun_wsg50_common::ConfRequest_<ContainerAllocator2> & rhs)
{
  return lhs.val == rhs.val;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::sun_wsg50_common::ConfRequest_<ContainerAllocator1> & lhs, const ::sun_wsg50_common::ConfRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace sun_wsg50_common

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c9ee899b5f0899afa6060c9ba611652c";
  }

  static const char* value(const ::sun_wsg50_common::ConfRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc9ee899b5f0899afULL;
  static const uint64_t static_value2 = 0xa6060c9ba611652cULL;
};

template<class ContainerAllocator>
struct DataType< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sun_wsg50_common/ConfRequest";
  }

  static const char* value(const ::sun_wsg50_common::ConfRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 val\n"
;
  }

  static const char* value(const ::sun_wsg50_common::ConfRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.val);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ConfRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sun_wsg50_common::ConfRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sun_wsg50_common::ConfRequest_<ContainerAllocator>& v)
  {
    s << indent << "val: ";
    Printer<float>::stream(s, indent + "  ", v.val);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SUN_WSG50_COMMON_MESSAGE_CONFREQUEST_H

; Auto-generated. Do not edit!


(cl:in-package sun_ros_msgs-msg)


;//! \htmlinclude MultiVectorStamped.msg.html

(cl:defclass <MultiVectorStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type sun_ros_msgs-msg:MultiVector
    :initform (cl:make-instance 'sun_ros_msgs-msg:MultiVector)))
)

(cl:defclass MultiVectorStamped (<MultiVectorStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MultiVectorStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MultiVectorStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_ros_msgs-msg:<MultiVectorStamped> is deprecated: use sun_ros_msgs-msg:MultiVectorStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MultiVectorStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_ros_msgs-msg:header-val is deprecated.  Use sun_ros_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <MultiVectorStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_ros_msgs-msg:data-val is deprecated.  Use sun_ros_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MultiVectorStamped>) ostream)
  "Serializes a message object of type '<MultiVectorStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MultiVectorStamped>) istream)
  "Deserializes a message object of type '<MultiVectorStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MultiVectorStamped>)))
  "Returns string type for a message object of type '<MultiVectorStamped>"
  "sun_ros_msgs/MultiVectorStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultiVectorStamped)))
  "Returns string type for a message object of type 'MultiVectorStamped"
  "sun_ros_msgs/MultiVectorStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MultiVectorStamped>)))
  "Returns md5sum for a message object of type '<MultiVectorStamped>"
  "4c082b7820de5e2776a5f02ae355e774")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MultiVectorStamped)))
  "Returns md5sum for a message object of type 'MultiVectorStamped"
  "4c082b7820de5e2776a5f02ae355e774")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MultiVectorStamped>)))
  "Returns full string definition for message of type '<MultiVectorStamped>"
  (cl:format cl:nil "std_msgs/Header header~%MultiVector data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sun_ros_msgs/MultiVector~%float64[] data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MultiVectorStamped)))
  "Returns full string definition for message of type 'MultiVectorStamped"
  (cl:format cl:nil "std_msgs/Header header~%MultiVector data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sun_ros_msgs/MultiVector~%float64[] data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MultiVectorStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MultiVectorStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'MultiVectorStamped
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))

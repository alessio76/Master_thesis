; Auto-generated. Do not edit!


(cl:in-package sun_robot_msgs-srv)


;//! \htmlinclude ClikGetState-request.msg.html

(cl:defclass <ClikGetState-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ClikGetState-request (<ClikGetState-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClikGetState-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClikGetState-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_robot_msgs-srv:<ClikGetState-request> is deprecated: use sun_robot_msgs-srv:ClikGetState-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClikGetState-request>) ostream)
  "Serializes a message object of type '<ClikGetState-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClikGetState-request>) istream)
  "Deserializes a message object of type '<ClikGetState-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClikGetState-request>)))
  "Returns string type for a service object of type '<ClikGetState-request>"
  "sun_robot_msgs/ClikGetStateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikGetState-request)))
  "Returns string type for a service object of type 'ClikGetState-request"
  "sun_robot_msgs/ClikGetStateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClikGetState-request>)))
  "Returns md5sum for a message object of type '<ClikGetState-request>"
  "d91a0f07be437a20a6af62e12e2fad5a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClikGetState-request)))
  "Returns md5sum for a message object of type 'ClikGetState-request"
  "d91a0f07be437a20a6af62e12e2fad5a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClikGetState-request>)))
  "Returns full string definition for message of type '<ClikGetState-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClikGetState-request)))
  "Returns full string definition for message of type 'ClikGetState-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClikGetState-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClikGetState-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ClikGetState-request
))
;//! \htmlinclude ClikGetState-response.msg.html

(cl:defclass <ClikGetState-response> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (robot_joints
    :reader robot_joints
    :initarg :robot_joints
    :type sensor_msgs-msg:JointState
    :initform (cl:make-instance 'sensor_msgs-msg:JointState))
   (dh_joints
    :reader dh_joints
    :initarg :dh_joints
    :type sensor_msgs-msg:JointState
    :initform (cl:make-instance 'sensor_msgs-msg:JointState))
   (ee_pose
    :reader ee_pose
    :initarg :ee_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass ClikGetState-response (<ClikGetState-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClikGetState-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClikGetState-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_robot_msgs-srv:<ClikGetState-response> is deprecated: use sun_robot_msgs-srv:ClikGetState-response instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <ClikGetState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:mode-val is deprecated.  Use sun_robot_msgs-srv:mode instead.")
  (mode m))

(cl:ensure-generic-function 'robot_joints-val :lambda-list '(m))
(cl:defmethod robot_joints-val ((m <ClikGetState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:robot_joints-val is deprecated.  Use sun_robot_msgs-srv:robot_joints instead.")
  (robot_joints m))

(cl:ensure-generic-function 'dh_joints-val :lambda-list '(m))
(cl:defmethod dh_joints-val ((m <ClikGetState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:dh_joints-val is deprecated.  Use sun_robot_msgs-srv:dh_joints instead.")
  (dh_joints m))

(cl:ensure-generic-function 'ee_pose-val :lambda-list '(m))
(cl:defmethod ee_pose-val ((m <ClikGetState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:ee_pose-val is deprecated.  Use sun_robot_msgs-srv:ee_pose instead.")
  (ee_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClikGetState-response>) ostream)
  "Serializes a message object of type '<ClikGetState-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'robot_joints) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'dh_joints) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ee_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClikGetState-response>) istream)
  "Deserializes a message object of type '<ClikGetState-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'robot_joints) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'dh_joints) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ee_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClikGetState-response>)))
  "Returns string type for a service object of type '<ClikGetState-response>"
  "sun_robot_msgs/ClikGetStateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikGetState-response)))
  "Returns string type for a service object of type 'ClikGetState-response"
  "sun_robot_msgs/ClikGetStateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClikGetState-response>)))
  "Returns md5sum for a message object of type '<ClikGetState-response>"
  "d91a0f07be437a20a6af62e12e2fad5a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClikGetState-response)))
  "Returns md5sum for a message object of type 'ClikGetState-response"
  "d91a0f07be437a20a6af62e12e2fad5a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClikGetState-response>)))
  "Returns full string definition for message of type '<ClikGetState-response>"
  (cl:format cl:nil "~%uint8 mode~%sensor_msgs/JointState robot_joints~%sensor_msgs/JointState dh_joints~%geometry_msgs/PoseStamped ee_pose~%~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClikGetState-response)))
  "Returns full string definition for message of type 'ClikGetState-response"
  (cl:format cl:nil "~%uint8 mode~%sensor_msgs/JointState robot_joints~%sensor_msgs/JointState dh_joints~%geometry_msgs/PoseStamped ee_pose~%~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClikGetState-response>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'robot_joints))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'dh_joints))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ee_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClikGetState-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ClikGetState-response
    (cl:cons ':mode (mode msg))
    (cl:cons ':robot_joints (robot_joints msg))
    (cl:cons ':dh_joints (dh_joints msg))
    (cl:cons ':ee_pose (ee_pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ClikGetState)))
  'ClikGetState-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ClikGetState)))
  'ClikGetState-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikGetState)))
  "Returns string type for a service object of type '<ClikGetState>"
  "sun_robot_msgs/ClikGetState")
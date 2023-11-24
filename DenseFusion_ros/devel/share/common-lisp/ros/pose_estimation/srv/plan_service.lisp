; Auto-generated. Do not edit!


(cl:in-package pose_estimation-srv)


;//! \htmlinclude plan_service-request.msg.html

(cl:defclass <plan_service-request> (roslisp-msg-protocol:ros-message)
  ((goal_transform
    :reader goal_transform
    :initarg :goal_transform
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform))
   (planning_group
    :reader planning_group
    :initarg :planning_group
    :type cl:string
    :initform ""))
)

(cl:defclass plan_service-request (<plan_service-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <plan_service-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'plan_service-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pose_estimation-srv:<plan_service-request> is deprecated: use pose_estimation-srv:plan_service-request instead.")))

(cl:ensure-generic-function 'goal_transform-val :lambda-list '(m))
(cl:defmethod goal_transform-val ((m <plan_service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pose_estimation-srv:goal_transform-val is deprecated.  Use pose_estimation-srv:goal_transform instead.")
  (goal_transform m))

(cl:ensure-generic-function 'planning_group-val :lambda-list '(m))
(cl:defmethod planning_group-val ((m <plan_service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pose_estimation-srv:planning_group-val is deprecated.  Use pose_estimation-srv:planning_group instead.")
  (planning_group m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <plan_service-request>) ostream)
  "Serializes a message object of type '<plan_service-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal_transform) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'planning_group))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'planning_group))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <plan_service-request>) istream)
  "Deserializes a message object of type '<plan_service-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal_transform) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'planning_group) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'planning_group) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<plan_service-request>)))
  "Returns string type for a service object of type '<plan_service-request>"
  "pose_estimation/plan_serviceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plan_service-request)))
  "Returns string type for a service object of type 'plan_service-request"
  "pose_estimation/plan_serviceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<plan_service-request>)))
  "Returns md5sum for a message object of type '<plan_service-request>"
  "f3dd71be87193ac42006527f8539da01")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'plan_service-request)))
  "Returns md5sum for a message object of type 'plan_service-request"
  "f3dd71be87193ac42006527f8539da01")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<plan_service-request>)))
  "Returns full string definition for message of type '<plan_service-request>"
  (cl:format cl:nil "geometry_msgs/Transform goal_transform~%string planning_group~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'plan_service-request)))
  "Returns full string definition for message of type 'plan_service-request"
  (cl:format cl:nil "geometry_msgs/Transform goal_transform~%string planning_group~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <plan_service-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal_transform))
     4 (cl:length (cl:slot-value msg 'planning_group))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <plan_service-request>))
  "Converts a ROS message object to a list"
  (cl:list 'plan_service-request
    (cl:cons ':goal_transform (goal_transform msg))
    (cl:cons ':planning_group (planning_group msg))
))
;//! \htmlinclude plan_service-response.msg.html

(cl:defclass <plan_service-response> (roslisp-msg-protocol:ros-message)
  ((trajectory
    :reader trajectory
    :initarg :trajectory
    :type moveit_msgs-msg:RobotTrajectory
    :initform (cl:make-instance 'moveit_msgs-msg:RobotTrajectory))
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass plan_service-response (<plan_service-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <plan_service-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'plan_service-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pose_estimation-srv:<plan_service-response> is deprecated: use pose_estimation-srv:plan_service-response instead.")))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <plan_service-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pose_estimation-srv:trajectory-val is deprecated.  Use pose_estimation-srv:trajectory instead.")
  (trajectory m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <plan_service-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pose_estimation-srv:success-val is deprecated.  Use pose_estimation-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <plan_service-response>) ostream)
  "Serializes a message object of type '<plan_service-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trajectory) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <plan_service-response>) istream)
  "Deserializes a message object of type '<plan_service-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trajectory) istream)
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<plan_service-response>)))
  "Returns string type for a service object of type '<plan_service-response>"
  "pose_estimation/plan_serviceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plan_service-response)))
  "Returns string type for a service object of type 'plan_service-response"
  "pose_estimation/plan_serviceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<plan_service-response>)))
  "Returns md5sum for a message object of type '<plan_service-response>"
  "f3dd71be87193ac42006527f8539da01")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'plan_service-response)))
  "Returns md5sum for a message object of type 'plan_service-response"
  "f3dd71be87193ac42006527f8539da01")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<plan_service-response>)))
  "Returns full string definition for message of type '<plan_service-response>"
  (cl:format cl:nil "moveit_msgs/RobotTrajectory trajectory~%bool success~%~%~%================================================================================~%MSG: moveit_msgs/RobotTrajectory~%trajectory_msgs/JointTrajectory joint_trajectory~%trajectory_msgs/MultiDOFJointTrajectory multi_dof_joint_trajectory~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectory~%# The header is used to specify the coordinate frame and the reference time for the trajectory durations~%Header header~%~%# A representation of a multi-dof joint trajectory (each point is a transformation)~%# Each point along the trajectory will include an array of positions/velocities/accelerations~%# that has the same length as the array of joint names, and has the same order of joints as ~%# the joint names array.~%~%string[] joint_names~%MultiDOFJointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectoryPoint~%# Each multi-dof joint can specify a transform (up to 6 DOF)~%geometry_msgs/Transform[] transforms~%~%# There can be a velocity specified for the origin of the joint ~%geometry_msgs/Twist[] velocities~%~%# There can be an acceleration specified for the origin of the joint ~%geometry_msgs/Twist[] accelerations~%~%duration time_from_start~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'plan_service-response)))
  "Returns full string definition for message of type 'plan_service-response"
  (cl:format cl:nil "moveit_msgs/RobotTrajectory trajectory~%bool success~%~%~%================================================================================~%MSG: moveit_msgs/RobotTrajectory~%trajectory_msgs/JointTrajectory joint_trajectory~%trajectory_msgs/MultiDOFJointTrajectory multi_dof_joint_trajectory~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectory~%# The header is used to specify the coordinate frame and the reference time for the trajectory durations~%Header header~%~%# A representation of a multi-dof joint trajectory (each point is a transformation)~%# Each point along the trajectory will include an array of positions/velocities/accelerations~%# that has the same length as the array of joint names, and has the same order of joints as ~%# the joint names array.~%~%string[] joint_names~%MultiDOFJointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectoryPoint~%# Each multi-dof joint can specify a transform (up to 6 DOF)~%geometry_msgs/Transform[] transforms~%~%# There can be a velocity specified for the origin of the joint ~%geometry_msgs/Twist[] velocities~%~%# There can be an acceleration specified for the origin of the joint ~%geometry_msgs/Twist[] accelerations~%~%duration time_from_start~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <plan_service-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trajectory))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <plan_service-response>))
  "Converts a ROS message object to a list"
  (cl:list 'plan_service-response
    (cl:cons ':trajectory (trajectory msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'plan_service)))
  'plan_service-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'plan_service)))
  'plan_service-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plan_service)))
  "Returns string type for a service object of type '<plan_service>"
  "pose_estimation/plan_service")
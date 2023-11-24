; Auto-generated. Do not edit!


(cl:in-package sun_robot_msgs-msg)


;//! \htmlinclude CartesianTrajectoryPoint.msg.html

(cl:defclass <CartesianTrajectoryPoint> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (velocity
    :reader velocity
    :initarg :velocity
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist))
   (acceleration
    :reader acceleration
    :initarg :acceleration
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist))
   (time_from_start
    :reader time_from_start
    :initarg :time_from_start
    :type cl:real
    :initform 0))
)

(cl:defclass CartesianTrajectoryPoint (<CartesianTrajectoryPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartesianTrajectoryPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartesianTrajectoryPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_robot_msgs-msg:<CartesianTrajectoryPoint> is deprecated: use sun_robot_msgs-msg:CartesianTrajectoryPoint instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <CartesianTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-msg:pose-val is deprecated.  Use sun_robot_msgs-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <CartesianTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-msg:velocity-val is deprecated.  Use sun_robot_msgs-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'acceleration-val :lambda-list '(m))
(cl:defmethod acceleration-val ((m <CartesianTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-msg:acceleration-val is deprecated.  Use sun_robot_msgs-msg:acceleration instead.")
  (acceleration m))

(cl:ensure-generic-function 'time_from_start-val :lambda-list '(m))
(cl:defmethod time_from_start-val ((m <CartesianTrajectoryPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-msg:time_from_start-val is deprecated.  Use sun_robot_msgs-msg:time_from_start instead.")
  (time_from_start m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartesianTrajectoryPoint>) ostream)
  "Serializes a message object of type '<CartesianTrajectoryPoint>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'acceleration) ostream)
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'time_from_start)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'time_from_start) (cl:floor (cl:slot-value msg 'time_from_start)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartesianTrajectoryPoint>) istream)
  "Deserializes a message object of type '<CartesianTrajectoryPoint>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'acceleration) istream)
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time_from_start) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartesianTrajectoryPoint>)))
  "Returns string type for a message object of type '<CartesianTrajectoryPoint>"
  "sun_robot_msgs/CartesianTrajectoryPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartesianTrajectoryPoint)))
  "Returns string type for a message object of type 'CartesianTrajectoryPoint"
  "sun_robot_msgs/CartesianTrajectoryPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartesianTrajectoryPoint>)))
  "Returns md5sum for a message object of type '<CartesianTrajectoryPoint>"
  "4c309845772249e786605716950755c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartesianTrajectoryPoint)))
  "Returns md5sum for a message object of type 'CartesianTrajectoryPoint"
  "4c309845772249e786605716950755c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartesianTrajectoryPoint>)))
  "Returns full string definition for message of type '<CartesianTrajectoryPoint>"
  (cl:format cl:nil "geometry_msgs/Pose pose~%geometry_msgs/Twist velocity~%geometry_msgs/Twist acceleration~%duration time_from_start~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartesianTrajectoryPoint)))
  "Returns full string definition for message of type 'CartesianTrajectoryPoint"
  (cl:format cl:nil "geometry_msgs/Pose pose~%geometry_msgs/Twist velocity~%geometry_msgs/Twist acceleration~%duration time_from_start~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartesianTrajectoryPoint>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'acceleration))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartesianTrajectoryPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'CartesianTrajectoryPoint
    (cl:cons ':pose (pose msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':acceleration (acceleration msg))
    (cl:cons ':time_from_start (time_from_start msg))
))

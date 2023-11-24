; Auto-generated. Do not edit!


(cl:in-package sun_robot_msgs-srv)


;//! \htmlinclude SetEndEffector-request.msg.html

(cl:defclass <SetEndEffector-request> (roslisp-msg-protocol:ros-message)
  ((n_pose_ee
    :reader n_pose_ee
    :initarg :n_pose_ee
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass SetEndEffector-request (<SetEndEffector-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEndEffector-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEndEffector-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_robot_msgs-srv:<SetEndEffector-request> is deprecated: use sun_robot_msgs-srv:SetEndEffector-request instead.")))

(cl:ensure-generic-function 'n_pose_ee-val :lambda-list '(m))
(cl:defmethod n_pose_ee-val ((m <SetEndEffector-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:n_pose_ee-val is deprecated.  Use sun_robot_msgs-srv:n_pose_ee instead.")
  (n_pose_ee m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEndEffector-request>) ostream)
  "Serializes a message object of type '<SetEndEffector-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'n_pose_ee) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEndEffector-request>) istream)
  "Deserializes a message object of type '<SetEndEffector-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'n_pose_ee) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEndEffector-request>)))
  "Returns string type for a service object of type '<SetEndEffector-request>"
  "sun_robot_msgs/SetEndEffectorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEndEffector-request)))
  "Returns string type for a service object of type 'SetEndEffector-request"
  "sun_robot_msgs/SetEndEffectorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEndEffector-request>)))
  "Returns md5sum for a message object of type '<SetEndEffector-request>"
  "8627ab15409195513039221bc8434cb0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEndEffector-request)))
  "Returns md5sum for a message object of type 'SetEndEffector-request"
  "8627ab15409195513039221bc8434cb0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEndEffector-request>)))
  "Returns full string definition for message of type '<SetEndEffector-request>"
  (cl:format cl:nil "geometry_msgs/Pose n_pose_ee #End Effector Pose w.r.t. link n~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEndEffector-request)))
  "Returns full string definition for message of type 'SetEndEffector-request"
  (cl:format cl:nil "geometry_msgs/Pose n_pose_ee #End Effector Pose w.r.t. link n~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEndEffector-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'n_pose_ee))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEndEffector-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEndEffector-request
    (cl:cons ':n_pose_ee (n_pose_ee msg))
))
;//! \htmlinclude SetEndEffector-response.msg.html

(cl:defclass <SetEndEffector-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetEndEffector-response (<SetEndEffector-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEndEffector-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEndEffector-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_robot_msgs-srv:<SetEndEffector-response> is deprecated: use sun_robot_msgs-srv:SetEndEffector-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetEndEffector-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:success-val is deprecated.  Use sun_robot_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEndEffector-response>) ostream)
  "Serializes a message object of type '<SetEndEffector-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEndEffector-response>) istream)
  "Deserializes a message object of type '<SetEndEffector-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEndEffector-response>)))
  "Returns string type for a service object of type '<SetEndEffector-response>"
  "sun_robot_msgs/SetEndEffectorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEndEffector-response)))
  "Returns string type for a service object of type 'SetEndEffector-response"
  "sun_robot_msgs/SetEndEffectorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEndEffector-response>)))
  "Returns md5sum for a message object of type '<SetEndEffector-response>"
  "8627ab15409195513039221bc8434cb0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEndEffector-response)))
  "Returns md5sum for a message object of type 'SetEndEffector-response"
  "8627ab15409195513039221bc8434cb0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEndEffector-response>)))
  "Returns full string definition for message of type '<SetEndEffector-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEndEffector-response)))
  "Returns full string definition for message of type 'SetEndEffector-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEndEffector-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEndEffector-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEndEffector-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetEndEffector)))
  'SetEndEffector-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetEndEffector)))
  'SetEndEffector-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEndEffector)))
  "Returns string type for a service object of type '<SetEndEffector>"
  "sun_robot_msgs/SetEndEffector")
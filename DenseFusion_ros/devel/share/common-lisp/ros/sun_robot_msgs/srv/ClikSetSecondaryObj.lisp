; Auto-generated. Do not edit!


(cl:in-package sun_robot_msgs-srv)


;//! \htmlinclude ClikSetSecondaryObj-request.msg.html

(cl:defclass <ClikSetSecondaryObj-request> (roslisp-msg-protocol:ros-message)
  ((second_obj_gain
    :reader second_obj_gain
    :initarg :second_obj_gain
    :type cl:float
    :initform 0.0)
   (second_obj_joint_velocity_topic
    :reader second_obj_joint_velocity_topic
    :initarg :second_obj_joint_velocity_topic
    :type cl:string
    :initform "")
   (desired_joint_configuration
    :reader desired_joint_configuration
    :initarg :desired_joint_configuration
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (desired_joint_configuration_weights
    :reader desired_joint_configuration_weights
    :initarg :desired_joint_configuration_weights
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ClikSetSecondaryObj-request (<ClikSetSecondaryObj-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClikSetSecondaryObj-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClikSetSecondaryObj-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_robot_msgs-srv:<ClikSetSecondaryObj-request> is deprecated: use sun_robot_msgs-srv:ClikSetSecondaryObj-request instead.")))

(cl:ensure-generic-function 'second_obj_gain-val :lambda-list '(m))
(cl:defmethod second_obj_gain-val ((m <ClikSetSecondaryObj-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:second_obj_gain-val is deprecated.  Use sun_robot_msgs-srv:second_obj_gain instead.")
  (second_obj_gain m))

(cl:ensure-generic-function 'second_obj_joint_velocity_topic-val :lambda-list '(m))
(cl:defmethod second_obj_joint_velocity_topic-val ((m <ClikSetSecondaryObj-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:second_obj_joint_velocity_topic-val is deprecated.  Use sun_robot_msgs-srv:second_obj_joint_velocity_topic instead.")
  (second_obj_joint_velocity_topic m))

(cl:ensure-generic-function 'desired_joint_configuration-val :lambda-list '(m))
(cl:defmethod desired_joint_configuration-val ((m <ClikSetSecondaryObj-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:desired_joint_configuration-val is deprecated.  Use sun_robot_msgs-srv:desired_joint_configuration instead.")
  (desired_joint_configuration m))

(cl:ensure-generic-function 'desired_joint_configuration_weights-val :lambda-list '(m))
(cl:defmethod desired_joint_configuration_weights-val ((m <ClikSetSecondaryObj-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:desired_joint_configuration_weights-val is deprecated.  Use sun_robot_msgs-srv:desired_joint_configuration_weights instead.")
  (desired_joint_configuration_weights m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClikSetSecondaryObj-request>) ostream)
  "Serializes a message object of type '<ClikSetSecondaryObj-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'second_obj_gain))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'second_obj_joint_velocity_topic))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'second_obj_joint_velocity_topic))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'desired_joint_configuration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'desired_joint_configuration))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'desired_joint_configuration_weights))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'desired_joint_configuration_weights))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClikSetSecondaryObj-request>) istream)
  "Deserializes a message object of type '<ClikSetSecondaryObj-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'second_obj_gain) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'second_obj_joint_velocity_topic) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'second_obj_joint_velocity_topic) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'desired_joint_configuration) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'desired_joint_configuration)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'desired_joint_configuration_weights) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'desired_joint_configuration_weights)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClikSetSecondaryObj-request>)))
  "Returns string type for a service object of type '<ClikSetSecondaryObj-request>"
  "sun_robot_msgs/ClikSetSecondaryObjRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikSetSecondaryObj-request)))
  "Returns string type for a service object of type 'ClikSetSecondaryObj-request"
  "sun_robot_msgs/ClikSetSecondaryObjRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClikSetSecondaryObj-request>)))
  "Returns md5sum for a message object of type '<ClikSetSecondaryObj-request>"
  "c07b3a4257a25972a24b9bc4876a5736")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClikSetSecondaryObj-request)))
  "Returns md5sum for a message object of type 'ClikSetSecondaryObj-request"
  "c07b3a4257a25972a24b9bc4876a5736")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClikSetSecondaryObj-request>)))
  "Returns full string definition for message of type '<ClikSetSecondaryObj-request>"
  (cl:format cl:nil "float64 second_obj_gain #Gain of the second obj~%~%##~%##The following options are mutually exclusive, you can't set both~%##~%~%# Mode: Objective from topic~%# desired joint velocity for the second objective~%# the velocity will be projected in the jacobian kernel~%string second_obj_joint_velocity_topic~%~%# Mode: Objective is: reach the desired joint configuration~%float64[] desired_joint_configuration~%float64[] desired_joint_configuration_weights~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClikSetSecondaryObj-request)))
  "Returns full string definition for message of type 'ClikSetSecondaryObj-request"
  (cl:format cl:nil "float64 second_obj_gain #Gain of the second obj~%~%##~%##The following options are mutually exclusive, you can't set both~%##~%~%# Mode: Objective from topic~%# desired joint velocity for the second objective~%# the velocity will be projected in the jacobian kernel~%string second_obj_joint_velocity_topic~%~%# Mode: Objective is: reach the desired joint configuration~%float64[] desired_joint_configuration~%float64[] desired_joint_configuration_weights~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClikSetSecondaryObj-request>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'second_obj_joint_velocity_topic))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'desired_joint_configuration) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'desired_joint_configuration_weights) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClikSetSecondaryObj-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ClikSetSecondaryObj-request
    (cl:cons ':second_obj_gain (second_obj_gain msg))
    (cl:cons ':second_obj_joint_velocity_topic (second_obj_joint_velocity_topic msg))
    (cl:cons ':desired_joint_configuration (desired_joint_configuration msg))
    (cl:cons ':desired_joint_configuration_weights (desired_joint_configuration_weights msg))
))
;//! \htmlinclude ClikSetSecondaryObj-response.msg.html

(cl:defclass <ClikSetSecondaryObj-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ClikSetSecondaryObj-response (<ClikSetSecondaryObj-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClikSetSecondaryObj-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClikSetSecondaryObj-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_robot_msgs-srv:<ClikSetSecondaryObj-response> is deprecated: use sun_robot_msgs-srv:ClikSetSecondaryObj-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ClikSetSecondaryObj-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:success-val is deprecated.  Use sun_robot_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClikSetSecondaryObj-response>) ostream)
  "Serializes a message object of type '<ClikSetSecondaryObj-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClikSetSecondaryObj-response>) istream)
  "Deserializes a message object of type '<ClikSetSecondaryObj-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClikSetSecondaryObj-response>)))
  "Returns string type for a service object of type '<ClikSetSecondaryObj-response>"
  "sun_robot_msgs/ClikSetSecondaryObjResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikSetSecondaryObj-response)))
  "Returns string type for a service object of type 'ClikSetSecondaryObj-response"
  "sun_robot_msgs/ClikSetSecondaryObjResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClikSetSecondaryObj-response>)))
  "Returns md5sum for a message object of type '<ClikSetSecondaryObj-response>"
  "c07b3a4257a25972a24b9bc4876a5736")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClikSetSecondaryObj-response)))
  "Returns md5sum for a message object of type 'ClikSetSecondaryObj-response"
  "c07b3a4257a25972a24b9bc4876a5736")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClikSetSecondaryObj-response>)))
  "Returns full string definition for message of type '<ClikSetSecondaryObj-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClikSetSecondaryObj-response)))
  "Returns full string definition for message of type 'ClikSetSecondaryObj-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClikSetSecondaryObj-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClikSetSecondaryObj-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ClikSetSecondaryObj-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ClikSetSecondaryObj)))
  'ClikSetSecondaryObj-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ClikSetSecondaryObj)))
  'ClikSetSecondaryObj-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikSetSecondaryObj)))
  "Returns string type for a service object of type '<ClikSetSecondaryObj>"
  "sun_robot_msgs/ClikSetSecondaryObj")
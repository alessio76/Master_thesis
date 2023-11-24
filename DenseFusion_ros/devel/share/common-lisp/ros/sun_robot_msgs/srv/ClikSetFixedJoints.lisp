; Auto-generated. Do not edit!


(cl:in-package sun_robot_msgs-srv)


;//! \htmlinclude ClikSetFixedJoints-request.msg.html

(cl:defclass <ClikSetFixedJoints-request> (roslisp-msg-protocol:ros-message)
  ((fixed_joints_names
    :reader fixed_joints_names
    :initarg :fixed_joints_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass ClikSetFixedJoints-request (<ClikSetFixedJoints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClikSetFixedJoints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClikSetFixedJoints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_robot_msgs-srv:<ClikSetFixedJoints-request> is deprecated: use sun_robot_msgs-srv:ClikSetFixedJoints-request instead.")))

(cl:ensure-generic-function 'fixed_joints_names-val :lambda-list '(m))
(cl:defmethod fixed_joints_names-val ((m <ClikSetFixedJoints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:fixed_joints_names-val is deprecated.  Use sun_robot_msgs-srv:fixed_joints_names instead.")
  (fixed_joints_names m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClikSetFixedJoints-request>) ostream)
  "Serializes a message object of type '<ClikSetFixedJoints-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'fixed_joints_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'fixed_joints_names))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClikSetFixedJoints-request>) istream)
  "Deserializes a message object of type '<ClikSetFixedJoints-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'fixed_joints_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'fixed_joints_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClikSetFixedJoints-request>)))
  "Returns string type for a service object of type '<ClikSetFixedJoints-request>"
  "sun_robot_msgs/ClikSetFixedJointsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikSetFixedJoints-request)))
  "Returns string type for a service object of type 'ClikSetFixedJoints-request"
  "sun_robot_msgs/ClikSetFixedJointsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClikSetFixedJoints-request>)))
  "Returns md5sum for a message object of type '<ClikSetFixedJoints-request>"
  "6214dae94e45bca5ba2b39af858137d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClikSetFixedJoints-request)))
  "Returns md5sum for a message object of type 'ClikSetFixedJoints-request"
  "6214dae94e45bca5ba2b39af858137d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClikSetFixedJoints-request>)))
  "Returns full string definition for message of type '<ClikSetFixedJoints-request>"
  (cl:format cl:nil "string[] fixed_joints_names~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClikSetFixedJoints-request)))
  "Returns full string definition for message of type 'ClikSetFixedJoints-request"
  (cl:format cl:nil "string[] fixed_joints_names~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClikSetFixedJoints-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'fixed_joints_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClikSetFixedJoints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ClikSetFixedJoints-request
    (cl:cons ':fixed_joints_names (fixed_joints_names msg))
))
;//! \htmlinclude ClikSetFixedJoints-response.msg.html

(cl:defclass <ClikSetFixedJoints-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ClikSetFixedJoints-response (<ClikSetFixedJoints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClikSetFixedJoints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClikSetFixedJoints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_robot_msgs-srv:<ClikSetFixedJoints-response> is deprecated: use sun_robot_msgs-srv:ClikSetFixedJoints-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ClikSetFixedJoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:success-val is deprecated.  Use sun_robot_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ClikSetFixedJoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:message-val is deprecated.  Use sun_robot_msgs-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClikSetFixedJoints-response>) ostream)
  "Serializes a message object of type '<ClikSetFixedJoints-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClikSetFixedJoints-response>) istream)
  "Deserializes a message object of type '<ClikSetFixedJoints-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClikSetFixedJoints-response>)))
  "Returns string type for a service object of type '<ClikSetFixedJoints-response>"
  "sun_robot_msgs/ClikSetFixedJointsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikSetFixedJoints-response)))
  "Returns string type for a service object of type 'ClikSetFixedJoints-response"
  "sun_robot_msgs/ClikSetFixedJointsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClikSetFixedJoints-response>)))
  "Returns md5sum for a message object of type '<ClikSetFixedJoints-response>"
  "6214dae94e45bca5ba2b39af858137d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClikSetFixedJoints-response)))
  "Returns md5sum for a message object of type 'ClikSetFixedJoints-response"
  "6214dae94e45bca5ba2b39af858137d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClikSetFixedJoints-response>)))
  "Returns full string definition for message of type '<ClikSetFixedJoints-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClikSetFixedJoints-response)))
  "Returns full string definition for message of type 'ClikSetFixedJoints-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClikSetFixedJoints-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClikSetFixedJoints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ClikSetFixedJoints-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ClikSetFixedJoints)))
  'ClikSetFixedJoints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ClikSetFixedJoints)))
  'ClikSetFixedJoints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikSetFixedJoints)))
  "Returns string type for a service object of type '<ClikSetFixedJoints>"
  "sun_robot_msgs/ClikSetFixedJoints")
; Auto-generated. Do not edit!


(cl:in-package sun_robot_msgs-srv)


;//! \htmlinclude ClikSetMode-request.msg.html

(cl:defclass <ClikSetMode-request> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ClikSetMode-request (<ClikSetMode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClikSetMode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClikSetMode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_robot_msgs-srv:<ClikSetMode-request> is deprecated: use sun_robot_msgs-srv:ClikSetMode-request instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <ClikSetMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:mode-val is deprecated.  Use sun_robot_msgs-srv:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ClikSetMode-request>)))
    "Constants for message type '<ClikSetMode-request>"
  '((:MODE_STOP . 0)
    (:MODE_POSITION . 1)
    (:MODE_VELOCITY . 2)
    (:MODE_VELOCITY_EE . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ClikSetMode-request)))
    "Constants for message type 'ClikSetMode-request"
  '((:MODE_STOP . 0)
    (:MODE_POSITION . 1)
    (:MODE_VELOCITY . 2)
    (:MODE_VELOCITY_EE . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClikSetMode-request>) ostream)
  "Serializes a message object of type '<ClikSetMode-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClikSetMode-request>) istream)
  "Deserializes a message object of type '<ClikSetMode-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClikSetMode-request>)))
  "Returns string type for a service object of type '<ClikSetMode-request>"
  "sun_robot_msgs/ClikSetModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikSetMode-request)))
  "Returns string type for a service object of type 'ClikSetMode-request"
  "sun_robot_msgs/ClikSetModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClikSetMode-request>)))
  "Returns md5sum for a message object of type '<ClikSetMode-request>"
  "63bcd8541111fcf71e8171764caa9288")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClikSetMode-request)))
  "Returns md5sum for a message object of type 'ClikSetMode-request"
  "63bcd8541111fcf71e8171764caa9288")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClikSetMode-request>)))
  "Returns full string definition for message of type '<ClikSetMode-request>"
  (cl:format cl:nil "uint8 MODE_STOP=0~%uint8 MODE_POSITION=1~%uint8 MODE_VELOCITY=2~%uint8 MODE_VELOCITY_EE=3~%uint8 mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClikSetMode-request)))
  "Returns full string definition for message of type 'ClikSetMode-request"
  (cl:format cl:nil "uint8 MODE_STOP=0~%uint8 MODE_POSITION=1~%uint8 MODE_VELOCITY=2~%uint8 MODE_VELOCITY_EE=3~%uint8 mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClikSetMode-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClikSetMode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ClikSetMode-request
    (cl:cons ':mode (mode msg))
))
;//! \htmlinclude ClikSetMode-response.msg.html

(cl:defclass <ClikSetMode-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ClikSetMode-response (<ClikSetMode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClikSetMode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClikSetMode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sun_robot_msgs-srv:<ClikSetMode-response> is deprecated: use sun_robot_msgs-srv:ClikSetMode-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ClikSetMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sun_robot_msgs-srv:success-val is deprecated.  Use sun_robot_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClikSetMode-response>) ostream)
  "Serializes a message object of type '<ClikSetMode-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClikSetMode-response>) istream)
  "Deserializes a message object of type '<ClikSetMode-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClikSetMode-response>)))
  "Returns string type for a service object of type '<ClikSetMode-response>"
  "sun_robot_msgs/ClikSetModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikSetMode-response)))
  "Returns string type for a service object of type 'ClikSetMode-response"
  "sun_robot_msgs/ClikSetModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClikSetMode-response>)))
  "Returns md5sum for a message object of type '<ClikSetMode-response>"
  "63bcd8541111fcf71e8171764caa9288")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClikSetMode-response)))
  "Returns md5sum for a message object of type 'ClikSetMode-response"
  "63bcd8541111fcf71e8171764caa9288")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClikSetMode-response>)))
  "Returns full string definition for message of type '<ClikSetMode-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClikSetMode-response)))
  "Returns full string definition for message of type 'ClikSetMode-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClikSetMode-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClikSetMode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ClikSetMode-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ClikSetMode)))
  'ClikSetMode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ClikSetMode)))
  'ClikSetMode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClikSetMode)))
  "Returns string type for a service object of type '<ClikSetMode>"
  "sun_robot_msgs/ClikSetMode")
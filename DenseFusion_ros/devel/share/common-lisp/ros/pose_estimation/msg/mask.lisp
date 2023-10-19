; Auto-generated. Do not edit!


(cl:in-package pose_estimation-msg)


;//! \htmlinclude mask.msg.html

(cl:defclass <mask> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (mask
    :reader mask
    :initarg :mask
    :type std_msgs-msg:Int8MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Int8MultiArray))
   (classes
    :reader classes
    :initarg :classes
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass mask (<mask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pose_estimation-msg:<mask> is deprecated: use pose_estimation-msg:mask instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <mask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pose_estimation-msg:header-val is deprecated.  Use pose_estimation-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'mask-val :lambda-list '(m))
(cl:defmethod mask-val ((m <mask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pose_estimation-msg:mask-val is deprecated.  Use pose_estimation-msg:mask instead.")
  (mask m))

(cl:ensure-generic-function 'classes-val :lambda-list '(m))
(cl:defmethod classes-val ((m <mask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pose_estimation-msg:classes-val is deprecated.  Use pose_estimation-msg:classes instead.")
  (classes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mask>) ostream)
  "Serializes a message object of type '<mask>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'mask) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'classes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'classes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mask>) istream)
  "Deserializes a message object of type '<mask>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'mask) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'classes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'classes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mask>)))
  "Returns string type for a message object of type '<mask>"
  "pose_estimation/mask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mask)))
  "Returns string type for a message object of type 'mask"
  "pose_estimation/mask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mask>)))
  "Returns md5sum for a message object of type '<mask>"
  "f9fdf2d4d86599b240a22049ffa0278e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mask)))
  "Returns md5sum for a message object of type 'mask"
  "f9fdf2d4d86599b240a22049ffa0278e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mask>)))
  "Returns full string definition for message of type '<mask>"
  (cl:format cl:nil "Header header~%std_msgs/Int8MultiArray mask~%int8[] classes~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int8MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int8[]            data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mask)))
  "Returns full string definition for message of type 'mask"
  (cl:format cl:nil "Header header~%std_msgs/Int8MultiArray mask~%int8[] classes~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int8MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int8[]            data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mask>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'mask))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'classes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mask>))
  "Converts a ROS message object to a list"
  (cl:list 'mask
    (cl:cons ':header (header msg))
    (cl:cons ':mask (mask msg))
    (cl:cons ':classes (classes msg))
))

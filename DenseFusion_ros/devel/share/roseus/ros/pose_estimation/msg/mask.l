;; Auto-generated. Do not edit!


(when (boundp 'pose_estimation::mask)
  (if (not (find-package "POSE_ESTIMATION"))
    (make-package "POSE_ESTIMATION"))
  (shadow 'mask (find-package "POSE_ESTIMATION")))
(unless (find-package "POSE_ESTIMATION::MASK")
  (make-package "POSE_ESTIMATION::MASK"))

(in-package "ROS")
;;//! \htmlinclude mask.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pose_estimation::mask
  :super ros::object
  :slots (_header _mask _classes ))

(defmethod pose_estimation::mask
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:mask __mask) (instance std_msgs::Int8MultiArray :init))
    ((:classes __classes) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _mask __mask)
   (setq _classes __classes)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:mask
   (&rest __mask)
   (if (keywordp (car __mask))
       (send* _mask __mask)
     (progn
       (if __mask (setq _mask (car __mask)))
       _mask)))
  (:classes
   (&optional __classes)
   (if __classes (setq _classes __classes)) _classes)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/Int8MultiArray _mask
    (send _mask :serialization-length)
    ;; int8[] _classes
    (* 1    (length _classes)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/Int8MultiArray _mask
       (send _mask :serialize s)
     ;; int8[] _classes
     (write-long (length _classes) s)
     (dotimes (i (length _classes))
       (write-byte (elt _classes i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/Int8MultiArray _mask
     (send _mask :deserialize buf ptr-) (incf ptr- (send _mask :serialization-length))
   ;; int8[] _classes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _classes (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _classes i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _classes i) 127) (setf (elt _classes i) (- (elt _classes i) 256)))
     ))
   ;;
   self)
  )

(setf (get pose_estimation::mask :md5sum-) "f9fdf2d4d86599b240a22049ffa0278e")
(setf (get pose_estimation::mask :datatype-) "pose_estimation/mask")
(setf (get pose_estimation::mask :definition-)
      "Header header
std_msgs/Int8MultiArray mask
int8[] classes

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: std_msgs/Int8MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
int8[]            data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
uint32 stride  # stride of given dimension
")



(provide :pose_estimation/mask "f9fdf2d4d86599b240a22049ffa0278e")



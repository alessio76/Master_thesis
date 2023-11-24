;; Auto-generated. Do not edit!


(when (boundp 'sun_ros_msgs::MultiVectorStamped)
  (if (not (find-package "SUN_ROS_MSGS"))
    (make-package "SUN_ROS_MSGS"))
  (shadow 'MultiVectorStamped (find-package "SUN_ROS_MSGS")))
(unless (find-package "SUN_ROS_MSGS::MULTIVECTORSTAMPED")
  (make-package "SUN_ROS_MSGS::MULTIVECTORSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude MultiVectorStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sun_ros_msgs::MultiVectorStamped
  :super ros::object
  :slots (_header _data ))

(defmethod sun_ros_msgs::MultiVectorStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:data __data) (instance sun_ros_msgs::MultiVector :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; sun_ros_msgs/MultiVector _data
    (send _data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; sun_ros_msgs/MultiVector _data
       (send _data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; sun_ros_msgs/MultiVector _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;;
   self)
  )

(setf (get sun_ros_msgs::MultiVectorStamped :md5sum-) "4c082b7820de5e2776a5f02ae355e774")
(setf (get sun_ros_msgs::MultiVectorStamped :datatype-) "sun_ros_msgs/MultiVectorStamped")
(setf (get sun_ros_msgs::MultiVectorStamped :definition-)
      "std_msgs/Header header
MultiVector data
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
MSG: sun_ros_msgs/MultiVector
float64[] data
")



(provide :sun_ros_msgs/MultiVectorStamped "4c082b7820de5e2776a5f02ae355e774")



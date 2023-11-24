;; Auto-generated. Do not edit!


(when (boundp 'sun_ros_msgs::Trigger)
  (if (not (find-package "SUN_ROS_MSGS"))
    (make-package "SUN_ROS_MSGS"))
  (shadow 'Trigger (find-package "SUN_ROS_MSGS")))
(unless (find-package "SUN_ROS_MSGS::TRIGGER")
  (make-package "SUN_ROS_MSGS::TRIGGER"))
(unless (find-package "SUN_ROS_MSGS::TRIGGERREQUEST")
  (make-package "SUN_ROS_MSGS::TRIGGERREQUEST"))
(unless (find-package "SUN_ROS_MSGS::TRIGGERRESPONSE")
  (make-package "SUN_ROS_MSGS::TRIGGERRESPONSE"))

(in-package "ROS")





(defclass sun_ros_msgs::TriggerRequest
  :super ros::object
  :slots ())

(defmethod sun_ros_msgs::TriggerRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass sun_ros_msgs::TriggerResponse
  :super ros::object
  :slots (_success _message ))

(defmethod sun_ros_msgs::TriggerResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass sun_ros_msgs::Trigger
  :super ros::object
  :slots ())

(setf (get sun_ros_msgs::Trigger :md5sum-) "937c9679a518e3a18d831e57125ea522")
(setf (get sun_ros_msgs::Trigger :datatype-) "sun_ros_msgs/Trigger")
(setf (get sun_ros_msgs::Trigger :request) sun_ros_msgs::TriggerRequest)
(setf (get sun_ros_msgs::Trigger :response) sun_ros_msgs::TriggerResponse)

(defmethod sun_ros_msgs::TriggerRequest
  (:response () (instance sun_ros_msgs::TriggerResponse :init)))

(setf (get sun_ros_msgs::TriggerRequest :md5sum-) "937c9679a518e3a18d831e57125ea522")
(setf (get sun_ros_msgs::TriggerRequest :datatype-) "sun_ros_msgs/TriggerRequest")
(setf (get sun_ros_msgs::TriggerRequest :definition-)
      "---
bool success
string message
")

(setf (get sun_ros_msgs::TriggerResponse :md5sum-) "937c9679a518e3a18d831e57125ea522")
(setf (get sun_ros_msgs::TriggerResponse :datatype-) "sun_ros_msgs/TriggerResponse")
(setf (get sun_ros_msgs::TriggerResponse :definition-)
      "---
bool success
string message
")



(provide :sun_ros_msgs/Trigger "937c9679a518e3a18d831e57125ea522")



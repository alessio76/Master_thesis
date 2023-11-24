;; Auto-generated. Do not edit!


(when (boundp 'sun_robot_msgs::ClikSetMode)
  (if (not (find-package "SUN_ROBOT_MSGS"))
    (make-package "SUN_ROBOT_MSGS"))
  (shadow 'ClikSetMode (find-package "SUN_ROBOT_MSGS")))
(unless (find-package "SUN_ROBOT_MSGS::CLIKSETMODE")
  (make-package "SUN_ROBOT_MSGS::CLIKSETMODE"))
(unless (find-package "SUN_ROBOT_MSGS::CLIKSETMODEREQUEST")
  (make-package "SUN_ROBOT_MSGS::CLIKSETMODEREQUEST"))
(unless (find-package "SUN_ROBOT_MSGS::CLIKSETMODERESPONSE")
  (make-package "SUN_ROBOT_MSGS::CLIKSETMODERESPONSE"))

(in-package "ROS")





(intern "*MODE_STOP*" (find-package "SUN_ROBOT_MSGS::CLIKSETMODEREQUEST"))
(shadow '*MODE_STOP* (find-package "SUN_ROBOT_MSGS::CLIKSETMODEREQUEST"))
(defconstant sun_robot_msgs::ClikSetModeRequest::*MODE_STOP* 0)
(intern "*MODE_POSITION*" (find-package "SUN_ROBOT_MSGS::CLIKSETMODEREQUEST"))
(shadow '*MODE_POSITION* (find-package "SUN_ROBOT_MSGS::CLIKSETMODEREQUEST"))
(defconstant sun_robot_msgs::ClikSetModeRequest::*MODE_POSITION* 1)
(intern "*MODE_VELOCITY*" (find-package "SUN_ROBOT_MSGS::CLIKSETMODEREQUEST"))
(shadow '*MODE_VELOCITY* (find-package "SUN_ROBOT_MSGS::CLIKSETMODEREQUEST"))
(defconstant sun_robot_msgs::ClikSetModeRequest::*MODE_VELOCITY* 2)
(intern "*MODE_VELOCITY_EE*" (find-package "SUN_ROBOT_MSGS::CLIKSETMODEREQUEST"))
(shadow '*MODE_VELOCITY_EE* (find-package "SUN_ROBOT_MSGS::CLIKSETMODEREQUEST"))
(defconstant sun_robot_msgs::ClikSetModeRequest::*MODE_VELOCITY_EE* 3)

(defun sun_robot_msgs::ClikSetModeRequest-to-symbol (const)
  (cond
        ((= const 0) 'sun_robot_msgs::ClikSetModeRequest::*MODE_STOP*)
        ((= const 1) 'sun_robot_msgs::ClikSetModeRequest::*MODE_POSITION*)
        ((= const 2) 'sun_robot_msgs::ClikSetModeRequest::*MODE_VELOCITY*)
        ((= const 3) 'sun_robot_msgs::ClikSetModeRequest::*MODE_VELOCITY_EE*)
        (t nil)))

(defclass sun_robot_msgs::ClikSetModeRequest
  :super ros::object
  :slots (_mode ))

(defmethod sun_robot_msgs::ClikSetModeRequest
  (:init
   (&key
    ((:mode __mode) 0)
    )
   (send-super :init)
   (setq _mode (round __mode))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; uint8 _mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _mode
       (write-byte _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass sun_robot_msgs::ClikSetModeResponse
  :super ros::object
  :slots (_success ))

(defmethod sun_robot_msgs::ClikSetModeResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass sun_robot_msgs::ClikSetMode
  :super ros::object
  :slots ())

(setf (get sun_robot_msgs::ClikSetMode :md5sum-) "63bcd8541111fcf71e8171764caa9288")
(setf (get sun_robot_msgs::ClikSetMode :datatype-) "sun_robot_msgs/ClikSetMode")
(setf (get sun_robot_msgs::ClikSetMode :request) sun_robot_msgs::ClikSetModeRequest)
(setf (get sun_robot_msgs::ClikSetMode :response) sun_robot_msgs::ClikSetModeResponse)

(defmethod sun_robot_msgs::ClikSetModeRequest
  (:response () (instance sun_robot_msgs::ClikSetModeResponse :init)))

(setf (get sun_robot_msgs::ClikSetModeRequest :md5sum-) "63bcd8541111fcf71e8171764caa9288")
(setf (get sun_robot_msgs::ClikSetModeRequest :datatype-) "sun_robot_msgs/ClikSetModeRequest")
(setf (get sun_robot_msgs::ClikSetModeRequest :definition-)
      "uint8 MODE_STOP=0
uint8 MODE_POSITION=1
uint8 MODE_VELOCITY=2
uint8 MODE_VELOCITY_EE=3
uint8 mode
---
bool success
")

(setf (get sun_robot_msgs::ClikSetModeResponse :md5sum-) "63bcd8541111fcf71e8171764caa9288")
(setf (get sun_robot_msgs::ClikSetModeResponse :datatype-) "sun_robot_msgs/ClikSetModeResponse")
(setf (get sun_robot_msgs::ClikSetModeResponse :definition-)
      "uint8 MODE_STOP=0
uint8 MODE_POSITION=1
uint8 MODE_VELOCITY=2
uint8 MODE_VELOCITY_EE=3
uint8 mode
---
bool success
")



(provide :sun_robot_msgs/ClikSetMode "63bcd8541111fcf71e8171764caa9288")



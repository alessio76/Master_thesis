;; Auto-generated. Do not edit!


(when (boundp 'sun_robot_msgs::ClikSetFixedJoints)
  (if (not (find-package "SUN_ROBOT_MSGS"))
    (make-package "SUN_ROBOT_MSGS"))
  (shadow 'ClikSetFixedJoints (find-package "SUN_ROBOT_MSGS")))
(unless (find-package "SUN_ROBOT_MSGS::CLIKSETFIXEDJOINTS")
  (make-package "SUN_ROBOT_MSGS::CLIKSETFIXEDJOINTS"))
(unless (find-package "SUN_ROBOT_MSGS::CLIKSETFIXEDJOINTSREQUEST")
  (make-package "SUN_ROBOT_MSGS::CLIKSETFIXEDJOINTSREQUEST"))
(unless (find-package "SUN_ROBOT_MSGS::CLIKSETFIXEDJOINTSRESPONSE")
  (make-package "SUN_ROBOT_MSGS::CLIKSETFIXEDJOINTSRESPONSE"))

(in-package "ROS")





(defclass sun_robot_msgs::ClikSetFixedJointsRequest
  :super ros::object
  :slots (_fixed_joints_names ))

(defmethod sun_robot_msgs::ClikSetFixedJointsRequest
  (:init
   (&key
    ((:fixed_joints_names __fixed_joints_names) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _fixed_joints_names __fixed_joints_names)
   self)
  (:fixed_joints_names
   (&optional __fixed_joints_names)
   (if __fixed_joints_names (setq _fixed_joints_names __fixed_joints_names)) _fixed_joints_names)
  (:serialization-length
   ()
   (+
    ;; string[] _fixed_joints_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _fixed_joints_names)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _fixed_joints_names
     (write-long (length _fixed_joints_names) s)
     (dolist (elem _fixed_joints_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _fixed_joints_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _fixed_joints_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _fixed_joints_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass sun_robot_msgs::ClikSetFixedJointsResponse
  :super ros::object
  :slots (_success _message ))

(defmethod sun_robot_msgs::ClikSetFixedJointsResponse
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

(defclass sun_robot_msgs::ClikSetFixedJoints
  :super ros::object
  :slots ())

(setf (get sun_robot_msgs::ClikSetFixedJoints :md5sum-) "6214dae94e45bca5ba2b39af858137d6")
(setf (get sun_robot_msgs::ClikSetFixedJoints :datatype-) "sun_robot_msgs/ClikSetFixedJoints")
(setf (get sun_robot_msgs::ClikSetFixedJoints :request) sun_robot_msgs::ClikSetFixedJointsRequest)
(setf (get sun_robot_msgs::ClikSetFixedJoints :response) sun_robot_msgs::ClikSetFixedJointsResponse)

(defmethod sun_robot_msgs::ClikSetFixedJointsRequest
  (:response () (instance sun_robot_msgs::ClikSetFixedJointsResponse :init)))

(setf (get sun_robot_msgs::ClikSetFixedJointsRequest :md5sum-) "6214dae94e45bca5ba2b39af858137d6")
(setf (get sun_robot_msgs::ClikSetFixedJointsRequest :datatype-) "sun_robot_msgs/ClikSetFixedJointsRequest")
(setf (get sun_robot_msgs::ClikSetFixedJointsRequest :definition-)
      "string[] fixed_joints_names
---
bool success
string message
")

(setf (get sun_robot_msgs::ClikSetFixedJointsResponse :md5sum-) "6214dae94e45bca5ba2b39af858137d6")
(setf (get sun_robot_msgs::ClikSetFixedJointsResponse :datatype-) "sun_robot_msgs/ClikSetFixedJointsResponse")
(setf (get sun_robot_msgs::ClikSetFixedJointsResponse :definition-)
      "string[] fixed_joints_names
---
bool success
string message
")



(provide :sun_robot_msgs/ClikSetFixedJoints "6214dae94e45bca5ba2b39af858137d6")



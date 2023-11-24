;; Auto-generated. Do not edit!


(when (boundp 'sun_robot_msgs::SetEndEffector)
  (if (not (find-package "SUN_ROBOT_MSGS"))
    (make-package "SUN_ROBOT_MSGS"))
  (shadow 'SetEndEffector (find-package "SUN_ROBOT_MSGS")))
(unless (find-package "SUN_ROBOT_MSGS::SETENDEFFECTOR")
  (make-package "SUN_ROBOT_MSGS::SETENDEFFECTOR"))
(unless (find-package "SUN_ROBOT_MSGS::SETENDEFFECTORREQUEST")
  (make-package "SUN_ROBOT_MSGS::SETENDEFFECTORREQUEST"))
(unless (find-package "SUN_ROBOT_MSGS::SETENDEFFECTORRESPONSE")
  (make-package "SUN_ROBOT_MSGS::SETENDEFFECTORRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass sun_robot_msgs::SetEndEffectorRequest
  :super ros::object
  :slots (_n_pose_ee ))

(defmethod sun_robot_msgs::SetEndEffectorRequest
  (:init
   (&key
    ((:n_pose_ee __n_pose_ee) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _n_pose_ee __n_pose_ee)
   self)
  (:n_pose_ee
   (&rest __n_pose_ee)
   (if (keywordp (car __n_pose_ee))
       (send* _n_pose_ee __n_pose_ee)
     (progn
       (if __n_pose_ee (setq _n_pose_ee (car __n_pose_ee)))
       _n_pose_ee)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _n_pose_ee
    (send _n_pose_ee :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _n_pose_ee
       (send _n_pose_ee :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _n_pose_ee
     (send _n_pose_ee :deserialize buf ptr-) (incf ptr- (send _n_pose_ee :serialization-length))
   ;;
   self)
  )

(defclass sun_robot_msgs::SetEndEffectorResponse
  :super ros::object
  :slots (_success ))

(defmethod sun_robot_msgs::SetEndEffectorResponse
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

(defclass sun_robot_msgs::SetEndEffector
  :super ros::object
  :slots ())

(setf (get sun_robot_msgs::SetEndEffector :md5sum-) "8627ab15409195513039221bc8434cb0")
(setf (get sun_robot_msgs::SetEndEffector :datatype-) "sun_robot_msgs/SetEndEffector")
(setf (get sun_robot_msgs::SetEndEffector :request) sun_robot_msgs::SetEndEffectorRequest)
(setf (get sun_robot_msgs::SetEndEffector :response) sun_robot_msgs::SetEndEffectorResponse)

(defmethod sun_robot_msgs::SetEndEffectorRequest
  (:response () (instance sun_robot_msgs::SetEndEffectorResponse :init)))

(setf (get sun_robot_msgs::SetEndEffectorRequest :md5sum-) "8627ab15409195513039221bc8434cb0")
(setf (get sun_robot_msgs::SetEndEffectorRequest :datatype-) "sun_robot_msgs/SetEndEffectorRequest")
(setf (get sun_robot_msgs::SetEndEffectorRequest :definition-)
      "geometry_msgs/Pose n_pose_ee #End Effector Pose w.r.t. link n

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
")

(setf (get sun_robot_msgs::SetEndEffectorResponse :md5sum-) "8627ab15409195513039221bc8434cb0")
(setf (get sun_robot_msgs::SetEndEffectorResponse :datatype-) "sun_robot_msgs/SetEndEffectorResponse")
(setf (get sun_robot_msgs::SetEndEffectorResponse :definition-)
      "geometry_msgs/Pose n_pose_ee #End Effector Pose w.r.t. link n

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
")



(provide :sun_robot_msgs/SetEndEffector "8627ab15409195513039221bc8434cb0")



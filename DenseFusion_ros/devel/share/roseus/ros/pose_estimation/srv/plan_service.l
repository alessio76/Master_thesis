;; Auto-generated. Do not edit!


(when (boundp 'pose_estimation::plan_service)
  (if (not (find-package "POSE_ESTIMATION"))
    (make-package "POSE_ESTIMATION"))
  (shadow 'plan_service (find-package "POSE_ESTIMATION")))
(unless (find-package "POSE_ESTIMATION::PLAN_SERVICE")
  (make-package "POSE_ESTIMATION::PLAN_SERVICE"))
(unless (find-package "POSE_ESTIMATION::PLAN_SERVICEREQUEST")
  (make-package "POSE_ESTIMATION::PLAN_SERVICEREQUEST"))
(unless (find-package "POSE_ESTIMATION::PLAN_SERVICERESPONSE")
  (make-package "POSE_ESTIMATION::PLAN_SERVICERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(if (not (find-package "MOVEIT_MSGS"))
  (ros::roseus-add-msgs "moveit_msgs"))


(defclass pose_estimation::plan_serviceRequest
  :super ros::object
  :slots (_goal_transform _planning_group ))

(defmethod pose_estimation::plan_serviceRequest
  (:init
   (&key
    ((:goal_transform __goal_transform) (instance geometry_msgs::Transform :init))
    ((:planning_group __planning_group) "")
    )
   (send-super :init)
   (setq _goal_transform __goal_transform)
   (setq _planning_group (string __planning_group))
   self)
  (:goal_transform
   (&rest __goal_transform)
   (if (keywordp (car __goal_transform))
       (send* _goal_transform __goal_transform)
     (progn
       (if __goal_transform (setq _goal_transform (car __goal_transform)))
       _goal_transform)))
  (:planning_group
   (&optional __planning_group)
   (if __planning_group (setq _planning_group __planning_group)) _planning_group)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Transform _goal_transform
    (send _goal_transform :serialization-length)
    ;; string _planning_group
    4 (length _planning_group)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Transform _goal_transform
       (send _goal_transform :serialize s)
     ;; string _planning_group
       (write-long (length _planning_group) s) (princ _planning_group s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Transform _goal_transform
     (send _goal_transform :deserialize buf ptr-) (incf ptr- (send _goal_transform :serialization-length))
   ;; string _planning_group
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _planning_group (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass pose_estimation::plan_serviceResponse
  :super ros::object
  :slots (_trajectory _success ))

(defmethod pose_estimation::plan_serviceResponse
  (:init
   (&key
    ((:trajectory __trajectory) (instance moveit_msgs::RobotTrajectory :init))
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _trajectory __trajectory)
   (setq _success __success)
   self)
  (:trajectory
   (&rest __trajectory)
   (if (keywordp (car __trajectory))
       (send* _trajectory __trajectory)
     (progn
       (if __trajectory (setq _trajectory (car __trajectory)))
       _trajectory)))
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; moveit_msgs/RobotTrajectory _trajectory
    (send _trajectory :serialization-length)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; moveit_msgs/RobotTrajectory _trajectory
       (send _trajectory :serialize s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; moveit_msgs/RobotTrajectory _trajectory
     (send _trajectory :deserialize buf ptr-) (incf ptr- (send _trajectory :serialization-length))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass pose_estimation::plan_service
  :super ros::object
  :slots ())

(setf (get pose_estimation::plan_service :md5sum-) "f3dd71be87193ac42006527f8539da01")
(setf (get pose_estimation::plan_service :datatype-) "pose_estimation/plan_service")
(setf (get pose_estimation::plan_service :request) pose_estimation::plan_serviceRequest)
(setf (get pose_estimation::plan_service :response) pose_estimation::plan_serviceResponse)

(defmethod pose_estimation::plan_serviceRequest
  (:response () (instance pose_estimation::plan_serviceResponse :init)))

(setf (get pose_estimation::plan_serviceRequest :md5sum-) "f3dd71be87193ac42006527f8539da01")
(setf (get pose_estimation::plan_serviceRequest :datatype-) "pose_estimation/plan_serviceRequest")
(setf (get pose_estimation::plan_serviceRequest :definition-)
      "geometry_msgs/Transform goal_transform
string planning_group

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

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
moveit_msgs/RobotTrajectory trajectory
bool success


================================================================================
MSG: moveit_msgs/RobotTrajectory
trajectory_msgs/JointTrajectory joint_trajectory
trajectory_msgs/MultiDOFJointTrajectory multi_dof_joint_trajectory

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points

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
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start

================================================================================
MSG: trajectory_msgs/MultiDOFJointTrajectory
# The header is used to specify the coordinate frame and the reference time for the trajectory durations
Header header

# A representation of a multi-dof joint trajectory (each point is a transformation)
# Each point along the trajectory will include an array of positions/velocities/accelerations
# that has the same length as the array of joint names, and has the same order of joints as 
# the joint names array.

string[] joint_names
MultiDOFJointTrajectoryPoint[] points

================================================================================
MSG: trajectory_msgs/MultiDOFJointTrajectoryPoint
# Each multi-dof joint can specify a transform (up to 6 DOF)
geometry_msgs/Transform[] transforms

# There can be a velocity specified for the origin of the joint 
geometry_msgs/Twist[] velocities

# There can be an acceleration specified for the origin of the joint 
geometry_msgs/Twist[] accelerations

duration time_from_start

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

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

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular
")

(setf (get pose_estimation::plan_serviceResponse :md5sum-) "f3dd71be87193ac42006527f8539da01")
(setf (get pose_estimation::plan_serviceResponse :datatype-) "pose_estimation/plan_serviceResponse")
(setf (get pose_estimation::plan_serviceResponse :definition-)
      "geometry_msgs/Transform goal_transform
string planning_group

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

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
moveit_msgs/RobotTrajectory trajectory
bool success


================================================================================
MSG: moveit_msgs/RobotTrajectory
trajectory_msgs/JointTrajectory joint_trajectory
trajectory_msgs/MultiDOFJointTrajectory multi_dof_joint_trajectory

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points

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
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start

================================================================================
MSG: trajectory_msgs/MultiDOFJointTrajectory
# The header is used to specify the coordinate frame and the reference time for the trajectory durations
Header header

# A representation of a multi-dof joint trajectory (each point is a transformation)
# Each point along the trajectory will include an array of positions/velocities/accelerations
# that has the same length as the array of joint names, and has the same order of joints as 
# the joint names array.

string[] joint_names
MultiDOFJointTrajectoryPoint[] points

================================================================================
MSG: trajectory_msgs/MultiDOFJointTrajectoryPoint
# Each multi-dof joint can specify a transform (up to 6 DOF)
geometry_msgs/Transform[] transforms

# There can be a velocity specified for the origin of the joint 
geometry_msgs/Twist[] velocities

# There can be an acceleration specified for the origin of the joint 
geometry_msgs/Twist[] accelerations

duration time_from_start

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

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

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular
")



(provide :pose_estimation/plan_service "f3dd71be87193ac42006527f8539da01")



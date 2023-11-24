;; Auto-generated. Do not edit!


(when (boundp 'sun_robot_msgs::ClikGetState)
  (if (not (find-package "SUN_ROBOT_MSGS"))
    (make-package "SUN_ROBOT_MSGS"))
  (shadow 'ClikGetState (find-package "SUN_ROBOT_MSGS")))
(unless (find-package "SUN_ROBOT_MSGS::CLIKGETSTATE")
  (make-package "SUN_ROBOT_MSGS::CLIKGETSTATE"))
(unless (find-package "SUN_ROBOT_MSGS::CLIKGETSTATEREQUEST")
  (make-package "SUN_ROBOT_MSGS::CLIKGETSTATEREQUEST"))
(unless (find-package "SUN_ROBOT_MSGS::CLIKGETSTATERESPONSE")
  (make-package "SUN_ROBOT_MSGS::CLIKGETSTATERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass sun_robot_msgs::ClikGetStateRequest
  :super ros::object
  :slots ())

(defmethod sun_robot_msgs::ClikGetStateRequest
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

(defclass sun_robot_msgs::ClikGetStateResponse
  :super ros::object
  :slots (_mode _robot_joints _dh_joints _ee_pose ))

(defmethod sun_robot_msgs::ClikGetStateResponse
  (:init
   (&key
    ((:mode __mode) 0)
    ((:robot_joints __robot_joints) (instance sensor_msgs::JointState :init))
    ((:dh_joints __dh_joints) (instance sensor_msgs::JointState :init))
    ((:ee_pose __ee_pose) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _mode (round __mode))
   (setq _robot_joints __robot_joints)
   (setq _dh_joints __dh_joints)
   (setq _ee_pose __ee_pose)
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:robot_joints
   (&rest __robot_joints)
   (if (keywordp (car __robot_joints))
       (send* _robot_joints __robot_joints)
     (progn
       (if __robot_joints (setq _robot_joints (car __robot_joints)))
       _robot_joints)))
  (:dh_joints
   (&rest __dh_joints)
   (if (keywordp (car __dh_joints))
       (send* _dh_joints __dh_joints)
     (progn
       (if __dh_joints (setq _dh_joints (car __dh_joints)))
       _dh_joints)))
  (:ee_pose
   (&rest __ee_pose)
   (if (keywordp (car __ee_pose))
       (send* _ee_pose __ee_pose)
     (progn
       (if __ee_pose (setq _ee_pose (car __ee_pose)))
       _ee_pose)))
  (:serialization-length
   ()
   (+
    ;; uint8 _mode
    1
    ;; sensor_msgs/JointState _robot_joints
    (send _robot_joints :serialization-length)
    ;; sensor_msgs/JointState _dh_joints
    (send _dh_joints :serialization-length)
    ;; geometry_msgs/PoseStamped _ee_pose
    (send _ee_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _mode
       (write-byte _mode s)
     ;; sensor_msgs/JointState _robot_joints
       (send _robot_joints :serialize s)
     ;; sensor_msgs/JointState _dh_joints
       (send _dh_joints :serialize s)
     ;; geometry_msgs/PoseStamped _ee_pose
       (send _ee_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; sensor_msgs/JointState _robot_joints
     (send _robot_joints :deserialize buf ptr-) (incf ptr- (send _robot_joints :serialization-length))
   ;; sensor_msgs/JointState _dh_joints
     (send _dh_joints :deserialize buf ptr-) (incf ptr- (send _dh_joints :serialization-length))
   ;; geometry_msgs/PoseStamped _ee_pose
     (send _ee_pose :deserialize buf ptr-) (incf ptr- (send _ee_pose :serialization-length))
   ;;
   self)
  )

(defclass sun_robot_msgs::ClikGetState
  :super ros::object
  :slots ())

(setf (get sun_robot_msgs::ClikGetState :md5sum-) "d91a0f07be437a20a6af62e12e2fad5a")
(setf (get sun_robot_msgs::ClikGetState :datatype-) "sun_robot_msgs/ClikGetState")
(setf (get sun_robot_msgs::ClikGetState :request) sun_robot_msgs::ClikGetStateRequest)
(setf (get sun_robot_msgs::ClikGetState :response) sun_robot_msgs::ClikGetStateResponse)

(defmethod sun_robot_msgs::ClikGetStateRequest
  (:response () (instance sun_robot_msgs::ClikGetStateResponse :init)))

(setf (get sun_robot_msgs::ClikGetStateRequest :md5sum-) "d91a0f07be437a20a6af62e12e2fad5a")
(setf (get sun_robot_msgs::ClikGetStateRequest :datatype-) "sun_robot_msgs/ClikGetStateRequest")
(setf (get sun_robot_msgs::ClikGetStateRequest :definition-)
      "
---

uint8 mode
sensor_msgs/JointState robot_joints
sensor_msgs/JointState dh_joints
geometry_msgs/PoseStamped ee_pose


================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

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
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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
")

(setf (get sun_robot_msgs::ClikGetStateResponse :md5sum-) "d91a0f07be437a20a6af62e12e2fad5a")
(setf (get sun_robot_msgs::ClikGetStateResponse :datatype-) "sun_robot_msgs/ClikGetStateResponse")
(setf (get sun_robot_msgs::ClikGetStateResponse :definition-)
      "
---

uint8 mode
sensor_msgs/JointState robot_joints
sensor_msgs/JointState dh_joints
geometry_msgs/PoseStamped ee_pose


================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

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
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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
")



(provide :sun_robot_msgs/ClikGetState "d91a0f07be437a20a6af62e12e2fad5a")



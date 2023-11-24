;; Auto-generated. Do not edit!


(when (boundp 'sun_robot_msgs::ClikSetSecondaryObj)
  (if (not (find-package "SUN_ROBOT_MSGS"))
    (make-package "SUN_ROBOT_MSGS"))
  (shadow 'ClikSetSecondaryObj (find-package "SUN_ROBOT_MSGS")))
(unless (find-package "SUN_ROBOT_MSGS::CLIKSETSECONDARYOBJ")
  (make-package "SUN_ROBOT_MSGS::CLIKSETSECONDARYOBJ"))
(unless (find-package "SUN_ROBOT_MSGS::CLIKSETSECONDARYOBJREQUEST")
  (make-package "SUN_ROBOT_MSGS::CLIKSETSECONDARYOBJREQUEST"))
(unless (find-package "SUN_ROBOT_MSGS::CLIKSETSECONDARYOBJRESPONSE")
  (make-package "SUN_ROBOT_MSGS::CLIKSETSECONDARYOBJRESPONSE"))

(in-package "ROS")





(defclass sun_robot_msgs::ClikSetSecondaryObjRequest
  :super ros::object
  :slots (_second_obj_gain _second_obj_joint_velocity_topic _desired_joint_configuration _desired_joint_configuration_weights ))

(defmethod sun_robot_msgs::ClikSetSecondaryObjRequest
  (:init
   (&key
    ((:second_obj_gain __second_obj_gain) 0.0)
    ((:second_obj_joint_velocity_topic __second_obj_joint_velocity_topic) "")
    ((:desired_joint_configuration __desired_joint_configuration) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:desired_joint_configuration_weights __desired_joint_configuration_weights) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _second_obj_gain (float __second_obj_gain))
   (setq _second_obj_joint_velocity_topic (string __second_obj_joint_velocity_topic))
   (setq _desired_joint_configuration __desired_joint_configuration)
   (setq _desired_joint_configuration_weights __desired_joint_configuration_weights)
   self)
  (:second_obj_gain
   (&optional __second_obj_gain)
   (if __second_obj_gain (setq _second_obj_gain __second_obj_gain)) _second_obj_gain)
  (:second_obj_joint_velocity_topic
   (&optional __second_obj_joint_velocity_topic)
   (if __second_obj_joint_velocity_topic (setq _second_obj_joint_velocity_topic __second_obj_joint_velocity_topic)) _second_obj_joint_velocity_topic)
  (:desired_joint_configuration
   (&optional __desired_joint_configuration)
   (if __desired_joint_configuration (setq _desired_joint_configuration __desired_joint_configuration)) _desired_joint_configuration)
  (:desired_joint_configuration_weights
   (&optional __desired_joint_configuration_weights)
   (if __desired_joint_configuration_weights (setq _desired_joint_configuration_weights __desired_joint_configuration_weights)) _desired_joint_configuration_weights)
  (:serialization-length
   ()
   (+
    ;; float64 _second_obj_gain
    8
    ;; string _second_obj_joint_velocity_topic
    4 (length _second_obj_joint_velocity_topic)
    ;; float64[] _desired_joint_configuration
    (* 8    (length _desired_joint_configuration)) 4
    ;; float64[] _desired_joint_configuration_weights
    (* 8    (length _desired_joint_configuration_weights)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _second_obj_gain
       (sys::poke _second_obj_gain (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _second_obj_joint_velocity_topic
       (write-long (length _second_obj_joint_velocity_topic) s) (princ _second_obj_joint_velocity_topic s)
     ;; float64[] _desired_joint_configuration
     (write-long (length _desired_joint_configuration) s)
     (dotimes (i (length _desired_joint_configuration))
       (sys::poke (elt _desired_joint_configuration i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _desired_joint_configuration_weights
     (write-long (length _desired_joint_configuration_weights) s)
     (dotimes (i (length _desired_joint_configuration_weights))
       (sys::poke (elt _desired_joint_configuration_weights i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _second_obj_gain
     (setq _second_obj_gain (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _second_obj_joint_velocity_topic
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _second_obj_joint_velocity_topic (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64[] _desired_joint_configuration
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _desired_joint_configuration (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _desired_joint_configuration i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _desired_joint_configuration_weights
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _desired_joint_configuration_weights (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _desired_joint_configuration_weights i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass sun_robot_msgs::ClikSetSecondaryObjResponse
  :super ros::object
  :slots (_success ))

(defmethod sun_robot_msgs::ClikSetSecondaryObjResponse
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

(defclass sun_robot_msgs::ClikSetSecondaryObj
  :super ros::object
  :slots ())

(setf (get sun_robot_msgs::ClikSetSecondaryObj :md5sum-) "c07b3a4257a25972a24b9bc4876a5736")
(setf (get sun_robot_msgs::ClikSetSecondaryObj :datatype-) "sun_robot_msgs/ClikSetSecondaryObj")
(setf (get sun_robot_msgs::ClikSetSecondaryObj :request) sun_robot_msgs::ClikSetSecondaryObjRequest)
(setf (get sun_robot_msgs::ClikSetSecondaryObj :response) sun_robot_msgs::ClikSetSecondaryObjResponse)

(defmethod sun_robot_msgs::ClikSetSecondaryObjRequest
  (:response () (instance sun_robot_msgs::ClikSetSecondaryObjResponse :init)))

(setf (get sun_robot_msgs::ClikSetSecondaryObjRequest :md5sum-) "c07b3a4257a25972a24b9bc4876a5736")
(setf (get sun_robot_msgs::ClikSetSecondaryObjRequest :datatype-) "sun_robot_msgs/ClikSetSecondaryObjRequest")
(setf (get sun_robot_msgs::ClikSetSecondaryObjRequest :definition-)
      "float64 second_obj_gain #Gain of the second obj

##
##The following options are mutually exclusive, you can't set both
##

# Mode: Objective from topic
# desired joint velocity for the second objective
# the velocity will be projected in the jacobian kernel
string second_obj_joint_velocity_topic

# Mode: Objective is: reach the desired joint configuration
float64[] desired_joint_configuration
float64[] desired_joint_configuration_weights

---
bool success
")

(setf (get sun_robot_msgs::ClikSetSecondaryObjResponse :md5sum-) "c07b3a4257a25972a24b9bc4876a5736")
(setf (get sun_robot_msgs::ClikSetSecondaryObjResponse :datatype-) "sun_robot_msgs/ClikSetSecondaryObjResponse")
(setf (get sun_robot_msgs::ClikSetSecondaryObjResponse :definition-)
      "float64 second_obj_gain #Gain of the second obj

##
##The following options are mutually exclusive, you can't set both
##

# Mode: Objective from topic
# desired joint velocity for the second objective
# the velocity will be projected in the jacobian kernel
string second_obj_joint_velocity_topic

# Mode: Objective is: reach the desired joint configuration
float64[] desired_joint_configuration
float64[] desired_joint_configuration_weights

---
bool success
")



(provide :sun_robot_msgs/ClikSetSecondaryObj "c07b3a4257a25972a24b9bc4876a5736")




(cl:in-package :asdf)

(defsystem "pose_estimation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
               :trajectory_msgs-msg
)
  :components ((:file "_package")
    (:file "mask" :depends-on ("_package_mask"))
    (:file "_package_mask" :depends-on ("_package"))
    (:file "trajectoryAction" :depends-on ("_package_trajectoryAction"))
    (:file "_package_trajectoryAction" :depends-on ("_package"))
    (:file "trajectoryActionFeedback" :depends-on ("_package_trajectoryActionFeedback"))
    (:file "_package_trajectoryActionFeedback" :depends-on ("_package"))
    (:file "trajectoryActionGoal" :depends-on ("_package_trajectoryActionGoal"))
    (:file "_package_trajectoryActionGoal" :depends-on ("_package"))
    (:file "trajectoryActionResult" :depends-on ("_package_trajectoryActionResult"))
    (:file "_package_trajectoryActionResult" :depends-on ("_package"))
    (:file "trajectoryFeedback" :depends-on ("_package_trajectoryFeedback"))
    (:file "_package_trajectoryFeedback" :depends-on ("_package"))
    (:file "trajectoryGoal" :depends-on ("_package_trajectoryGoal"))
    (:file "_package_trajectoryGoal" :depends-on ("_package"))
    (:file "trajectoryResult" :depends-on ("_package_trajectoryResult"))
    (:file "_package_trajectoryResult" :depends-on ("_package"))
  ))
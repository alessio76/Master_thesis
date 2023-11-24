
(cl:in-package :asdf)

(defsystem "sun_robot_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :geometry_msgs-msg
               :std_msgs-msg
               :trajectory_msgs-msg
)
  :components ((:file "_package")
    (:file "CartesianStateStamped" :depends-on ("_package_CartesianStateStamped"))
    (:file "_package_CartesianStateStamped" :depends-on ("_package"))
    (:file "CartesianTrajectory" :depends-on ("_package_CartesianTrajectory"))
    (:file "_package_CartesianTrajectory" :depends-on ("_package"))
    (:file "CartesianTrajectoryAction" :depends-on ("_package_CartesianTrajectoryAction"))
    (:file "_package_CartesianTrajectoryAction" :depends-on ("_package"))
    (:file "CartesianTrajectoryActionFeedback" :depends-on ("_package_CartesianTrajectoryActionFeedback"))
    (:file "_package_CartesianTrajectoryActionFeedback" :depends-on ("_package"))
    (:file "CartesianTrajectoryActionGoal" :depends-on ("_package_CartesianTrajectoryActionGoal"))
    (:file "_package_CartesianTrajectoryActionGoal" :depends-on ("_package"))
    (:file "CartesianTrajectoryActionResult" :depends-on ("_package_CartesianTrajectoryActionResult"))
    (:file "_package_CartesianTrajectoryActionResult" :depends-on ("_package"))
    (:file "CartesianTrajectoryFeedback" :depends-on ("_package_CartesianTrajectoryFeedback"))
    (:file "_package_CartesianTrajectoryFeedback" :depends-on ("_package"))
    (:file "CartesianTrajectoryGoal" :depends-on ("_package_CartesianTrajectoryGoal"))
    (:file "_package_CartesianTrajectoryGoal" :depends-on ("_package"))
    (:file "CartesianTrajectoryPoint" :depends-on ("_package_CartesianTrajectoryPoint"))
    (:file "_package_CartesianTrajectoryPoint" :depends-on ("_package"))
    (:file "CartesianTrajectoryResult" :depends-on ("_package_CartesianTrajectoryResult"))
    (:file "_package_CartesianTrajectoryResult" :depends-on ("_package"))
    (:file "JointTrajectoryAction" :depends-on ("_package_JointTrajectoryAction"))
    (:file "_package_JointTrajectoryAction" :depends-on ("_package"))
    (:file "JointTrajectoryActionFeedback" :depends-on ("_package_JointTrajectoryActionFeedback"))
    (:file "_package_JointTrajectoryActionFeedback" :depends-on ("_package"))
    (:file "JointTrajectoryActionGoal" :depends-on ("_package_JointTrajectoryActionGoal"))
    (:file "_package_JointTrajectoryActionGoal" :depends-on ("_package"))
    (:file "JointTrajectoryActionResult" :depends-on ("_package_JointTrajectoryActionResult"))
    (:file "_package_JointTrajectoryActionResult" :depends-on ("_package"))
    (:file "JointTrajectoryFeedback" :depends-on ("_package_JointTrajectoryFeedback"))
    (:file "_package_JointTrajectoryFeedback" :depends-on ("_package"))
    (:file "JointTrajectoryGoal" :depends-on ("_package_JointTrajectoryGoal"))
    (:file "_package_JointTrajectoryGoal" :depends-on ("_package"))
    (:file "JointTrajectoryResult" :depends-on ("_package_JointTrajectoryResult"))
    (:file "_package_JointTrajectoryResult" :depends-on ("_package"))
  ))
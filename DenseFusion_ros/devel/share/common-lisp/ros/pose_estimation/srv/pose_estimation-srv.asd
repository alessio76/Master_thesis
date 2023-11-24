
(cl:in-package :asdf)

(defsystem "pose_estimation-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :moveit_msgs-msg
)
  :components ((:file "_package")
    (:file "plan_service" :depends-on ("_package_plan_service"))
    (:file "_package_plan_service" :depends-on ("_package"))
  ))
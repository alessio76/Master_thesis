
(cl:in-package :asdf)

(defsystem "sun_robot_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "ClikGetState" :depends-on ("_package_ClikGetState"))
    (:file "_package_ClikGetState" :depends-on ("_package"))
    (:file "ClikSetFixedJoints" :depends-on ("_package_ClikSetFixedJoints"))
    (:file "_package_ClikSetFixedJoints" :depends-on ("_package"))
    (:file "ClikSetMode" :depends-on ("_package_ClikSetMode"))
    (:file "_package_ClikSetMode" :depends-on ("_package"))
    (:file "ClikSetSecondaryObj" :depends-on ("_package_ClikSetSecondaryObj"))
    (:file "_package_ClikSetSecondaryObj" :depends-on ("_package"))
    (:file "SetEndEffector" :depends-on ("_package_SetEndEffector"))
    (:file "_package_SetEndEffector" :depends-on ("_package"))
  ))
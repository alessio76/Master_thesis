
(cl:in-package :asdf)

(defsystem "sun_ros_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Float64Stamped" :depends-on ("_package_Float64Stamped"))
    (:file "_package_Float64Stamped" :depends-on ("_package"))
    (:file "Flota32Stamped" :depends-on ("_package_Flota32Stamped"))
    (:file "_package_Flota32Stamped" :depends-on ("_package"))
    (:file "MultiVector" :depends-on ("_package_MultiVector"))
    (:file "_package_MultiVector" :depends-on ("_package"))
    (:file "MultiVectorStamped" :depends-on ("_package_MultiVectorStamped"))
    (:file "_package_MultiVectorStamped" :depends-on ("_package"))
  ))
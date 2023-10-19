
(cl:in-package :asdf)

(defsystem "pose_estimation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "mask" :depends-on ("_package_mask"))
    (:file "_package_mask" :depends-on ("_package"))
  ))
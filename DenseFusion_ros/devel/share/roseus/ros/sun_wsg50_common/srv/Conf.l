;; Auto-generated. Do not edit!


(when (boundp 'sun_wsg50_common::Conf)
  (if (not (find-package "SUN_WSG50_COMMON"))
    (make-package "SUN_WSG50_COMMON"))
  (shadow 'Conf (find-package "SUN_WSG50_COMMON")))
(unless (find-package "SUN_WSG50_COMMON::CONF")
  (make-package "SUN_WSG50_COMMON::CONF"))
(unless (find-package "SUN_WSG50_COMMON::CONFREQUEST")
  (make-package "SUN_WSG50_COMMON::CONFREQUEST"))
(unless (find-package "SUN_WSG50_COMMON::CONFRESPONSE")
  (make-package "SUN_WSG50_COMMON::CONFRESPONSE"))

(in-package "ROS")





(defclass sun_wsg50_common::ConfRequest
  :super ros::object
  :slots (_val ))

(defmethod sun_wsg50_common::ConfRequest
  (:init
   (&key
    ((:val __val) 0.0)
    )
   (send-super :init)
   (setq _val (float __val))
   self)
  (:val
   (&optional __val)
   (if __val (setq _val __val)) _val)
  (:serialization-length
   ()
   (+
    ;; float32 _val
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _val
       (sys::poke _val (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _val
     (setq _val (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass sun_wsg50_common::ConfResponse
  :super ros::object
  :slots (_error ))

(defmethod sun_wsg50_common::ConfResponse
  (:init
   (&key
    ((:error __error) 0)
    )
   (send-super :init)
   (setq _error (round __error))
   self)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:serialization-length
   ()
   (+
    ;; uint8 _error
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _error
       (write-byte _error s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _error
     (setq _error (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass sun_wsg50_common::Conf
  :super ros::object
  :slots ())

(setf (get sun_wsg50_common::Conf :md5sum-) "0c7a1839200830facdc1205cf36615d5")
(setf (get sun_wsg50_common::Conf :datatype-) "sun_wsg50_common/Conf")
(setf (get sun_wsg50_common::Conf :request) sun_wsg50_common::ConfRequest)
(setf (get sun_wsg50_common::Conf :response) sun_wsg50_common::ConfResponse)

(defmethod sun_wsg50_common::ConfRequest
  (:response () (instance sun_wsg50_common::ConfResponse :init)))

(setf (get sun_wsg50_common::ConfRequest :md5sum-) "0c7a1839200830facdc1205cf36615d5")
(setf (get sun_wsg50_common::ConfRequest :datatype-) "sun_wsg50_common/ConfRequest")
(setf (get sun_wsg50_common::ConfRequest :definition-)
      "float32 val
---
uint8 error

")

(setf (get sun_wsg50_common::ConfResponse :md5sum-) "0c7a1839200830facdc1205cf36615d5")
(setf (get sun_wsg50_common::ConfResponse :datatype-) "sun_wsg50_common/ConfResponse")
(setf (get sun_wsg50_common::ConfResponse :definition-)
      "float32 val
---
uint8 error

")



(provide :sun_wsg50_common/Conf "0c7a1839200830facdc1205cf36615d5")



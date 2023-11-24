# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pose_estimation: 8 messages, 1 services")

set(MSG_I_FLAGS "-Ipose_estimation:/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg;-Ipose_estimation:/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/noetic/share/trajectory_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Imoveit_msgs:/opt/ros/noetic/share/moveit_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Ishape_msgs:/opt/ros/noetic/share/shape_msgs/cmake/../msg;-Iobject_recognition_msgs:/opt/ros/noetic/share/object_recognition_msgs/cmake/../msg;-Ioctomap_msgs:/opt/ros/noetic/share/octomap_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pose_estimation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg" NAME_WE)
add_custom_target(_pose_estimation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pose_estimation" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg" "std_msgs/Int8MultiArray:std_msgs/MultiArrayDimension:std_msgs/Header:std_msgs/MultiArrayLayout"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg" NAME_WE)
add_custom_target(_pose_estimation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pose_estimation" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg" "actionlib_msgs/GoalID:pose_estimation/trajectoryActionResult:pose_estimation/trajectoryActionFeedback:pose_estimation/trajectoryActionGoal:pose_estimation/trajectoryResult:pose_estimation/trajectoryGoal:sensor_msgs/JointState:std_msgs/Header:trajectory_msgs/JointTrajectory:trajectory_msgs/JointTrajectoryPoint:pose_estimation/trajectoryFeedback:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg" NAME_WE)
add_custom_target(_pose_estimation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pose_estimation" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg" "actionlib_msgs/GoalID:pose_estimation/trajectoryGoal:std_msgs/Header:trajectory_msgs/JointTrajectory:trajectory_msgs/JointTrajectoryPoint"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg" NAME_WE)
add_custom_target(_pose_estimation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pose_estimation" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg" "actionlib_msgs/GoalID:pose_estimation/trajectoryResult:sensor_msgs/JointState:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg" NAME_WE)
add_custom_target(_pose_estimation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pose_estimation" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg" "actionlib_msgs/GoalID:std_msgs/Header:pose_estimation/trajectoryFeedback:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg" NAME_WE)
add_custom_target(_pose_estimation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pose_estimation" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg" "trajectory_msgs/JointTrajectoryPoint:std_msgs/Header:trajectory_msgs/JointTrajectory"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg" NAME_WE)
add_custom_target(_pose_estimation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pose_estimation" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg" "sensor_msgs/JointState:std_msgs/Header"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg" NAME_WE)
add_custom_target(_pose_estimation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pose_estimation" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg" ""
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv" NAME_WE)
add_custom_target(_pose_estimation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pose_estimation" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv" "geometry_msgs/Vector3:geometry_msgs/Transform:trajectory_msgs/MultiDOFJointTrajectory:geometry_msgs/Twist:std_msgs/Header:trajectory_msgs/JointTrajectory:geometry_msgs/Quaternion:trajectory_msgs/JointTrajectoryPoint:trajectory_msgs/MultiDOFJointTrajectoryPoint:moveit_msgs/RobotTrajectory"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Int8MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
)
_generate_msg_cpp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
)
_generate_msg_cpp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
)
_generate_msg_cpp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
)
_generate_msg_cpp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
)
_generate_msg_cpp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
)
_generate_msg_cpp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
)
_generate_msg_cpp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
)

### Generating Services
_generate_srv_cpp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/noetic/share/moveit_msgs/cmake/../msg/RobotTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
)

### Generating Module File
_generate_module_cpp(pose_estimation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pose_estimation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pose_estimation_generate_messages pose_estimation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_cpp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_cpp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_cpp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_cpp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_cpp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_cpp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_cpp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_cpp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv" NAME_WE)
add_dependencies(pose_estimation_generate_messages_cpp _pose_estimation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pose_estimation_gencpp)
add_dependencies(pose_estimation_gencpp pose_estimation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pose_estimation_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Int8MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
)
_generate_msg_eus(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
)
_generate_msg_eus(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
)
_generate_msg_eus(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
)
_generate_msg_eus(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
)
_generate_msg_eus(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
)
_generate_msg_eus(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
)
_generate_msg_eus(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
)

### Generating Services
_generate_srv_eus(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/noetic/share/moveit_msgs/cmake/../msg/RobotTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
)

### Generating Module File
_generate_module_eus(pose_estimation
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pose_estimation_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pose_estimation_generate_messages pose_estimation_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_eus _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_eus _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_eus _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_eus _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_eus _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_eus _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_eus _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_eus _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv" NAME_WE)
add_dependencies(pose_estimation_generate_messages_eus _pose_estimation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pose_estimation_geneus)
add_dependencies(pose_estimation_geneus pose_estimation_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pose_estimation_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Int8MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
)
_generate_msg_lisp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
)
_generate_msg_lisp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
)
_generate_msg_lisp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
)
_generate_msg_lisp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
)
_generate_msg_lisp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
)
_generate_msg_lisp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
)
_generate_msg_lisp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
)

### Generating Services
_generate_srv_lisp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/noetic/share/moveit_msgs/cmake/../msg/RobotTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
)

### Generating Module File
_generate_module_lisp(pose_estimation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pose_estimation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pose_estimation_generate_messages pose_estimation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_lisp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_lisp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_lisp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_lisp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_lisp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_lisp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_lisp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_lisp _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv" NAME_WE)
add_dependencies(pose_estimation_generate_messages_lisp _pose_estimation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pose_estimation_genlisp)
add_dependencies(pose_estimation_genlisp pose_estimation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pose_estimation_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Int8MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
)
_generate_msg_nodejs(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
)
_generate_msg_nodejs(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
)
_generate_msg_nodejs(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
)
_generate_msg_nodejs(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
)
_generate_msg_nodejs(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
)
_generate_msg_nodejs(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
)
_generate_msg_nodejs(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
)

### Generating Services
_generate_srv_nodejs(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/noetic/share/moveit_msgs/cmake/../msg/RobotTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
)

### Generating Module File
_generate_module_nodejs(pose_estimation
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pose_estimation_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pose_estimation_generate_messages pose_estimation_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_nodejs _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_nodejs _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_nodejs _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_nodejs _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_nodejs _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_nodejs _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_nodejs _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_nodejs _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv" NAME_WE)
add_dependencies(pose_estimation_generate_messages_nodejs _pose_estimation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pose_estimation_gennodejs)
add_dependencies(pose_estimation_gennodejs pose_estimation_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pose_estimation_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Int8MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
)
_generate_msg_py(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
)
_generate_msg_py(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
)
_generate_msg_py(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
)
_generate_msg_py(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
)
_generate_msg_py(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
)
_generate_msg_py(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
)
_generate_msg_py(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
)

### Generating Services
_generate_srv_py(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/noetic/share/moveit_msgs/cmake/../msg/RobotTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
)

### Generating Module File
_generate_module_py(pose_estimation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pose_estimation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pose_estimation_generate_messages pose_estimation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_py _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryAction.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_py _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionGoal.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_py _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionResult.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_py _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryActionFeedback.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_py _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryGoal.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_py _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryResult.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_py _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/pose_estimation/msg/trajectoryFeedback.msg" NAME_WE)
add_dependencies(pose_estimation_generate_messages_py _pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/srv/plan_service.srv" NAME_WE)
add_dependencies(pose_estimation_generate_messages_py _pose_estimation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pose_estimation_genpy)
add_dependencies(pose_estimation_genpy pose_estimation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pose_estimation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pose_estimation_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(pose_estimation_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET trajectory_msgs_generate_messages_cpp)
  add_dependencies(pose_estimation_generate_messages_cpp trajectory_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(pose_estimation_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET moveit_msgs_generate_messages_cpp)
  add_dependencies(pose_estimation_generate_messages_cpp moveit_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pose_estimation_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(pose_estimation_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET trajectory_msgs_generate_messages_eus)
  add_dependencies(pose_estimation_generate_messages_eus trajectory_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(pose_estimation_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET moveit_msgs_generate_messages_eus)
  add_dependencies(pose_estimation_generate_messages_eus moveit_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pose_estimation_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(pose_estimation_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET trajectory_msgs_generate_messages_lisp)
  add_dependencies(pose_estimation_generate_messages_lisp trajectory_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(pose_estimation_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET moveit_msgs_generate_messages_lisp)
  add_dependencies(pose_estimation_generate_messages_lisp moveit_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pose_estimation_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(pose_estimation_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET trajectory_msgs_generate_messages_nodejs)
  add_dependencies(pose_estimation_generate_messages_nodejs trajectory_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(pose_estimation_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET moveit_msgs_generate_messages_nodejs)
  add_dependencies(pose_estimation_generate_messages_nodejs moveit_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pose_estimation_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(pose_estimation_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET trajectory_msgs_generate_messages_py)
  add_dependencies(pose_estimation_generate_messages_py trajectory_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(pose_estimation_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET moveit_msgs_generate_messages_py)
  add_dependencies(pose_estimation_generate_messages_py moveit_msgs_generate_messages_py)
endif()

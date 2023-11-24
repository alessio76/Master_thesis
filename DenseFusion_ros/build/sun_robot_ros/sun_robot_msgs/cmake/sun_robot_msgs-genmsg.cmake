# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sun_robot_msgs: 17 messages, 5 services")

set(MSG_I_FLAGS "-Isun_robot_msgs:/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg;-Isun_robot_msgs:/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/noetic/share/trajectory_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sun_robot_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg" "geometry_msgs/Vector3:geometry_msgs/Twist:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg" "std_msgs/Header:geometry_msgs/Vector3:geometry_msgs/Twist:geometry_msgs/Quaternion:geometry_msgs/Point:sun_robot_msgs/CartesianTrajectoryPoint:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg" "geometry_msgs/Vector3:geometry_msgs/Twist:geometry_msgs/Quaternion:geometry_msgs/Point:std_msgs/Header:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg" "sun_robot_msgs/JointTrajectoryActionResult:trajectory_msgs/JointTrajectory:trajectory_msgs/JointTrajectoryPoint:sun_robot_msgs/JointTrajectoryActionFeedback:sun_robot_msgs/JointTrajectoryGoal:sun_robot_msgs/JointTrajectoryResult:actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus:sun_robot_msgs/JointTrajectoryActionGoal:sun_robot_msgs/JointTrajectoryFeedback"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg" "trajectory_msgs/JointTrajectory:trajectory_msgs/JointTrajectoryPoint:sun_robot_msgs/JointTrajectoryGoal:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg" "sun_robot_msgs/JointTrajectoryResult:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg" "sun_robot_msgs/JointTrajectoryFeedback:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg" "trajectory_msgs/JointTrajectory:trajectory_msgs/JointTrajectoryPoint:std_msgs/Header"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg" ""
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg" ""
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg" "sun_robot_msgs/CartesianTrajectoryActionGoal:sun_robot_msgs/CartesianTrajectoryResult:geometry_msgs/Vector3:geometry_msgs/Twist:geometry_msgs/Quaternion:sun_robot_msgs/CartesianTrajectoryFeedback:geometry_msgs/Pose:geometry_msgs/Point:sun_robot_msgs/CartesianTrajectory:sun_robot_msgs/CartesianTrajectoryActionResult:actionlib_msgs/GoalID:std_msgs/Header:sun_robot_msgs/CartesianTrajectoryPoint:actionlib_msgs/GoalStatus:sun_robot_msgs/CartesianTrajectoryGoal:sun_robot_msgs/CartesianTrajectoryActionFeedback"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg" "geometry_msgs/Vector3:geometry_msgs/Twist:geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point:sun_robot_msgs/CartesianTrajectory:actionlib_msgs/GoalID:std_msgs/Header:sun_robot_msgs/CartesianTrajectoryPoint:sun_robot_msgs/CartesianTrajectoryGoal"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg" "actionlib_msgs/GoalStatus:sun_robot_msgs/CartesianTrajectoryResult:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg" "actionlib_msgs/GoalStatus:sun_robot_msgs/CartesianTrajectoryFeedback:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg" "std_msgs/Header:geometry_msgs/Vector3:geometry_msgs/Twist:geometry_msgs/Quaternion:geometry_msgs/Point:sun_robot_msgs/CartesianTrajectory:sun_robot_msgs/CartesianTrajectoryPoint:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg" ""
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg" ""
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv" ""
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv" "geometry_msgs/Quaternion:sensor_msgs/JointState:geometry_msgs/Point:geometry_msgs/PoseStamped:std_msgs/Header:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv" ""
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv" NAME_WE)
add_custom_target(_sun_robot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_robot_msgs" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)

### Generating Services
_generate_srv_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_cpp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
)

### Generating Module File
_generate_module_cpp(sun_robot_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sun_robot_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sun_robot_msgs_generate_messages sun_robot_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_cpp _sun_robot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sun_robot_msgs_gencpp)
add_dependencies(sun_robot_msgs_gencpp sun_robot_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sun_robot_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)

### Generating Services
_generate_srv_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_eus(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
)

### Generating Module File
_generate_module_eus(sun_robot_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sun_robot_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sun_robot_msgs_generate_messages sun_robot_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_eus _sun_robot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sun_robot_msgs_geneus)
add_dependencies(sun_robot_msgs_geneus sun_robot_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sun_robot_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)

### Generating Services
_generate_srv_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_lisp(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
)

### Generating Module File
_generate_module_lisp(sun_robot_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sun_robot_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sun_robot_msgs_generate_messages sun_robot_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_lisp _sun_robot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sun_robot_msgs_genlisp)
add_dependencies(sun_robot_msgs_genlisp sun_robot_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sun_robot_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)

### Generating Services
_generate_srv_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_nodejs(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
)

### Generating Module File
_generate_module_nodejs(sun_robot_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sun_robot_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sun_robot_msgs_generate_messages sun_robot_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_nodejs _sun_robot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sun_robot_msgs_gennodejs)
add_dependencies(sun_robot_msgs_gennodejs sun_robot_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sun_robot_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg;/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_msg_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)

### Generating Services
_generate_srv_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)
_generate_srv_py(sun_robot_msgs
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
)

### Generating Module File
_generate_module_py(sun_robot_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sun_robot_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sun_robot_msgs_generate_messages sun_robot_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv" NAME_WE)
add_dependencies(sun_robot_msgs_generate_messages_py _sun_robot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sun_robot_msgs_genpy)
add_dependencies(sun_robot_msgs_genpy sun_robot_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sun_robot_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_robot_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(sun_robot_msgs_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET trajectory_msgs_generate_messages_cpp)
  add_dependencies(sun_robot_msgs_generate_messages_cpp trajectory_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(sun_robot_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_robot_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(sun_robot_msgs_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET trajectory_msgs_generate_messages_eus)
  add_dependencies(sun_robot_msgs_generate_messages_eus trajectory_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(sun_robot_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_robot_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(sun_robot_msgs_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET trajectory_msgs_generate_messages_lisp)
  add_dependencies(sun_robot_msgs_generate_messages_lisp trajectory_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(sun_robot_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_robot_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(sun_robot_msgs_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET trajectory_msgs_generate_messages_nodejs)
  add_dependencies(sun_robot_msgs_generate_messages_nodejs trajectory_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(sun_robot_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_robot_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(sun_robot_msgs_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET trajectory_msgs_generate_messages_py)
  add_dependencies(sun_robot_msgs_generate_messages_py trajectory_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(sun_robot_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()

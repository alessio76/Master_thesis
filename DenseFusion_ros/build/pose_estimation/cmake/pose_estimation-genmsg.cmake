# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pose_estimation: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ipose_estimation:/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

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
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pose_estimation" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg" "std_msgs/Header:std_msgs/MultiArrayDimension:std_msgs/MultiArrayLayout:std_msgs/Int8MultiArray"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pose_estimation
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/msg/mask.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int8MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pose_estimation
)

### Generating Services

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
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int8MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pose_estimation
)

### Generating Services

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
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int8MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pose_estimation
)

### Generating Services

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
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int8MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pose_estimation
)

### Generating Services

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
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int8MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pose_estimation
)

### Generating Services

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

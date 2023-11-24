# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sun_wsg50_common: 2 messages, 3 services")

set(MSG_I_FLAGS "-Isun_wsg50_common:/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sun_wsg50_common_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg" NAME_WE)
add_custom_target(_sun_wsg50_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_wsg50_common" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg" ""
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg" NAME_WE)
add_custom_target(_sun_wsg50_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_wsg50_common" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg" ""
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv" NAME_WE)
add_custom_target(_sun_wsg50_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_wsg50_common" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv" ""
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv" NAME_WE)
add_custom_target(_sun_wsg50_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_wsg50_common" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv" ""
)

get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv" NAME_WE)
add_custom_target(_sun_wsg50_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sun_wsg50_common" "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_wsg50_common
)
_generate_msg_cpp(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_wsg50_common
)

### Generating Services
_generate_srv_cpp(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_wsg50_common
)
_generate_srv_cpp(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_wsg50_common
)
_generate_srv_cpp(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_wsg50_common
)

### Generating Module File
_generate_module_cpp(sun_wsg50_common
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_wsg50_common
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sun_wsg50_common_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sun_wsg50_common_generate_messages sun_wsg50_common_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_cpp _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_cpp _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_cpp _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_cpp _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_cpp _sun_wsg50_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sun_wsg50_common_gencpp)
add_dependencies(sun_wsg50_common_gencpp sun_wsg50_common_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sun_wsg50_common_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_wsg50_common
)
_generate_msg_eus(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_wsg50_common
)

### Generating Services
_generate_srv_eus(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_wsg50_common
)
_generate_srv_eus(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_wsg50_common
)
_generate_srv_eus(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_wsg50_common
)

### Generating Module File
_generate_module_eus(sun_wsg50_common
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_wsg50_common
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sun_wsg50_common_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sun_wsg50_common_generate_messages sun_wsg50_common_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_eus _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_eus _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_eus _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_eus _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_eus _sun_wsg50_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sun_wsg50_common_geneus)
add_dependencies(sun_wsg50_common_geneus sun_wsg50_common_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sun_wsg50_common_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_wsg50_common
)
_generate_msg_lisp(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_wsg50_common
)

### Generating Services
_generate_srv_lisp(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_wsg50_common
)
_generate_srv_lisp(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_wsg50_common
)
_generate_srv_lisp(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_wsg50_common
)

### Generating Module File
_generate_module_lisp(sun_wsg50_common
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_wsg50_common
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sun_wsg50_common_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sun_wsg50_common_generate_messages sun_wsg50_common_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_lisp _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_lisp _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_lisp _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_lisp _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_lisp _sun_wsg50_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sun_wsg50_common_genlisp)
add_dependencies(sun_wsg50_common_genlisp sun_wsg50_common_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sun_wsg50_common_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_wsg50_common
)
_generate_msg_nodejs(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_wsg50_common
)

### Generating Services
_generate_srv_nodejs(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_wsg50_common
)
_generate_srv_nodejs(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_wsg50_common
)
_generate_srv_nodejs(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_wsg50_common
)

### Generating Module File
_generate_module_nodejs(sun_wsg50_common
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_wsg50_common
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sun_wsg50_common_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sun_wsg50_common_generate_messages sun_wsg50_common_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_nodejs _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_nodejs _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_nodejs _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_nodejs _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_nodejs _sun_wsg50_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sun_wsg50_common_gennodejs)
add_dependencies(sun_wsg50_common_gennodejs sun_wsg50_common_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sun_wsg50_common_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_wsg50_common
)
_generate_msg_py(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_wsg50_common
)

### Generating Services
_generate_srv_py(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_wsg50_common
)
_generate_srv_py(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_wsg50_common
)
_generate_srv_py(sun_wsg50_common
  "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_wsg50_common
)

### Generating Module File
_generate_module_py(sun_wsg50_common
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_wsg50_common
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sun_wsg50_common_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sun_wsg50_common_generate_messages sun_wsg50_common_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_py _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_py _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_py _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_py _sun_wsg50_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv" NAME_WE)
add_dependencies(sun_wsg50_common_generate_messages_py _sun_wsg50_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sun_wsg50_common_genpy)
add_dependencies(sun_wsg50_common_genpy sun_wsg50_common_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sun_wsg50_common_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_wsg50_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sun_wsg50_common
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(sun_wsg50_common_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_wsg50_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sun_wsg50_common
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(sun_wsg50_common_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_wsg50_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sun_wsg50_common
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(sun_wsg50_common_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_wsg50_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sun_wsg50_common
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(sun_wsg50_common_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_wsg50_common)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_wsg50_common\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sun_wsg50_common
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(sun_wsg50_common_generate_messages_py std_msgs_generate_messages_py)
endif()

# Install script for directory: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_robot_msgs/msg" TYPE FILE FILES
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectoryPoint.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianTrajectory.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/msg/CartesianStateStamped.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_robot_msgs/srv" TYPE FILE FILES
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetMode.srv"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikGetState.srv"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/SetEndEffector.srv"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetSecondaryObj.srv"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/srv/ClikSetFixedJoints.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_robot_msgs/action" TYPE FILE FILES
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/action/JointTrajectory.action"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/action/CartesianTrajectory.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_robot_msgs/msg" TYPE FILE FILES
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryAction.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionGoal.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionResult.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryActionFeedback.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryGoal.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryResult.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/JointTrajectoryFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_robot_msgs/msg" TYPE FILE FILES
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryAction.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionGoal.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionResult.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryActionFeedback.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryGoal.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryResult.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/sun_robot_msgs/msg/CartesianTrajectoryFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_robot_msgs/cmake" TYPE FILE FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_ros/sun_robot_msgs/catkin_generated/installspace/sun_robot_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/include/sun_robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/roseus/ros/sun_robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/common-lisp/ros/sun_robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/gennodejs/ros/sun_robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/python3/dist-packages/sun_robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/python3/dist-packages/sun_robot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_ros/sun_robot_msgs/catkin_generated/installspace/sun_robot_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_robot_msgs/cmake" TYPE FILE FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_ros/sun_robot_msgs/catkin_generated/installspace/sun_robot_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_robot_msgs/cmake" TYPE FILE FILES
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_ros/sun_robot_msgs/catkin_generated/installspace/sun_robot_msgsConfig.cmake"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_ros/sun_robot_msgs/catkin_generated/installspace/sun_robot_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_robot_msgs" TYPE FILE FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_ros/sun_robot_msgs/package.xml")
endif()


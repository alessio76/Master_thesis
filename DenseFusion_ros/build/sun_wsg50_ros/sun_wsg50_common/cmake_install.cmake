# Install script for directory: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_wsg50_common/msg" TYPE FILE FILES
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Cmd.msg"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/msg/Status.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_wsg50_common/srv" TYPE FILE FILES
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Conf.srv"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Incr.srv"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/srv/Move.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_wsg50_common/cmake" TYPE FILE FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_wsg50_ros/sun_wsg50_common/catkin_generated/installspace/sun_wsg50_common-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/include/sun_wsg50_common")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/roseus/ros/sun_wsg50_common")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/common-lisp/ros/sun_wsg50_common")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/share/gennodejs/ros/sun_wsg50_common")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/python3/dist-packages/sun_wsg50_common")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/python3/dist-packages/sun_wsg50_common")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_wsg50_ros/sun_wsg50_common/catkin_generated/installspace/sun_wsg50_common.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_wsg50_common/cmake" TYPE FILE FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_wsg50_ros/sun_wsg50_common/catkin_generated/installspace/sun_wsg50_common-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_wsg50_common/cmake" TYPE FILE FILES
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_wsg50_ros/sun_wsg50_common/catkin_generated/installspace/sun_wsg50_commonConfig.cmake"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_wsg50_ros/sun_wsg50_common/catkin_generated/installspace/sun_wsg50_commonConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sun_wsg50_common" TYPE FILE FILES "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_wsg50_ros/sun_wsg50_common/package.xml")
endif()



if(NOT "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src/upstream_igh_eml-stamp/upstream_igh_eml-gitinfo.txt" IS_NEWER_THAN "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src/upstream_igh_eml-stamp/upstream_igh_eml-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src/upstream_igh_eml-stamp/upstream_igh_eml-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src/upstream_igh_eml"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src/upstream_igh_eml'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout "https://github.com/edrosten/TooN.git" "upstream_igh_eml"
    WORKING_DIRECTORY "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/edrosten/TooN.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout TOON_3.2 --
  WORKING_DIRECTORY "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src/upstream_igh_eml"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'TOON_3.2'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src/upstream_igh_eml"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src/upstream_igh_eml'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src/upstream_igh_eml-stamp/upstream_igh_eml-gitinfo.txt"
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src/upstream_igh_eml-stamp/upstream_igh_eml-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/ros_toon/upstream_igh_eml-prefix/src/upstream_igh_eml-stamp/upstream_igh_eml-gitclone-lastrun.txt'")
endif()


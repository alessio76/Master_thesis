# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build

# Include any dependencies generated for this target.
include sun_robot_lib/CMakeFiles/sun_robot_lib.dir/depend.make

# Include the progress variables for this target.
include sun_robot_lib/CMakeFiles/sun_robot_lib.dir/progress.make

# Include the compile flags for this target's objects.
include sun_robot_lib/CMakeFiles/sun_robot_lib.dir/flags.make

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.o: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/flags.make
sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.o: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLink.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.o"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.o -c /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLink.cpp

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.i"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLink.cpp > CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.i

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.s"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLink.cpp -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.s

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.o: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/flags.make
sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.o: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLinkRevolute.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.o"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.o -c /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLinkRevolute.cpp

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.i"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLinkRevolute.cpp > CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.i

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.s"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLinkRevolute.cpp -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.s

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.o: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/flags.make
sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.o: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLinkPrismatic.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.o"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.o -c /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLinkPrismatic.cpp

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.i"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLinkPrismatic.cpp > CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.i

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.s"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/RobotLinkPrismatic.cpp -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.s

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.o: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/flags.make
sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.o: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robot.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.o"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.o -c /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robot.cpp

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.i"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robot.cpp > CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.i

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.s"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robot.cpp -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.s

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.o: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/flags.make
sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.o: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Clik.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.o"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.o -c /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Clik.cpp

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.i"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Clik.cpp > CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.i

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.s"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Clik.cpp -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.s

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.o: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/flags.make
sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.o: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/ClikSingleRobot.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.o"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.o -c /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/ClikSingleRobot.cpp

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.i"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/ClikSingleRobot.cpp > CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.i

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.s"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/ClikSingleRobot.cpp -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.s

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.o: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/flags.make
sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.o: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.o"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.o -c /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.i"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp > CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.i

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.s"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.s

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.o: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/flags.make
sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.o: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robots/LBRiiwa7.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.o"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.o -c /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robots/LBRiiwa7.cpp

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.i"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robots/LBRiiwa7.cpp > CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.i

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.s"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robots/LBRiiwa7.cpp -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.s

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.o: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/flags.make
sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.o: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robots/MotomanSIA5F.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.o"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.o -c /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robots/MotomanSIA5F.cpp

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.i"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robots/MotomanSIA5F.cpp > CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.i

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.s"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib/src/sun_robot_lib/Robots/MotomanSIA5F.cpp -o CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.s

# Object files for target sun_robot_lib
sun_robot_lib_OBJECTS = \
"CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.o" \
"CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.o" \
"CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.o" \
"CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.o" \
"CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.o" \
"CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.o" \
"CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.o" \
"CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.o" \
"CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.o"

# External object files for target sun_robot_lib
sun_robot_lib_EXTERNAL_OBJECTS =

/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLink.cpp.o
/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkRevolute.cpp.o
/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/RobotLinkPrismatic.cpp.o
/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robot.cpp.o
/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik.cpp.o
/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/ClikSingleRobot.cpp.o
/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Clik6DQuaternionSingleRobot.cpp.o
/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/LBRiiwa7.cpp.o
/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/src/sun_robot_lib/Robots/MotomanSIA5F.cpp.o
/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/build.make
/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so: sun_robot_lib/CMakeFiles/sun_robot_lib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking CXX shared library /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so"
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sun_robot_lib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
sun_robot_lib/CMakeFiles/sun_robot_lib.dir/build: /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/devel/lib/libsun_robot_lib.so

.PHONY : sun_robot_lib/CMakeFiles/sun_robot_lib.dir/build

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/clean:
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib && $(CMAKE_COMMAND) -P CMakeFiles/sun_robot_lib.dir/cmake_clean.cmake
.PHONY : sun_robot_lib/CMakeFiles/sun_robot_lib.dir/clean

sun_robot_lib/CMakeFiles/sun_robot_lib.dir/depend:
	cd /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/sun_robot_lib /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib /home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/sun_robot_lib/CMakeFiles/sun_robot_lib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : sun_robot_lib/CMakeFiles/sun_robot_lib.dir/depend


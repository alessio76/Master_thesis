#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/install/lib/python3/dist-packages:/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build" \
    "/usr/bin/python3" \
    "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/src/pose_estimation/setup.py" \
     \
    build --build-base "/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/build/pose_estimation" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/install" --install-scripts="/home/workstation2/AlessioBenitoAlterani/Master-thesis/DenseFusion_ros/install/bin"

#!/bin/sh
rosnode kill --all
killall gzserver
killall gzclient
killall px4
echo "killall gazebo"clear
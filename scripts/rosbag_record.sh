#!/bin/bash

#ROSBAG_NAME=$(basename $1) 
ROSBAG_NAME=$(basename $1) 
ROSBAG_NAME_WITHOUT_EXT=${ROSBAG_NAME%.*}".txt"

OUTPUT_ROOT_DIR="$HOME/Downloads/"
VISUALIZE_SUBDIR="visualization/"
OUTPUT_NAME=$(date +%Y%m%d-%H%M%S)


ROSBAG_PATH=$OUTPUT_ROOT_DIR$VISUALIZE_SUBDIR$OUTPUT_NAME
TOUCH_PATH=$OUTPUT_ROOT_DIR$VISUALIZE_SUBDIR$OUTPUT_NAME"/"$ROSBAG_NAME_WITHOUT_EXT

#mkdir -p $VISUALIZE_ROSBAG_DIR




RECORDTOPIC=(
/tf
/tf_static
/localization/kinematic_state
/sensing/lidar/concatenated/pointcloud
)

ALLTOPIC=""
PERCEPTION_TOPIC=$(ros2 topic list | grep --regexp="/perception/object_recognition/*")
ALLTOPIC="$ALLTOPIC $PERCEPTION_TOPIC"

for i in ${RECORDTOPIC[@]}; do
  ALLTOPIC="$ALLTOPIC $i"
done

echo $ALLTOPIC
ros2 bag record $ALLTOPIC -o $ROSBAG_PATH

# touch original rosbag path
touch $TOUCH_PATH


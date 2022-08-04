#!/bin/bash

# Example usage
# ~/path_to/autoware_foxglove_studio_visalization/scripts/record_and_remap.sh {ROSBAG_PATH}

SCRIPT_DIR=$(dirname $0)
REMAP_SCRIPT_PATH=$SCRIPT_DIR"/rosbag_remap.sh"
RECORD_SCRIPT_PATH=$SCRIPT_DIR"/rosbag_record.sh"

echo $0 
echo $1 

echo "start recording rosbag"
echo $RECORD_SCRIPT_PATH
gnome-terminal -- bash -c "$RECORD_SCRIPT_PATH $1";

sleep 1
echo "start playing rosbag"
echo $REMAP_SCRIPT_PATH
gnome-terminal -- bash -c "$REMAP_SCRIPT_PATH $1";


#!/bin/bash

FILE_NAME=$@

TOPIC_LIST=(
/perception/*
)

TOPIC_FILTER=""
for TOPIC in ${TOPIC_LIST[@]}; do
  TOPIC_FILTER+=" "
  TOPIC_FILTER+=$TOPIC
  TOPIC_FILTER+=":=/original"
  TOPIC_FILTER+=$TOPIC
  TOPIC_FILTER+=" "
done

ros2 bag play $FILE_NAME --clock 200 --remap $TOPIC_FILTER

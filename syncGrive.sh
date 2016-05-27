#!/bin/bash
RCLONE_PATH=~/tools/rclone/rclone-v1.25-linux-amd64/rclone
LOCAL_PATH=~/GoogleDrive
REMOTE_NAME=GoogleDriveMoz

$RCLONE_PATH sync $LOCAL_PATH $REMOTE_NAME:
while true
do
  inotifywait -r -e modify,move,create,delete .
  $RCLONE_PATH sync $LOCAL_PATH $REMOTE_NAME:
  #sleep 30s; #update in small batch
done


#!/bin/bash
cd ~/GoogleDriveMoz
grive
while true
do
  inotifywait -r -e modify,move,create,delete .
  grive
  #sleep 30s; #update in small batch
done


#!/bin/bash
xrandr --output eDP1 --auto
#xrandr --output VGA1 --auto --right-of LVDS1
#xrandr --output DP1 --auto --right-of eDP1 --primary --rotate left
xrandr --output HDMI1 --auto --right-of eDP1 --primary --rotate left
#sleep 5s
i3-msg restart
sleep 1s
~/slyu-scripts/startSynergyClient.sh

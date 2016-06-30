#!/bin/bash
#xrandr --output eDP1 --auto
#xrandr --output VGA1 --auto --right-of LVDS1
#xrandr --output DP1 --auto --right-of eDP1 --primary --rotate left
xrandr --output DP-1 --auto --right-of eDP-1 
#sleep 5s
i3-msg restart
./startSynergyClient.sh

#!/bin/bash
xrandr --output eDP1 --auto
#sleep 1s
#xrandr --output VGA1 --auto --right-of LVDS1
xrandr --output DP1 --auto --left-of eDP1 --primary #--rotate left
i3-msg restart

#!/bin/bash
declare -A COMMANDS
#COMMANDS["list files"]="ls"
#COMMANDS["list files with detail"]="ls -l"
COMMANDS["Built-in_display_only"]="xrandr --output eDP1 --auto; xrandr --output DP1 --off; xrandr --output HDMI1 --off"
COMMANDS["Built-in+vertical_desktop_monitor(DVI)"]="xrandr --output eDP1 --auto; xrandr --output HDMI1 --auto --right-of eDP1 --rotate left; i3-msg restart"
COMMANDS["Built-in+vertical_desktop_monitor(VGA)"]="xrandr --output eDP1 --auto; xrandr --output DP1 --auto --right-of eDP1 --rotate left; i3-msg restart"
COMMANDS["Built-in+projector_extend(VGA)"]="xrandr --output eDP1 --auto; xrandr --output DP1 --auto --right-of eDP1; i3-msg restart"
COMMANDS["Built-in+projector_mirrior(VGA)"]="xrandr --output eDP1 --auto; xrandr --output DP1 --auto --same-as eDP1; i3-msg restart"
COMMANDS["Built-in+projector_extended(HDMI)"]="xrandr --output eDP1 --auto; xrandr --output HDMI1 --auto --right-of eDP1; i3-msg restart"
COMMANDS["Built-in+projector_mirrior(HDMI)"]="xrandr --output eDP1 --auto; xrandr --output HDMI1 --auto --same-as eDP1; i3-msg restart"
#COMMANDS["list files with detail"]="ls -l"
#COMMANDS["list files with detail"]="ls -l"
#COMMANDS["list files with detail"]="ls -l"
#COMMANDS["list files with detail"]="ls -l"
#COMMANDS=(
#"ls": "ls"
#""
#)

#COMMANDS[2]="foo\ bar"

#build # to key array
counter=0
keys=()
#for desc in "${!COMMANDS[@]}"; #Rember to quote the ${ARRAY[@]}
COMMAND_NAMES=$(for x in "${!COMMANDS[@]}"; do echo "$x"; done | sort); #Rember to quote the ${ARRAY[@]}
for desc in $COMMAND_NAMES;
do
  keys+=("$desc")
  ((counter++))
done

printOptions(){
  echo "Available options:"
  counter=0
  for desc in $COMMAND_NAMES;
  do
    echo "  $counter) $desc"
    ((counter++))
  done
}

if [ -z "$1" ]
then
  printOptions
  echo -n "Please select: "
  read option
  echo "You selected" ${keys[$option]}
  eval ${COMMANDS[${keys[$option]}]}


else
  #echo "${keys[@]}"
  #echo ${COMMANDS[${keys[$1]}]}
  eval ${COMMANDS[${keys[$1]}]}
fi


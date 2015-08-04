#!/bin/sh

ison=/tmp/.night_mode_is_on
night_mode() {
  for disp in $(xrandr | sed -n 's/^\([^ ]*\).*\<connected\>.*/\1/p'); do
    xrandr --output $disp --gamma $1 --brightness $2
  done
}

night_mode_on() {
  touch $ison
  night_mode 1:1:0.5 0.9;
}

night_mode_off() {
  rm $ison
  night_mode 1:1:1 1;
}

case $1 in
  on)   night_mode_on ;;
  toggle)
    if [ -f $ison ]; then
      night_mode_off;
    else
      night_mode_on;
    fi
    ;;
  *)    night_mode_off ;;
esac

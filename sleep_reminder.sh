# Total time 30 min
for b in $(seq 1 -0.1 0.1); do
  for disp in $(xrandr | sed -n 's/^\([^ ]*\).*\<connected\>.*/\1/p'); do
    xrandr --output $disp --brightness $b
  done

  sleep 3m
done


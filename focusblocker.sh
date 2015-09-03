#declare -a appnames=("chromium-browser" "nemo")
declare -a appnames=("playonlinux")
pollperiod="5s"

while true; do
  for appname in "${appnames[@]}"; do
    #echo "Scanning for " $appname;
    if [[ $(ps -aux | grep $appname |wc -l) > 1  ]];then
      killall $appname;
      #echo "Found " $appname;
    fi
  done
  sleep $pollperiod;
done


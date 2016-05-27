while true
do
  date
  adb shell dumpsys power | grep WAKE_LOCK
  sleep 5s
done

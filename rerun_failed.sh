# Usage: ./rerun_failed.sh <file with test py filenames, use `grep functionl` to generate it
CASES=$(<$1)
#CASES=(
#  dialer/test_dialer_receive_call_with_locked_screen.py 
#  marketplace/test_marketplace_packaged_app.py
#  messages/test_sms_with_attachments.py
#  system/test_system_notification_bar.py
#  dialer/test_dialer_receive_call_with_contact_photo.py
#  dialer/test_dialer_clear_miss_call_notification.py
#  dialer/test_dialer_miss_call_from_known_contact_notification.py
#)

REPEATS=3
RESTART='--restart'
TESTVARS="/home/slyu/workspace/gaia-ui-test-resources/testvars_flame.json"

for CASE in ${CASES[@]}; 
do
  # echo $CASE
  GAIATEST_SKIP_WARNING=1 gaiatest --repeat=$REPEATS $RESTART --address localhost:2828 --testvars $TESTVARS $CASE 2>&1 | tee -a rerun.log
done


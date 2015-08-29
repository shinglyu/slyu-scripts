filename=/tmp/name.txt
echo "美商謀智活動名單" > $filename
date +%Y/%m/%d >> $filename
echo "活動時間 19:00-21:00" > $filename
echo "==================" >> $filename
cat $1 | sed "s/由.*邀請//g" | sed "s/朋友//g" | sed "s/點頭之交//g" | sed "s/呂行//g" | sed "/^$/d" | sed "s/$/\n/g">> $filename

gedit $filename

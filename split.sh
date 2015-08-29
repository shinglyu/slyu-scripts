#Split test cases spearated by "====="
csplit --prefix=case $1 "/=====/" "{*}"
sed -i 's/=====//g' case*


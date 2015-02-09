LOGFILE=/tmp/servo$(date +"%Y%m%d-%H%M").log

./mach build -j 4
./mach test-tidy             2>&1 |tee -a $LOGFILE
./mach test-content          2>&1 |tee -a $LOGFILE
./mach test-wpt-failure      2>&1 |tee -a $LOGFILE
./mach test-wpt --process 4  2>&1 |tee -a $LOGFILE
./mach test-ref              2>&1 |tee -a $LOGFILE
./mach test-unit             2>&1 |tee -a $LOGFILE

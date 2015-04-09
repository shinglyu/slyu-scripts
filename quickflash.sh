version="mozilla-b2g37_v2_2"
layers="-g -G"
build="--eng"

device="flame-kk"
user="slyu@mozilla.com"
flashtooldir="/home/slyu/workspace/B2G-flash-tool/"
cd $flashtooldir
./flash_pvt.py -d $device -v $version $layers $build -u $user


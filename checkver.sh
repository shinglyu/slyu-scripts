flashtooldir=~/workspace/B2G-flash-tool
prefix='  '
cd $flashtooldir
./check_versions.py --no-color | sed "s/^/$prefix/g" | xclip -i -sel c -f 

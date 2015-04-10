flashtooldir=~/workspace/B2G-flash-tool
prefix='  '
cd $flashtooldir
./check_versions.sh | sed "s/^/$prefix/g" | xclip -i -sel c -f 

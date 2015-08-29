#xclip -o #| python -m json.tool
echo $@ | python -m json.tool | xclip -i -sel c -f     

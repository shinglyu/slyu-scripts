counter=1
for workspace in $(i3-msg -t get_workspaces | jq '.[].name')
do
  if [ "$workspace" = "\"bg\"" ]
  then
    echo "Skip BG"
    continue
  fi
  echo $workspace " => " $counter
  i3-msg rename workspace "$workspace" to "$counter"
  counter=$((counter + 1))
done

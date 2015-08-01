#!/bin/bash
new_number=$(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
i3-msg move to workspace $new_number
i3-msg workspace $new_number

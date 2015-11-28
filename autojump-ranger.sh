#!/bin/bash

# you can add the following line to your zshrc or bashrc:
# alias jr="~/slyu-scripts/autojump-ranger.sh"
pushd $(autojump "$@")
ranger
popd

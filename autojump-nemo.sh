#!/bin/bash

# you can add the following line to your zshrc or bashrc:
# alias jn="~/slyu-scripts/autojump-nemo"
pushd $(autojump "$@")
nemo .
popd

#! /bin/zsh
export DISPLAY=:0
default=1
COUNT=${1:-$default}
repeat COUNT xdotool key XF86AudioLowerVolume

#! /bin/zsh
export DISPLAY=:0 
default=https://youtu.be/4nKHQG3MqHQ 
playerctl stop
LINK=${1:-$default}
xdg-open $LINK

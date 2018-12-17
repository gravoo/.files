#!/bin/bash 
VOLUME="$2"
if [ -z "$2" ]; then
VOLUME=85
fi;

cardId=`aplay -l | grep -oP 'card \K\d+(?=.*\[HDA Intel PCH\].*Analog)'`; amixer -D "hw:$cardId" set Master $VOLUME% && aplay -D "hw:$cardId,0" "$1"


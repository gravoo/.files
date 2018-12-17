#!/bin/bash 
VOLUME="$1"
if [ -z "$1" ]; then
VOLUME=90
fi;

cardId=`aplay -l | grep -oP 'card \K\d+(?=.*\[HDA Intel PCH\].*Analog)'`; amixer -D "hw:$cardId" set Master $VOLUME% && aplay -D "hw:$cardId,0" ~/Music/Sad\ Trombone.wav


#!/bin/bash -e

exec 42<"$0"
flock -n 42

if [[ "`pidof aplay`" != "" ]]; then
    killall aplay
else
    cardId=`aplay -l | grep -oP 'card \K\d+(?=.*\[HDA Intel PCH\].*Analog)'`; 
    amixer -D "hw:$cardId" set Master 90% && aplay -D "hw:$cardId,0" ~/Music/kaszanka.wav &
    disown
    sleep 3
fi

flock -u 42

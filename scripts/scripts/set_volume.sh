#!/bin/sh
cardId=`aplay -l | grep -oP 'card \K\d+(?=.*\[HDA Intel PCH\].*Analog)'`; amixer --quiet -D "hw:$cardId" set Master "$1"

#!/bin/bash

exceptions='((HID 13ba:0001)|(example keyboard))'
operation='disable'

if [[ "$1" =~ ^(enable|disable)$ ]]; then
    operation=$1
fi

for i in `DISPLAY=:0 xinput --list | grep -vP "$exceptions" | grep -oP '\s+id=\K\d+'`; do
    DISPLAY=:0 xinput list --name-only $i
    DISPLAY=:0 xinput --$operation $i
done

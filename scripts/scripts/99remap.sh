#!/bin/sh
remote_id=$(
    xinput list |
    sed -n 's/.*13ba:0001.*id=\([0-9]*\).*keyboard.*/\1/p'
)
[ "$remote_id" ] || exit

# remap the following keys, only for my custom vintage atari joystick connected
# through an old USB keyboard:
#
# keypad 5 -> keypad 6
# . -> keypad 2
# [ -> keypad 8
# left shift -> left control

mkdir -p /tmp/xkb/symbols
cat >/tmp/xkb/symbols/custom <<\EOF
xkb_symbols "qwerty" {
    key <KPEN>  { [ Hiragana_Katakana, Hiragana_Katakana, Hiragana_Katakana, Hiragana_Katakana ]       };
};
EOF

setxkbmap -device $remote_id -print | sed 's/\(xkb_symbols.*\)"/\1+custom(qwerty)"/' | xkbcomp -I/tmp/xkb -i $remote_id -synch - $DISPLAY

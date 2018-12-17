#!/bin/bash
lang='pl'
volume='100%'
prev_volume=`amixer get Master | grep -oP 'Playback.*\[\K\d+%(?=\])'`

while getopts 'l:v:h' option; do
    case "$option" in
        l ) lang="$OPTARG";;
        v ) volume="$OPTARG";;
        h | * ) printf 'Ivona v 0.42\n-l[pl] two letter language code\n-v[100%%] 0-100%% speech volume\n-h this help\nCOPYRIGHT ORAJT\n'; exit 0;;
    esac
done
shift $((OPTIND - 1))

~/scripts/set_volume.sh "$volume"
curl -G --data-urlencode "q=$*" -H 'Referer: http://translate.google.com/' -H 'User-Agent: stagefright/1.2 (Linux;Android 5.0)' 'https://translate.google.com/translate_tts?ie=UTF-8&tl='$lang'&client=tw-ob' > /tmp/google_tts.mp3 2> /dev/null
mpg123 /tmp/google_tts.mp3 2> /dev/null
~/scripts/set_volume.sh "$prev_volume"

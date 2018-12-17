#!/bin/sh
~/scripts/playWithVolume.sh ~/Music/new-mail.wav 100
set -e
echo "document.getElementById('codeRev').innerHTML='Code review: $1 od sprintu $2'" > ~/codeReview.js

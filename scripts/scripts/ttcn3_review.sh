#!/bin/sh
~/scripts/playWithVolume.sh ~/Music/new-mail.wav 100
set -e
echo "document.getElementById('ttcnRev').innerHTML='TTCN-3 review: $1 od sprintu $2'" > ~/ttcnReview.js

#! /bin/sh
#
# set_volume.sh
# Copyright (C) 2018 gravoo <gravoo@gravoo>
#
# Distributed under terms of the MIT license.
#
export DISPLAY=:0 
default=`pamixer --get-volume`
COUNT=${1:-$default}
pamixer --set-volume $COUNT



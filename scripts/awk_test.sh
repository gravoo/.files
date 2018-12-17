#! /bin/sh
#
# awk_test.sh
# Copyright (C) 2018 gravoo <gravoo@gravoo>
#
# Distributed under terms of the MIT license.
#


app=$1
pacmd list-sink-inputs | awk -v app=$app '
                            $1 == "index:" {idx = $2} 
                            $1 == "application.process.binary" && $3 == "\"" app "\"" {print idx; exit}
                            '

dupa=`pgrep firefox`
echo $dupa

#! /bin/sh
#
# disable_wakeup_on_usb_device.sh
# Copyright (C) 2018 gravoo <gravoo@gravoo>
#
# Distributed under terms of the MIT license.
#

echo "EHC1" > /proc/acpi/wakeup
echo "EHC2" > /proc/acpi/wakeup
echo "XHC" > /proc/acpi/wakeup


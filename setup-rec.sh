#!/bin/bash
. "$(dirname "$0")/rpi-cirrus-functions.sh"

# setup gpio
echo 5  > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio5/direction

# setup audio connection
playback_to_spdif
record_from_spdif

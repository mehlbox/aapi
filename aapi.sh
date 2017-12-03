#!/bin/bash
recpath="/mnt/autorecord"

if [ $(cat /sys/class/gpio/gpio5/value) -eq 0 ]; then
  ps cax | grep arecord > /dev/null
  if [ $? -eq 1 ]; then
    folder=`date '+%Y-%m-%d_%a'`
    file="autorec_"`date '+%Y-%m-%d_%a_%H%M'`".wav"
    if [ ! -d $recpath/$folder ]; then
      mkdir $recpath/$folder
    fi
    arecord -c 2 -f S16_LE -r 48000 --max-file-time=1800 -D hw:CARD=RPiCirrus,DEV=0 $recpath/$folder/$file
  fi
else
  ps cax | grep arecord > /dev/null
  if [ $? -eq 0 ]; then
    killall arecord > /dev/null
  fi
fi

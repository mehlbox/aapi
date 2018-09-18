#!/bin/bash
recpath="/mnt/autorecord"
pattern="????-??-??_???"

if [ ! -f /tmp/aapi.conf ] # setup driver
then
  touch /tmp/aapi.conf
  # setup gpio
  echo 5  > /sys/class/gpio/export
  echo in > /sys/class/gpio/gpio5/direction
  # setup audio connection
fi

if [ $(cat /sys/class/gpio/gpio5/value) -eq 0 ]; then # check gpio (switch)
  echo "mixing console is turned on"
  ps cax | grep arecord > /dev/null
  if [ $? -eq 1 ]; then
    folder=`date '+%Y-%m-%d_%a'`
    file="autorec_"`date '+%Y-%m-%d_%a_%H%M'`".wav"
    if [ ! -d $recpath/$folder ]; then # create folder if required
      echo "new folder will be created"
      mkdir $recpath/$folder
    fi
    echo "recording will be started"
    arecord -c 2 -f S16_LE -r 48000 --max-file-time=3600 -D hw:CARD=sndrpihifiberry,DEV=0 $recpath/$folder/$file # start recording
  else
    echo "recording is already in progress"
  fi
else
  echo "mixing console is turned off"
  ps cax | grep arecord > /dev/null
  if [ $? -eq 0 ]; then
    echo "recording will be stopped"
    killall arecord > /dev/null # stop recording
  else
    echo "recording is already stopped"
  fi
fi

if [ $(date '+%H%M') -eq "0000" ] # delete old folder at midnight
then
  echo "old folder will be deleted"
  ls -dr /mnt/autorecord/$pattern | tail -n +16 | while read folder
  do
    rm -r $folder
  done
fi

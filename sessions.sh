#!/bin/bash

#only needed if not using byobu
#screen -dmS byobu -t shell

if dmesg | grep -q ttyACM0; then
 screen -S byobu -X exec screen -t AMC0 /dev/ttyACM0 9600
fi
if dmesg | grep -q ttyUSB0; then
 screen -S byobu -X exec screen -t USB /dev/ttyUSB0 9600,cs8
fi
#if dmesg | grep -q ttyAMA0; then
#  screen -S byobu -X exec screen -t AMA0 /dev/ttyAMA0 9600,cs8
#fi

#only needed if not using byobu
#screen -R

#!/bin/bash

if dmesg | grep -q ttyACM0; then
 screen -S byobu -X exec screen -t AMC0 /dev/ttyACM0 9600
fi
if dmesg | grep -q ttyUSB0; then
 screen -S byobu -X exec screen -t USB /dev/ttyUSB0 9600,cs8
fi

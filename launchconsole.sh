#!/bin/bash

if dmesg | grep -q ttyACM0; then
       screen -d -R -m -S console /dev/ttyACM0 9600,cs8
elif dmesg | grep ttyUSB0; then
       screen -d -R -m -S console /dev/ttyUSB0 9600,cs8
else
       printf "\n\nConsole not found.  Try manually.\n"
       dmesg | grep /dev/tty

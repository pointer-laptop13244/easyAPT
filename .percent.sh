#!/bin/bash
PERCENT=$(cat .percent.txt)
dialog --title "Welcome to easyAPT!" --stdout --gauge "This is version JUL18-V102 (July 18 Version 102), Github release 1.0.2.  We are now starting up, this takes only a few seconds." 9 0 $PERCENT &
sleep .6

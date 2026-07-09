#!/bin/bash
PERCENT=$(cat .percent.txt)
dialog --title "Welcome to easyAPT!" --stdout --gauge "This is version JUL8-V32 (July 8 Version 36), Github release N/A.  We are now starting up, this takes only a few seconds." 9 0 $PERCENT &
sleep .6

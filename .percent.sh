#!/bin/bash
PERCENT=$(cat .percent.txt)
dialog --title "Welcome to easyAPT!" --stdout --gauge "This is version JUL13-V52 (July 12 Version 52), Github release N/A.  We are now starting up, this takes only a few seconds." 9 0 $PERCENT &
sleep .6

#!/bin/bash

if [ "$1" == "regular" ]; then
	xrandr --output DP-0 --primary --auto --pos 2560x0 --output DP-2 --auto --left-of DP-1
elif [ "$1" == "work" ]; then
	xrandr --output DP-0 --off --output DP-2 --primary --auto --pos 0x0
else
	echo "Please pass either 'regular' or 'work'"
fi


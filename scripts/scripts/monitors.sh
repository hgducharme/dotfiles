#!/bin/bash

CENTER="DP-0"
LEFT="DP-2"

if [[ "$1" == "show" && "$2" == "both" ]]; then
	xrandr --output $CENTER --primary --auto --pos 2560x0 --output $LEFT --auto --left-of DP-1
elif [[ "$1" == "show" && "$2" == "left" ]]; then
	xrandr --output $CENTER --off --output $LEFT --primary --auto --pos 0x0
elif [[ "$1" == "show" && "$2" == "center" ]]; then
	xrandr --output $LEFT --off
	xrandr --output $CENTER --primary --auto
else
	echo "Please pass either 'regular', 'work left', or 'work center'"
fi


#!/bin/bash

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# Launch polybar with the colors of the specified wallpaper
bash ~/.config/polybar/custom/scripts/pywal.sh ~/repos/nordic-wallpapers/wallpapers/at_the_coffeeshop.png
bash ~/.config/polybar/launch.sh --custom

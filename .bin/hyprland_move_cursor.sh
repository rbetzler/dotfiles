#!/bin/bash

# Do not disappear cursor/mouse
hyprctl keyword cursor:inactive_timeout 0

positions="$(hyprctl cursorpos -j)"
xpos="$(echo $positions | jq -r '.x')"
ypos="$(echo $positions | jq -r '.y')"

if [ "$2" == "slow" ]; then
  speed=3
else
  speed=60
fi

if [ "$1" == "left" ]; then
  hyprctl dispatch movecursor $(( $xpos - $speed )) $ypos
elif [ "$1" == "right" ]; then
  hyprctl dispatch movecursor $(( $xpos + $speed )) $ypos
elif [ "$1" == "up" ]; then
  hyprctl dispatch movecursor $xpos $(( $ypos - $speed ))
elif [ "$1" == "down" ]; then
  hyprctl dispatch movecursor $xpos $(( $ypos + $speed ))
fi

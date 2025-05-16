#!/bin/bash

hyprctl keyword monitor "HDMI-A-1, 1920x1080, 1920x0, 1"
hyprctl dispatch moveworkspacetomonitor 1 eDP-1
hyprctl dispatch moveworkspacetomonitor 2 eDP-1
hyprctl dispatch moveworkspacetomonitor 3 eDP-1
hyprctl dispatch moveworkspacetomonitor 4 HDMI-A-1
hyprctl dispatch moveworkspacetomonitor 5 HDMI-A-1
hyprctl dispatch moveworkspacetomonitor 6 HDMI-A-1

killall waybar
hyprctl dispatch exec waybar

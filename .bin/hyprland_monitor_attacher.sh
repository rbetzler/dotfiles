#!/bin/bash
#
# Toggle monitors based on what is plugged in

restart_waybar(){
  killall waybar
  hyprctl dispatch exec waybar
}

monitors=$(hyprctl monitors -j | jq -r '.[]."name"')
if echo "$monitors" | grep --quiet --basic-regexp '^DP-1'; then
if echo "$monitors" | grep --quiet --basic-regexp '^DP-3'; then
  hyprctl keyword monitor "eDP-1, disable"
  hyprctl keyword monitor "DP-1, 1920x1080, 1920x0, 1"
  hyprctl keyword monitor "DP-3, 2560x1440, 3840x0, 1"
  hyprctl dispatch moveworkspacetomonitor  1 DP-1
  hyprctl dispatch moveworkspacetomonitor  2 DP-1
  hyprctl dispatch moveworkspacetomonitor  3 DP-1
  hyprctl dispatch moveworkspacetomonitor  4 DP-1
  hyprctl dispatch moveworkspacetomonitor  5 DP-1
  hyprctl dispatch moveworkspacetomonitor  6 DP-3
  hyprctl dispatch moveworkspacetomonitor  7 DP-3
  hyprctl dispatch moveworkspacetomonitor  8 DP-3
  hyprctl dispatch moveworkspacetomonitor  9 DP-3
  hyprctl dispatch moveworkspacetomonitor 10 DP-3
  restart_waybar
elif echo "$monitors" | grep --quiet --basic-regexp '^HDMI-A-1'; then
  hyprctl keyword monitor "eDP-1, disable"
  hyprctl keyword monitor "DP-1, 1920x1080, 1920x0, 1"
  hyprctl keyword monitor "HDMI-A-1, 2560x1440, 3840x0, 1"
  hyprctl dispatch moveworkspacetomonitor  1 DP-1
  hyprctl dispatch moveworkspacetomonitor  2 DP-1
  hyprctl dispatch moveworkspacetomonitor  3 DP-1
  hyprctl dispatch moveworkspacetomonitor  4 DP-1
  hyprctl dispatch moveworkspacetomonitor  5 DP-1
  hyprctl dispatch moveworkspacetomonitor  6 HDMI-A-1
  hyprctl dispatch moveworkspacetomonitor  7 HDMI-A-1
  hyprctl dispatch moveworkspacetomonitor  8 HDMI-A-1
  hyprctl dispatch moveworkspacetomonitor  9 HDMI-A-1
  hyprctl dispatch moveworkspacetomonitor 10 HDMI-A-1
  restart_waybar
else
  hyprctl keyword monitor "eDP-1, disable"
  hyprctl keyword monitor "DP-1, 1920x1080, 1920x0, 1"
  hyprctl dispatch moveworkspacetomonitor  1 DP-1
  hyprctl dispatch moveworkspacetomonitor  2 DP-1
  hyprctl dispatch moveworkspacetomonitor  3 DP-1
  hyprctl dispatch moveworkspacetomonitor  4 DP-1
  hyprctl dispatch moveworkspacetomonitor  5 DP-1
  hyprctl dispatch moveworkspacetomonitor  6 DP-1
  hyprctl dispatch moveworkspacetomonitor  7 DP-1
  hyprctl dispatch moveworkspacetomonitor  8 DP-1
  hyprctl dispatch moveworkspacetomonitor  9 DP-1
  hyprctl dispatch moveworkspacetomonitor 10 DP-1
  restart_waybar
fi
fi

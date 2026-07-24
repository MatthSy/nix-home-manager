#!/usr/bin/env bash

# swaylock --config ~/.config/swaylock/swaylock/config
# swaylock --config ~/.cache/wal/swaylock -i ~/.config/swaylock/wallpaper.png
# sleep 20
#
# # Check if screen is still locked, if yes then suspend
# if pgrep -x swaylock >/dev/null; then
#   systemctl suspend
# fi


hyprlock &
sleep 20

if pgrep -x hyprlock>/dev/null; then
  systemctl suspend
fi

#!/usr/bin/env bash

choice=$(printf " Shutdown\n Reboot\n Lock\n Logout\n" | \
    wofi --dmenu -l top --width 200 --height 200 --prompt "Power Menu" --cache-file="/dev/null")

case "$choice" in
    " Lock") swaylock -f --config ~/.config/swaylock/swaylock/config ;;
    " Logout") hyprctl dispatch exit ;;
    " Reboot") systemctl reboot ;;
    " Shutdown") systemctl poweroff ;;
esac

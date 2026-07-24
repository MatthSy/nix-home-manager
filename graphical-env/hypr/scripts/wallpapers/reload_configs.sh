#!/usr/bin/env bash

sleep 0.2
cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-pywal.css
cp ~/.cache/wal/colors-hyprland.conf ~/.config/hypr/colors-pywal.conf
cp ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
cp ~/.cache/wal/wlogout.css ~/.config/wlogout/style.css

killall dunst; dunst &

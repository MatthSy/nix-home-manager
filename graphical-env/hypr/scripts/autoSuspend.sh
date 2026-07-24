#!/usr/bin/env bash

# swayidle -w \
# timeout 600 'swaylock --config ~/.config/swaylock/swaylock/config' \
# timeout 720 'systemctl suspend' \
# resume 'hyprctl dispatch dpms on' \
# before-sleep 'swaylock --config ~/.config/swaylock/swaylock/config'


swayidle -w \
timeout 600 'hyprlock &' \
timeout 720 'systemctl suspend' \
resume 'hyprctl dispatch dpms on' \
before-sleep 'hyprlock'

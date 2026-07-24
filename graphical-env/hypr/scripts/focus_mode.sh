#!/usr/bin/env bash

# Define paths
MAIN_CONFIG="$HOME/.config/hypr/hyprland.conf"
FOCUS_CONFIG="$HOME/.config/hypr/focus_mode.conf"
BACKUP_CONFIG="$HOME/.config/hypr/hyprland_backup.conf"

# Check if focus mode is currently active
if [ -f "$BACKUP_CONFIG" ]; then
    # Restore the original config
    mv "$BACKUP_CONFIG" "$MAIN_CONFIG"
    dunstify -t 1000 "Switched to normal mode."
    $HOME/.config/hypr/scripts/wallpapers/load_rand_wall.sh
else
    # Backup the original config
    cp "$MAIN_CONFIG" "$BACKUP_CONFIG"
    # Apply focus mode settings
    cat "$FOCUS_CONFIG" >> "$MAIN_CONFIG"
    dunstify -t 1000 "Switched to focus mode."

    WALLPAPER="$HOME/Images/wallpaper-back/noir.jpg"
    hyprctl hyprpaper reload ,"$WALLPAPER"
fi


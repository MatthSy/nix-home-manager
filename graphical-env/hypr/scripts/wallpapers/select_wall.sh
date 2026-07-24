#!/usr/bin/env bash


# Source : "bread on penguins" on youtube
# Slightly modified because i'm too lazy to set things up correctly

if ! pgrep -f hyprpaper > /dev/null; then
  hyprpaper &
fi;


FOLDER=~/Images/wallpapers # wallpaper folder

menu () {
		if command -v nsxiv >/dev/null; then 
				CHOICE=$(nsxiv -ot $FOLDER/*)
		fi

echo "CHOICE='$CHOICE'"
ls -l -- "$CHOICE"

case $CHOICE in
		*.*) wal -i "$CHOICE"--cols16 -s -t -e -n & hyprctl hyprpaper wallpaper ,"$CHOICE" ;;
		*) exit 0 ;;
esac
}

# If given arguments:
# First argument will be used by pywal as wallpaper/dir path
# Second will be used as theme (use wal --theme to view built-in themes)

case "$#" in
		0) menu ;;
		1) wal -i "$1"--cols16 -s -t -e -n -o $SCRIPT ;;
		2) wal -i "$1"--cols16 -s -t -e -n --theme $2 -o $SCRIPT ;;
		*) exit 0 ;;
esac

cp $CHOICE ~/.config/wlogout/wallpaper.png
cp $CHOICE ~/.config/swaylock/wallpaper.png
~/.config/hypr/scripts/wallpapers/reload_configs.sh

#!/usr/bin/env bash

my_array=(~/Images/wallpapers/*)
image=${my_array[ $RANDOM % ${#my_array[@]} ]}
echo $image
if ! pgrep -f hyprpaper > /dev/null; then
  hyprpaper &
fi;
sleep 0.5s
wal -i "${image}" --backend haishoku --cols16 -s -t -e

hyprctl hyprpaper wallpaper ,"${image}"

cp $CHOICE ~/.config/wlogout/wallpaper.png
cp $CHOICE ~/.config/waylock/wallpaper.png
~/.config/hypr/scripts/wallpapers/reload_configs.sh

#!/usr/bin/env bash

TOGGLE_VALUE_FILE="/tmp/toggle_waybar"

if [ -f "$TOGGLE_VALUE_FILE"]; then
  value=$(cat "$TOGGLE_VALUE_FILE")
else
  value=1
  echo 1 > "$TOGGLE_VALUE_FILE"
fi

if [$value == 0]; then
  killall -SIGUSR2 waybar;
  echo 0 > "$TOGGLE_VALUE_FILE"
else
  killall -SIGUSR1 waybar;
  echo 1 > "$TOGGLE_VALUE_FILE"
fi

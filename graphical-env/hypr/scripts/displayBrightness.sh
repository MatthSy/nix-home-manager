#!/usr/bin/env bash

# Fichier pour stocker le dernier temps d'envoi de notification
LAST_NOTIFICATION_FILE="/tmp/last_brightness_notification"

# Temps d'attente entre les notifications (en millisecondes)
DELAY_MS=150

for ((i = 0; i < 2; i++)); do
# Obtenir l'heure actuelle en millisecondes
CURRENT_TIME_MS=$(($(date +%s) * 1000 + $(date +%N) / 1000000))

# Vérifier si le fichier existe et lire le dernier temps d'envoi
if [ -f "$LAST_NOTIFICATION_FILE" ]; then
    LAST_NOTIFICATION_MS=$(cat "$LAST_NOTIFICATION_FILE")
else
    LAST_NOTIFICATION_MS=0
fi

# Vérifier si le délai est écoulé
if (( CURRENT_TIME_MS - LAST_NOTIFICATION_MS >= DELAY_MS )); then
    brightness=$(brightnessctl get)
    max_brightness=$(brightnessctl max)
    percentage=$(($brightness * 100 / max_brightness))
    dunstify -h string:x-dunst-stack-tag:brightness -h int:value:"$percentage" -t 800 "Brightness : $percentage%"
    echo "$CURRENT_TIME_MS" > "$LAST_NOTIFICATION_FILE"
fi

sleep 0.5
done

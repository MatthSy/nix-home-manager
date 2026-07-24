#!/usr/bin/env bash
while true; do
    # Détecter si on est sur secteur
    if grep -q "POWER_SUPPLY_ONLINE=1" /sys/class/power_supply/ACAD/uevent; then
        cp ~/.config/kanshi/config.ac ~/.config/kanshi/config
    else
        cp ~/.config/kanshi/config.battery ~/.config/kanshi/config
    fi

    # Redémarrer kanshi si nécessaire
    pkill kanshi
    sleep 0.5
    kanshi &

    # Attendre un peu avant de vérifier à nouveau
    sleep 2  # Vérifie toutes les 60 secondes
done


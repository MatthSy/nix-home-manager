#!/usr/bin/env bash

if pgrep hypridle > /dev/null
then
    killall hypridle
else
    /usr/bin/hypridle
fi

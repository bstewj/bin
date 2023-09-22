#!/usr/bin/env bash

winclass="$(xdotool search --class scratchpulse)";
if [ -z "$winclass" ]; then
    kitty --class scratchpulse -e pulsemixer
else
    if [ ! -f /tmp/scratchpulse ]; then
        touch /tmp/scratchpulse && xdo hide "$winclass"
    elif [ -f /tmp/scratchpulse ]; then
        rm /tmp/scratchpulse && xdo show "$winclass"
    fi
fi

#!/usr/bin/env bash


winclass="$(xdotool search --class bm)";
if [ -z "$winclass" ]; then
    kitty --class bm -e bashmount
else
    if [ ! -f /tmp/scmoc ]; then
        touch /tmp/scmoc && xdo hide "$winclass"
    elif [ -f /tmp/scmoc ]; then
        rm /tmp/scmoc && xdo show "$winclass"
    fi
fi
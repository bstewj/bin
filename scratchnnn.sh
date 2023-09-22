#!/usr/bin/env bash

winclass="$(xdotool search --class scratchnnn)";
if [ -z "$winclass" ]; then
    kitty --class scratchnnn -e nnn
else
    if [ ! -f /tmp/scratchnnn ]; then
        touch /tmp/scratchnnn && xdo hide "$winclass"
    elif [ -f /tmp/scratchnnn ]; then
        rm /tmp/scratchnnn && xdo show "$winclass"
    fi
fi

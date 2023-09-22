#!/usr/bin/env bash

winclass="$(xdotool search --class scratchterm)"
            if [ -z "$winclass" ]; then
                kitty --class scratchterm -e fish 2> /dev/null
            else
                if [ ! -f /tmp/scratchterm ]; then
                    touch /tmp/scratchterm && xdo hide "$winclass"
                elif [ -f /tmp/scratchterm ]; then
                    rm /tmp/scratchterm && xdo show "$winclass"
                fi
            fi

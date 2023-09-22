 #!/usr/bin/env bash
 
 winclass="$(xdotool search --class scratchfzf)"
            if [ -z "$winclass" ]; then
                kitty --class scratchfzf -e launchfzf.sh 2> /dev/null
            else
                if [ ! -f /tmp/scratchfzf ]; then
                    touch /tmp/scratchfzf && xdo hide "$winclass"
                elif [ -f /tmp/scratchfzf ]; then
                    rm /tmp/scratchfzf && xdo show "$winclass"
                fi
            fi

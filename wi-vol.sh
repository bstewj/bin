#!/bin/sh

notify_volume() {
	if [ "$(pamixer --get-mute)" = "true" ]; then
		notify-send -a progress -t 1000 -h 'string:wired-tag:volume' -h "int:value:$(pamixer --get-volume)" 'Volume' 'muted'
	else
		notify-send -a progress -t 1000 -h 'string:wired-tag:volume' -h "int:value:$(pamixer --get-volume)" 'Volume' 
	fi
}

notify_brightness() {
	notify-send -a progress -t 1000 -h 'string:wired-tag:brightness' -h "int:value:$target" 'Brightness' 
}

notify_track() {
	# wait for mpris to update
	sleep 0.4
	art_url="$(playerctl metadata -f '{{mpris:artUrl}}' | sed 's/file:\/\///')"
	if [ -z "$art_url" ]; then
		notify-send -h 'string:wired-tag:player' -t 10000 'Player' "$(playerctl metadata -f '{{artist}} —  {{title}}')"
	else
		notify-send -h 'string:wired-tag:player' -t 10000 -h "string:image-path:$art_url" 'Player' "$(playerctl metadata -f '{{artist}} —  {{title}}')"
	fi
}

case "$1" in
	up)
		pamixer -i 5
		notify_volume
	;;

	down)
		pamixer -d 5
		notify_volume
	;;

	mutetoggle)
		pamixer --toggle-mute
		notify_volume
	;;

	light_up)
		curr="$(printf '%.*f\n' 0 "$(light)")"
		target="$(( curr + 5 ))"
		light -S "$target"
		notify_brightness
	;;

	light_down)
		curr="$(printf '%.*f\n' 0 "$(light)")"
		target="$(( curr - 5 ))"
		light -S "$target"
		notify_brightness
	;;

	play_pause)
		playerctl play-pause
		notify_track
		;;

	next)
		playerctl next
		notify_track
		;;
	
	previous)
		playerctl previous
		notify_track
		;;
esac

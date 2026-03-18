#!/bin/bash
echo info | bluetoothctl | grep -q 'Connected: yes' && echo -n '' || echo -n '⬯'
case "$(pamixer --get-mute)" in
    "true")
	echo -n " MUT" ;;
    "false")
	echo -n " $(pamixer --get-volume)%" ;;
esac

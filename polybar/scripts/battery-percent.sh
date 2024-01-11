#!/bin/bash

state="$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep state | awk '{print $2}')"
case "$state" in
    charging)
	symbol=Ʇ ;;
    discharging)
	symbol=T ;;
    fully-charged)
	symbol=ꟻ ;;
    *)
	symbol=Ꝋ ;;
esac
echo $symbol $(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage | awk '{print $2}')

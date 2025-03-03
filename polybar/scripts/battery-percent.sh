#!/bin/bash

adapter_state="$(acpi -a | awk '{print $NF}')"
battery_results="$(acpi -b)"
bat0_percent="$(sed -n 1p <<< "$battery_results" | awk -F ', ' '{print $2}' | sed 's/100%/100/')"
bat1_percent="$(sed -n 2p <<< "$battery_results" | awk -F ', ' '{print $2}' | sed 's/100%/100/')"
case "$adapter_state" in
    "on-line")
	symbol=▲ 
	case "$(grep ": Charging" <<< "$battery_results" | awk '{print $2}' )" in
	    "0:") echo "$symbol $bat0_percent • $bat1_percent •" ;;
	    "1:") echo "• $bat0_percent • $bat1_percent $symbol" ;;
	    *) echo "• $bat0_percent $symbol $bat1_percent •" ;;
	esac
	;;
    "off-line")
	symbol=▼
	case "$(grep ": Discharging" <<< "$battery_results" | awk '{print $2}')" in
	    "0:") echo "$symbol $bat0_percent • $bat1_percent •" ;;
	    "1:") echo "• $bat0_percent • $bat1_percent $symbol" ;;
	    *) echo "• $bat0_percent $symbol $bat1_percent •" ;;
	esac
	;;
esac




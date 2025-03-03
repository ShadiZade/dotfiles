#!/bin/bash

adapter_state="$(acpi -a | awk '{print $NF}')"
case "$adapter_state" in
    "on-line")
	symbol=▲ ;;
    "off-line")
	symbol=▼ ;;
esac
battery_results="$(acpi -b)"
bat0_percent="$(sed -n 1p <<< "$battery_results" | awk -F ', ' '{print $2}')"
bat1_percent="$(sed -n 2p <<< "$battery_results" | awk -F ', ' '{print $2}')"
case "$(grep -v ": Not charging" <<< "$battery_results" | awk '{print $2}' )" in
    "0:") echo "$symbol $bat0_percent • $bat1_percent •" ;;
    "1:") echo "• $bat0_percent • $bat1_percent $symbol" ;;
    *) echo "• $bat0_percent $symbol $bat1_percent •" ;;
esac	  


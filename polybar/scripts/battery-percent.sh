#!/bin/bash

state="$(acpi -a | awk '{print $NF}')"
case "$state" in
    "on-line")
	symbol=▲ ;;
    "off-line")
	symbol=▼ ;;
esac
bat0_percent="$(acpi -b | sed -n 1p | awk -F ', ' '{print $2}')"
bat1_percent="$(acpi -b | sed -n 2p | awk -F ', ' '{print $2}')"
echo "$bat0_percent $symbol $bat1_percent"

#!/bin/bash

state="$(acpi -a | awk '{print $NF}')"
case "$state" in
    "on-line")
	symbol=▲ ;;
    "off-line")
	symbol=▼ ;;
esac
echo $symbol $(acpi -b | sed -n 2p | awk -F ', ' '{print $2}')

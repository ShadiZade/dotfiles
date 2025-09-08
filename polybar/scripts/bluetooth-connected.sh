#!/bin/bash
bluetoothctl info | grep -q 'Connected: yes' && echo -n '' || echo -n ''

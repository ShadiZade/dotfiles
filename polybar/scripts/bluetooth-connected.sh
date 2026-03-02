#!/bin/bash
echo info | bluetoothctl | grep -q 'Connected: yes' && echo -n '' || echo -n '⬯'

#!/bin/bash
##################################################################################################
#
#					 ____  _   _    _    ____ ___     _____   _    ____  _____ 
#					/ ___|| | | |  / \  |  _ \_ _|   |__  /  / \  |  _ \| ____|
#					\___ \| |_| | / _ \ | | | | |_____ / /  / _ \ | | | |  _|  
#					 ___) |  _  |/ ___ \| |_| | |_____/ /_ / ___ \| |_| | |___ 
#					|____/|_| |_/_/   \_\____/___|   /____/_/   \_\____/|_____|
#
#					https://github.com/ShadiZade
#					polybar-launch.sh
#					script for launching polybar
#
###################################################################################################
####### symlink location: ~/.config/polybar/scripts/ ##############################################

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null
do
    sleep 1
done
polybar bspwm1 -c ~/.config/polybar/config.ini 2>/dev/null

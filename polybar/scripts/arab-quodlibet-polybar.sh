#!/bin/sh
##################################################################################################
#
#					 ____  _   _    _    ____ ___     _____   _    ____  _____ 
#					/ ___|| | | |  / \  |  _ \_ _|   |__  /  / \  |  _ \| ____|
#					\___ \| |_| | / _ \ | | | | |_____ / /  / _ \ | | | |  _|  
#					 ___) |  _  |/ ___ \| |_| | |_____/ /_ / ___ \| |_| | |___ 
#					|____/|_| |_/_/   \_\____/___|   /____/_/   \_\____/|_____|
#
#					https://github.com/ShadiZade
#					arab-quodlibet-polybar.sh
#					script for displaying name of Arabic song in a polybar module
#
###################################################################################################
####### symlink location: ~/.config/polybar/scripts/ ##############################################

if [ "$(quodlibet --print-playing | grep ' - ')" == "" ]
	then
	songname=$(quodlibet --print-playing)
	else
	songitself=$(quodlibet --print-playing | awk -F " - " '{print $2}')
	artistname=$(quodlibet --print-playing | awk -F " - " '{print $1}')
	songname=$songitself" ل"$artistname
fi
echo "$songname" | fribidi | awk '{gsub(/^\s+|\s+$/,"")} {print $0}'

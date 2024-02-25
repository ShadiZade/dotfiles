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
#					arab-quodlibet-polybar.sh
#					script for displaying name of Arabic song in a polybar module
#
###################################################################################################
####### symlink location: ~/.config/polybar/scripts/ ##############################################

fullname=$(quodlibet --print-playing)
if echo "$fullname" | grep -q ' - '
	then
	songitself=$(echo "$fullname" | awk -F " - " '{print $2}')
	artistname=$(echo "$fullname" | awk -F " - " '{print $1}')
	songname=$songitself" ل"$artistname
	else
	songname="$fullname"
fi
echo "$songname" | fribidi | awk '{gsub(/^\s+|\s+$/,"")} {print $0}'

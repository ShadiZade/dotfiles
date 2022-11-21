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
#					quodlibet-polybar.sh
#					script for displaying name of song in a polybar module
#
###################################################################################################
####### symlink location: ~/.config/polybar/scripts/ ##############################################

quodlibet --print-playing 2>&1 | grep -q 'not running' && exit
fullname=$(quodlibet --print-playing)
echo "$fullname" | grep -q 'Unknown Audio' && exit
echo "$fullname" | grep -q '[ابتثجحخدذرزسشصضطظعغفقكلمنهوي]' && ~/.config/polybar/scripts/arab-quodlibet-polybar.sh && exit
# checks for a hyphen to ascertain if the song has a known artist
if echo "$fullname" | grep -q ' - '
	then
	songitself=$(echo "$fullname" | awk -F " - " '{print $2}')
	artistname=$(echo "$fullname" | awk -F " - " '{print $1}')
	# removes II, III, Jr, or Jr. from artist name, isolates surname, and finalizes structure
	songname=$(echo "$artistname" | awk -F " (Jr[.]*|II[I]*)" '{print $1}' | awk -F " " '{print $NF}')"'s "$songitself
	else
	songname=$fullname
fi
# checks for all categorizations (Op., BWV, B., Hob.), and then for movement #s
echo "$songname" \
| awk -F ',[[:space:]][[:alnum:]]+[[:print:]]+[([:digit:]|N/A)]' '{print $1}' \
| awk -F '-[[:space:]][IVX]+[[:space:]]' '{print $1}'

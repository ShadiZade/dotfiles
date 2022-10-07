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

if [ "$(quodlibet --print-playing 2>&1 | grep 'not running')" != "" ]; then echo ""; exit; fi
if [ "$(quodlibet --print-playing | grep 'Unknown Audio')" != "" ]; then echo ""; exit; fi
if [ "$(quodlibet --print-playing | grep '[ابتثجحخدذرزسشصضطظعغفقكلمنهوي]')" != "" ]; then 
~/.config/polybar/scripts/arab-quodlibet-polybar.sh; exit; fi
# checks for a hyphen to ascertain if the song has a known artist
if [ "$(quodlibet --print-playing | grep ' - ')" == "" ]
	then
	songname=$(quodlibet --print-playing)
	else
	songitself=$(quodlibet --print-playing | awk -F " - " '{print $2}')
	artistname=$(quodlibet --print-playing | awk -F " - " '{print $1}')
	# removes II, III, Jr, or Jr. from artist name, isolates surname, and finalizes structure
	songname=$(echo "$artistname" | awk -F " (Jr[.]*|II[I]*)" '{print $1}' | awk -F " " '{print $NF}')"'s "$songitself
fi
# checks for all categorizations (Op., BWV, B., Hob.), and then for movement #s
final=$(echo "$songname" \
| awk -F ',[[:space:]][[:alnum:]]+[[:print:]]+[([:digit:]|N/A)]' '{print $1}' \
| awk -F '-[[:space:]][IVX]+[[:space:]]' '{print $1}'\
)
echo "$final"


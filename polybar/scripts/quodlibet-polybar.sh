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

[[ -e "/tmp/brown-noise-pid" ]] && {
    echo "[BROWN NOISE]"
    exit
}
quodlibet --print-playing 2>&1 | grep -qi 'not running' && exit
fullname=$(quodlibet --print-playing)
echo "$fullname" | grep -q 'Unknown Audio' && exit
echo "$fullname" | grep -q '[ابتثجحخدذرزسشصضطظعغفقكلمنهوي]' && ~/.config/polybar/scripts/arab-quodlibet-polybar.sh && exit

function isolate-fullname {
	# checks for a hyphen to ascertain if the song has a known artist
	songitself=$(printf "$1" | awk -F " - " '{print $2}' | awk -F '(' '{print $1}' | sed 's/\s*$//g')
	artistname=$(printf "$1" | awk -F " - " '{print $1}')
	# removes II, III, Jr, or Jr. from artist name, isolates surname, and finalizes structure
	songname=$(printf "$artistname" | awk -F " (Jr[.]*|II[I]*)" '{print $1}' | awk -F ' ' '{print $NF}')"'s "$songitself
}
function get-mov {
	movnum=""
	echo "$1" | grep -Gq "—" || return
	movnum=$(echo " [$(echo "$1" | awk -F " — " '{print $2}' | awk -F "." '{print $1}')]")
}

printf "$fullname" | grep -q ' - ' && isolate-fullname "$fullname" || songname="$fullname"
# checks for all categorizations (Op., BWV, B., Hob.), and then for movement #s
songname=$(echo "$songname" \
| awk -F ' —' '{print $1}' \
| awk -F ', [[:alnum:]]+[[:print:]]+[([:digit:]|N/A)]' '{print $1}')
get-mov "$fullname"; echo "$songname$movnum"

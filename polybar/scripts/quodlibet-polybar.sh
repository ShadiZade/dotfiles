#!/bin/bash
# location: ~/.config/polybar/scripts/

[[ -e "/tmp/brown-noise-pid" ]] && {
    echo "[BROWN NOISE]"
    exit
}
quodlibet --print-playing 2>&1 | grep -qi 'not running' && {
    echo ''
    exit
}
fullname=$(quodlibet --print-playing)
echo "$fullname" | grep -q 'Unknown Audio' && {
    echo '[UNKNOWN AUDIO]'
    exit
}
echo "$fullname" | grep -q '[ابتثجحخدذرزسشصضطظعغفقكلمنهوي]' && {
    if echo "$fullname" | grep -q ' - '
    then
	songitself=$(echo "$fullname" | awk -F " - " '{print $2}')
	artistname=$(echo "$fullname" | awk -F " - " '{print $1}')
	songname=$songitself" ل"$artistname
    else
	songname="$fullname"
    fi
    echo "$songname" | fribidi | awk '{gsub(/^\s+|\s+$/,"")} {print $0}'
    exit
}

function isolate-fullname {
	# checks for a hyphen to ascertain if the song has a known artist
	songitself=$(printf "$1" | awk -F " - " '{print $2}' | awk -F '(' '{print $1}' | sed 's/\s*$//g')
	artistname=$(printf "$1" | awk -F " - " '{print $1}')
	# removes II, III, Jr, or Jr. from artist name, isolates surname, and finalizes structure
	songname=$(printf "$artistname" | awk -F " (Jr[.]*|II[I]*)" '{print $1}' | awk -F ' ' '{print $NF}')"'s "$songitself
}
function get-movement {
	movnum=""
	echo "$1" | grep -Gq "—" || return
	movnum=$(echo " [$(echo "$1" | awk -F " — " '{print $2}' | awk -F "." '{print $1}')]")
}

printf "$fullname" | grep -q ' - ' && isolate-fullname "$fullname" || songname="$fullname"
# checks for all categorizations (Op., BWV, B., Hob.), and then for movement #s
songname=$(echo "$songname" \
| awk -F ' —' '{print $1}' \
| awk -F ', [[:alnum:]]+[[:print:]]+[([:digit:]|N/A)]' '{print $1}')
get-movement "$fullname"; echo "$songname$movnum"

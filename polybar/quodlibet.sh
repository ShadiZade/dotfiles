#!/bin/bash
# quodlibet outputs songs in this format: 
# 				[artist] - [song]
# and only the song name if there is no artist.
if [ "$(quodlibet --print-playing)" == "/ [untitled Unknown Audio File]" ]; then
	echo ""; exit
fi
function arabcheck() {
	quodlibet --print-playing | grep '[ابتثجحخدذرزسشصضطظعغفقكلمنهوي]'
}
if [ "$(arabcheck)" != "" ]; then
	~/Repositories/dotfiles/polybar/arab-quodlibet.sh; exit
fi
# checks for a hyphen to ascertain if the song has a known artist
arttest=$(quodlibet --print-playing | grep ' - ')
if [ "$arttest" == "" ]
	then
	songname=$(quodlibet --print-playing)
	else
	songitself=$(quodlibet --print-playing | awk -F " - " '{print $2}')
	artistname=$(quodlibet --print-playing | awk -F " - " '{print $1}')
	# removes II or Jr or Jr. from artist name, isolates surname, and finalizes structure
	songname=$(echo $artistname | awk -F " (Jr[.]*|II)" '{print $1}' | awk -F " " '{print $NF}')"'s "$songitself
fi
# checks for all categorizations (Op., BWV, B., Hob.), and then for movement #s
final=$(echo $songname \
| awk -F ',[[:space:]][[:alnum:]]+[[:print:]]+[([:digit:]|N/A)]' '{print $1}' \
| awk -F '-[[:space:]][IVX]+[[:space:]]' '{print $1}'\
)
echo $final


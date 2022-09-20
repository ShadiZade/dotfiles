#!/bin/bash
if [ "$(quodlibet --print-playing 2>&1 | grep 'not running')" != "" ]; then echo ""; exit; fi
if [ "$(quodlibet --print-playing | grep 'Unknown Audio')" != "" ]; then echo ""; exit; fi
if [ "$(quodlibet --print-playing | grep '[ابتثجحخدذرزسشصضطظعغفقكلمنهوي]')" != "" ]; then 
~/Repositories/dotfiles/polybar/arab-quodlibet-polybar.sh; exit; fi
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


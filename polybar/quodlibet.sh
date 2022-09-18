#!/bin/bash

# quodlibet outputs songs in this format: 
# 				[artist] - [song]
# and only the song name if there is no artist.

function separate-names() {

	songitself=$(quodlibet --print-playing | awk -F " - " '{print $2}')
	artistname=$(quodlibet --print-playing | awk -F " - " '{print $1}')
	# removes II or Jr or Jr. from artist name
	artistsur1=$(echo $artistname | awk -F " (Jr[.]*|II)" '{print $1}')
	artistsur2=$(echo $artistsur1 | awk -F " " '{print $NF}')
	songname=$artistsur2"'s "$songitself
	
}

if [ "$(quodlibet --print-playing)" == "/ [untitled Unknown Audio File]" ]; then
	echo ""; exit
fi

# checks for a hyphen to ascertain if the song has a known artist
arttest=$(quodlibet --print-playing | grep " - ")
if [ "$arttest" == "" ]
	then
	songname=$(quodlibet --print-playing)
	else
	separate-names
fi

# checks for all categorizations (Op., BWV, B., Hob.)
woop=$(echo $songname | awk -F ',[[:space:]][[:alnum:]]+[[:print:]]+[([:digit:]|N/A)]' '{print $1}')
# checks for movement numbers
womv=$(echo $woop | awk -F '-[[:space:]][IVX]+[[:space:]]' '{print $1}')

echo $womv


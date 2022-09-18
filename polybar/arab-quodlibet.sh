#!/bin/bash

arttest=$(quodlibet --print-playing | grep ' - ')
if [ "$arttest" == "" ]
	then
	songname=$(quodlibet --print-playing)
	else
	songitself=$(quodlibet --print-playing | awk -F " - " '{print $2}')
	artistname=$(quodlibet --print-playing | awk -F " - " '{print $1}')
	songname=$songitself" ل"$artistname
fi
echo $songname | fribidi

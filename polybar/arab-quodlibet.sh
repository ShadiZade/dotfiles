#!/bin/bash

	songitself=$(quodlibet --print-playing | awk -F " - " '{print $2}')
	artistname=$(quodlibet --print-playing | awk -F " - " '{print $1}')
	songname=$songitself" ل"$artistname
	echo $songname | fribidi

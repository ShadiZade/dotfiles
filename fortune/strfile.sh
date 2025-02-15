#!/bin/bash
source ~/Repositories/scripts/essential-functions

quote_groups=(marxism general)
for j in ${quote_groups[@]}
do
    echolor neonblue "——————————————————————————————————————————"
    echolor neonblue-orange "\t--> Doing ““$j””"
    echolor neonblue "——————————————————————————————————————————"
    strfile "$HOME"/Repositories/dotfiles/fortune/"$j" "$HOME"/Repositories/dotfiles/fortune/"$j".dat 
    grep --color=auto -is —— "$j"               \
	| awk -F ',' '{print $1}'               \
	| awk -F '(' '{print $1}'               \
	| sed 's/ *$//g;s/—— //g;s/ and /\n/g'  \
	| sort                                  \
	      > "$j".stats
    echolor neonblue "——————————————————————————————————————————"
    echolor neonblue "$(cat "$j".stats | uniq -c | sed 's/^ *//g' | sort -V)"
    echolor orange-neonblue ":: There are ““$(cat "$j".stats | uniq | wc -l)”” quotation authors."
done

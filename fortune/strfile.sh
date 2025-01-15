#!/bin/bash
source ~/Repositories/scripts/essential-functions

strfile "$HOME"/Repositories/dotfiles/fortune/marxism "$HOME"/Repositories/dotfiles/fortune/marxism.dat 
grep --color=auto -is —— marxism            \
    | awk -F ',' '{print $1}'               \
    | awk -F '(' '{print $1}'               \
    | sed 's/ *$//g;s/—— //g;s/ and /\n/g'  \
    | sort                                  \
	  > marxism.stats
echolor neonblue "——————————————————————————————————————————"
echolor neonblue "$(cat marxism.stats | uniq -c | sed 's/^ *//g' | sort -V)"
echolor orange-neonblue ":: There are ““$(cat marxism.stats | uniq | wc -l)”” quotation authors."

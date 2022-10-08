#!/bin/bash

# themes
bspwm_theme="frontier-blue"
#bspwm_theme="paprika-purple"

# colors
bspwm_basic_color_white="ffffff"
bspwm_basic_color_black="000000"
bspwm_basic_color_neutral_grey="888888"

bspwm_theme_color_paprika_purple="85132d"
bspwm_theme_color_dignified_beige="c48e5c"
bspwm_theme_color_frontier_blue="314664"
bspwm_theme_color_mountainside_redwhite="b89388"

# definitions
case $bspwm_theme in
			"paprika-purple")
				bspwm_theme_primary_color=$bspwm_theme_color_paprika_purple
				bspwm_theme_secondary_color=$bspwm_theme_color_dignified_beige
				;;
			"frontier-blue")
				bspwm_theme_primary_color=$bspwm_theme_color_frontier_blue
				bspwm_theme_secondary_color=$bspwm_theme_color_mountainside_redwhite
				;;
esac

#!/usr/bin/env bash

icon="$HOME/Pictures/lockScreen.png"
tmpbg='/tmp/screen.png'
# tmpbg="$HOME/Pictures/macbookBackground.jpg"

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
# the following two lines are for my 2 monitor display desktop
#convert "$tmpbg" "$icon" -gravity center -geometry -1000+0 -composite -matte "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -geometry +950+0 -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"

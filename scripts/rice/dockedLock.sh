#!/usr/bin/env bash

icon="$HOME/Pictures/lockScreen.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

rm "$tmpbg"
scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"

# Laptop Docked
convert "$tmpbg" "$icon" -gravity center -geometry -0-25 -composite -matte "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -geometry +1950-25 -composite -matte "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -geometry -1925-25 -composite -matte "$tmpbg"

i3lock -u -i "$tmpbg"

#!/usr/bin/env bash

icon="$HOME/Pictures/lockScreen.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

if [ -f $tmpbg ] ; then
    rm $tmpbg
fi

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"

# Laptop
# convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"

# Dual Monitor Desktop
convert "$tmpbg" "$icon" -gravity center -geometry -975-0 -composite -matte "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -geometry +1300-150 -composite -matte "$tmpbg"

i3lock -u -i "$tmpbg"

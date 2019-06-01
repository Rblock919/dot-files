#!/usr/bin/env bash

icon="$HOME/Pictures/lockScreen.png"
tmpbg='/tmp/screen.png'
# tmpbg="$HOME/Pictures/macbookBackground.jpg"

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"

#!/bin/sh
### Created by ilsenatorov
### Change WALLPAPERDIR to the directory where you store wallpapers

WALLPAPERDIR=~/Pictures/

if [ -z $@ ]
then
function get_themes()
{
    ls $WALLPAPERDIR
}
echo current; get_themes
else
    THEMES=$@
    if [ x"current" = x"${THEMES}" ]
    then
        exit 0
        #wal -i `cat ~/.cache/wal/wal` > /dev/null
    elif [ -n "${THEMES}" ]
    then
        #wal -o /home/ilya/dotfiles/colorchange.sh -i $WALLPAPERDIR${THEMES} > /dev/null
        wal -a 80 -i $WALLPAPERDIR${THEMES} > /dev/null
        cp $WALLPAPERDIR${THEMES} ~/Pictures/macbookBackground.jpg
        rm ~/.cache/thumbnails/neofetch/*
    fi
fi
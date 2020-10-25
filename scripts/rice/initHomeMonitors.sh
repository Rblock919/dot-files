#!/bin/bash

xrandr --auto

if xrandr --listactivemonitors | grep DP-1 > /dev/null && xrandr --listactivemonitors | grep HDMI-2 > /dev/null
then
  # echo "home monitor setup connected"
  xrandr --output HDMI-2 --right-of eDP-1
  xrandr --output DP-1 --right-of HDMI-2
fi

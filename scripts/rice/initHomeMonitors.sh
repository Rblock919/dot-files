#!/bin/bash

xrandr --auto

if xrandr --listactivemonitors | grep DP-1 > /dev/null && xrandr --listactivemonitors | grep HDMI-2 > /dev/null
then
  xrandr --output HDMI-2 --right-of eDP-1
  xrandr --output DP-1 --right-of HDMI-2
  cp /home/ryan/Scripts/rice/dockedLock.sh /home/ryan/Scripts/rice/lock.sh
else
  cp /home/ryan/Scripts/rice/laptopLock.sh /home/ryan/Scripts/rice/lock.sh
fi

nitrogen --restore


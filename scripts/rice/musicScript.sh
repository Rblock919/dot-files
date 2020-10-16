#!/bin/sh
SERVICE='mpd'
 
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
  if mpc status | grep playing > /dev/null
  then
    #echo " - $(mpc --format %title% current) by $(mpc --format %artist% current)  - "
    echo " - $(mpc --format %title% current) by $(mpc --format %artist% current) - "
  elif mpc status | grep paused > /dev/null
  then
    #echo " - $(mpc --format %title% current) by $(mpc --format %artist% current)  - "
    echo " - $(mpc --format %title% current) by $(mpc --format %artist% current) - "
  else
    echo ""
  fi
  else
    echo ""
fi


#!/bin/bash

if [[ "$(dunstctl is-paused)" == "false" ]]
then
  # Notifications are on
  echo ""
  # echo "notifications on"
else
  # Notifications are off
  echo ""
  # echo "notifications off"
fi

#!/bin/bash

if pgrep -x "redshift" > /dev/null
then
  pkill redshift
else
  redshift & > /dev/null
fi

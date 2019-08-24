#!/bin/bash
export DISPLAY=:0

while true; do
   sleep 1730
   xdotool key Return
   sleep 10
   xdotool key ctrl+r
   sleep 60
   hour=$(date +%H)
   minute=$(date +%M)
   if [ "$hour" -eq 5 -a "$minute" -le 29 ]; then
# restart the chromium browser by telling it to end cleanly
#      xdotool key ctrl+shift+q
      xdotool key alt+F4
   fi
done

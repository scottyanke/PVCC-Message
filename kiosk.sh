#!/bin/bash
# started by /etc/xdg/lxsession/LXDE-pi/autostart
export DISPLAY=:0
xset s noblank
xset s off
xset -dpms
export URL="https://docs.google.com/presentation/d/e/2PACX-1vRwstNuDtVQKKm9945G2tUsCrb_PeDczqVw5rn9l7tsUkgjLOZ0BjEf8vu9bj207I-wPfjlVE05YdqA/pub?start=true&loop=true&delayms=10000"
#unclutter -idle 0.5 -root
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences
# wait for the wifi connection to come up
sleep 10
#python /home/pi/stats.py &
/home/pi/refresh.sh &
while :
do
    /usr/bin/chromium-browser --netifs-to-ignore=eth0 --incognito --bwsi --no-sandbox --disable-translate --disable-cache --disk-cache-dir=/dev/null --noerrdialogs --disable-infobars --kiosk $URL
    sleep 10
    sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
    sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences
done

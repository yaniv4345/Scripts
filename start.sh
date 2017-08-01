#!/bin/bash
RUN=$1
if [[ $1 == 'start' ]];
then
export DISPLAY=:0.0 
sudo /usr/bin/X -nolock & 
sleep 1 
/usr/bin/chromium-browser --display=:0.0 --kiosk https://youtube.com/tv & echo $! /var/run/chromium.pid &
else
/bin/kill $(/bin/cat /var/run/chromium.pid) >& /dev/null
/bin/cat /dev/null >/var/run/chromium.pid
fi

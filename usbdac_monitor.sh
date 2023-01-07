#!/usr/bin/env bash

DEVICE=PMAA110

status=off
while true; do
  aplay -l | grep $DEVICE > /dev/null
  if [ $? -eq 0 ]; then
    if [ "$status" == "off" ]; then
      echo USB DAC appeared. Restarting TIDAL!
      sudo service ifi-streamer-tidal-connect restart
      sudo service tidal-speaker_controller restart
      status=on
    fi
  else
    status=off
  fi
  sleep 1
done

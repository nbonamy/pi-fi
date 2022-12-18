#!/usr/bin/env bash

# dependencies
apt install libncursesw5 screen

# speaker contol service
ln -sf /home/mnmt/pi-fi/tidal-speaker_controller.service /lib/systemd/system/

# enable on boot
systemctl enable tidal-speaker_controller.service

# start service and check on status
systemctl daemon-reload
systemctl start tidal-speaker_controller.service
systemctl status tidal-speaker_controller.service

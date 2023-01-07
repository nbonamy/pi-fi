#!/usr/bin/env bash

# overwrite with our stuff
ln -sf /home/mnmt/pi-fi/usbdac_monitor.service /lib/systemd/system/

# enable on boot
  systemctl enable usbdac_monitor.service

# start service and check on status
systemctl daemon-reload
systemctl start usbdac_monitor.service 
systemctl status usbdac_monitor.service

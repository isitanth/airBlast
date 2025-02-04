#!/bin/bash
# airblast.sh - Created by Anthony Chambet on 28/08/2024 - Licensed under the MIT License
# Description: Restarts Bluetooth, Wi-Fi, and the sharingd daemon in order to resolve boring issues with AirDrop.
# Copyright (c) 2024 Anthony Chambet
# How To : chmod+x username/path/to/airblast.sh
# Run the script and provide sudo password.
# AirDrop in peace :)
# Loads and starts the job as long as the job is not disabled.
# Usage of launchctl is needed in order to interface with launchd's data structures (like domains, services & endpoints, here we focuse on services)

while true; do
    sudo -v
    sleep 300 &
    wait $!
done &

echo "Restarting daemons..."

sudo killall -HUP mDNSResponder
sudo pkill sharingd
sudo pkill airportd
sudo purge
echo "Restarting Bluetooth..."
sudo pkill bluetoothd
echo "Restarting Wi-Fi..."
networksetup -setairportpower en0 off && networksetup -setairportpower en0 on
echo "Done"
exit 0
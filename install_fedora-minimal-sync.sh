#!/bin/bash

synology_cloud_station_drive_version=4.2.8-4421

# synology cloud station drive
# https://www.synology.com/en-global/support/download/VirtualDSM
sudo dnf -y localinstall https://global.download.synology.com/download/Tools/CloudStationDrive/${synology_cloud_station_drive_version}/Fedora/Installer/x86_64/synology-cloud-station-drive-${synology_cloud_station_drive_version}.x86_64.rpm


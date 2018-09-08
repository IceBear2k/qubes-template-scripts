#!/bin/bash

cryptomator_version=1.3.2
synology_cloud_station_drive_version=4.2.8-4421

# cryptomator
# https://cryptomator.org/downloads/
sudo dnf -y localinstall https://bintray.com/cryptomator/cryptomator-rpm/download_file?file_path=cryptomator-${cryptomator_version}-amd64.rpm

# synology cloud station drive
# https://www.synology.com/en-global/support/download/VirtualDSM
sudo dnf -y localinstall https://global.download.synology.com/download/Tools/CloudStationDrive/${synology_cloud_station_drive_version}/Fedora/Installer/x86_64/synology-cloud-station-drive-${synology_cloud_station_drive_version}.x86_64.rpm


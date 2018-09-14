#!/bin/bash

synology_cloud_station_drive_version=4.2.8-4421

# install packages
sudo dnf -y upgrade
sudo dnf -y install openssh-server syncthing
sudo dnf -y autoremove
sudo dnf -y clean packages

# synology cloud station drive
# https://www.synology.com/en-global/support/download/VirtualDSM
sudo dnf -y localinstall https://global.download.synology.com/download/Tools/CloudStationDrive/${synology_cloud_station_drive_version}/Fedora/Installer/x86_64/synology-cloud-station-drive-${synology_cloud_station_drive_version}.x86_64.rpm

# enable services
sudo systemctl enable sshd.service

# settings
sudo sed -i '/^PermitRootLogin/c\PermitRootLogin no' /etc/ssh/sshd_config
sudo sed -i '/^#PubkeyAuthentication/c\PubkeyAuthentication yes' /etc/ssh/sshd_config
sudo sed -i '/^PasswordAuthentication/c\PasswordAuthentication no' /etc/ssh/sshd_config


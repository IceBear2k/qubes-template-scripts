#!/bin/bash

cryptomator_version=1.3.2

# cryptomator
# https://cryptomator.org/downloads/
sudo dnf -y localinstall https://bintray.com/cryptomator/cryptomator-rpm/download_file?file_path=cryptomator-${cryptomator_version}-amd64.rpm

# install packages
sudo dnf -y upgrade
sudo dnf -y install keepassxc
sudo dnf -y autoremove
sudo dnf -y clean packages


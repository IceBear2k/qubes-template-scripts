#!/bin/bash

# install packages
sudo dnf -y upgrade
sudo dnf -y install firefox libreoffice thunderbird
sudo dnf -y autoremove
sudo dnf -y clean packages


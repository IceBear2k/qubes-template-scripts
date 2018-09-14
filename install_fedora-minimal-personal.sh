#!/bin/bash

# install packages
sudo dnf -y upgrade
sudo dnf -y install chromium libreoffice thunderbird
sudo dnf -y autoremove
sudo dnf -y clean packages


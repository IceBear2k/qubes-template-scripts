#!/bin/bash

# upgrade system
sudo dnf -y upgrade

# install essentials
sudo dnf -y install dejavu-sans-fonts dejavu-sans-mono-fonts dnf-plugins-core git openssh qubes-core-agent-networking terminator
sudo dnf -y autoremove
sudo dnf -y clean packages


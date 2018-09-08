#!/bin/bash

# upgrade system
sudo dnf -y upgrade

# install essentials
sudo dnf -y install dejavu-sans-fonts dejavu-sans-mono-fonts dnf-plugins-core qubes-core-agent-networking
sudo dnf -y autoremove
sudo dnf -y clean packages


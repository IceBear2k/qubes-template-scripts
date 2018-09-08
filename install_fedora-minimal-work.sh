#!/bin/bash

packer_version=1.2.5
terraform_version=0.11.8

# TODO: thefuck
# TODO: bundler
# TODO: intellij

# upgrade system
sudo dnf -y upgrade

# install dependencies
sudo dnf -y install dnf-plugins-core qubes-core-agent-networking

# docker
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\npgpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# install packages
sudo dnf -y upgrade
sudo dnf -y install code docker-ce firefox git terminator zsh
sudo dnf -y autoremove
sudo dnf -y clean packages

# terraform
sudo mkdir -p /opt/terraform/bin
curl -C - -o /tmp/terraform_${terraform_version}_linux_amd64.zip https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip
sudo unzip -of /tmp/terraform_${terraform_version}_linux_amd64.zip -d /opt/terraform/bin

# packer
sudo mkdir -p /opt/packer/bin
curl -C - -o /tmp/packer_${packer_version}_linux_amd64.zip https://releases.hashicorp.com/packer/${packer_version}/packer_${packer_version}_linux_amd64.zip
sudo unzip -of /tmp/packer_${packer_version}_linux_amd64.zip -d /opt/packer/bin

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
	git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions pull
fi
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions ]; then
	git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
else
	git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions pull
fi
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
	git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting pull
fi

# settings
sudo usermod -s /usr/bin/zsh user


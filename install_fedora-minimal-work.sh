#!/bin/bash

intellij_version=2018.2.3
packer_version=1.2.5
terraform_version=0.11.8
zsh_theme="bira"

# install dependencies and fedora repo packages
sudo dnf -y upgrade
sudo dnf -y install chromium dnf-plugins-core gcc git python3 python3-devel python3-pip rsync ruby rubygem-bundler zsh

# docker
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y update
sudo dnf -y install docker-ce

# code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\npgpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf -y update
sudo dnf -y install code

# terraform
sudo mkdir -p /opt/terraform/bin
curl -C - -o /tmp/terraform_${terraform_version}_linux_amd64.zip https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip
sudo unzip -o /tmp/terraform_${terraform_version}_linux_amd64.zip -d /opt/terraform/bin
sudo ln -sf /opt/terraform/bin/terraform /usr/bin/terraform

# packer
sudo mkdir -p /opt/packer/bin
curl -C - -o /tmp/packer_${packer_version}_linux_amd64.zip https://releases.hashicorp.com/packer/${packer_version}/packer_${packer_version}_linux_amd64.zip
sudo unzip -o /tmp/packer_${packer_version}_linux_amd64.zip -d /opt/packer/bin
sudo ln -sf /opt/packer/bin/packer /usr/bin/packer
sudo rm -f /usr/sbin/packer

# FIXME: oh-my-zsh currently locks up further installation due to opening zsh
# Open PR: https://github.com/robbyrussell/oh-my-zsh/pull/6547
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

# thefuck
sudo -H pip3 install thefuck
grep -q -F 'eval $(thefuck --alias)' ~/.zshrc || echo 'eval $(thefuck --alias)' >> ~/.zshrc

# intellij
sudo mkdir -p /opt/intellij
curl -C - -o /tmp/ideaIU-${intellij_version}.tar.gz https://download-cf.jetbrains.com/idea/ideaIU-${intellij_version}.tar.gz
sudo tar -xzf /tmp/ideaIU-${intellij_version}.tar.gz --strip-components=1 -C /opt/intellij
sudo ln -sf /opt/intellij/bin/idea.sh /usr/bin/idea.sh

# settings
sudo usermod -s /usr/bin/zsh user
sed -i "/^ZSH_THEME=/c\\ZSH_THEME=\"${zsh_theme}\"" ~/.zshrc
sudo rsync -a --delete ~/.zshrc /etc/skel
sudo rsync -a --delete ~/.oh-my-zsh /etc/skel

# cleanup
rm -f /tmp/*.tar.gz /tmp/*.zip
sudo dnf -y autoremove
sudo dnf -y clean packages


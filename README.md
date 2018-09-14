# qubes-template-scripts

Simple Bash scripts for Qubes OS TemplateVM installations

## Test locally on Docker

NOTE: Qubes repository is not added and results in failures for installation of Qubes specific packages.

`docker run -v ~/qubes-template-scripts/:/root/qubes-template-scripts -it fedora bash`

```bash
dnf -y install sudo
/root/qubes-template-scripts/install_fedora-minimal-work.sh
```

## Flavors

There are different TemplateVM flavors for different usage scenarios.

### Base

* [Git](https://git-scm.com/)
* [OpenSSH client](https://www.openssh.com/)
* Qubes networking
* [Terminator](https://gnometerminator.blogspot.com/)

### Personal

* [Chromium](https://www.chromium.org/Home)
* [LibreOffice](https://www.libreoffice.org/)
* [Thunderbird](https://www.thunderbird.net/)

### Sync

* [OpenSSH server](https://www.openssh.com/)
* [Synology Cloud Station Drive](https://www.synology.com/en-us/releaseNote/CloudStationDrive) (proprietary)

### Vault

* [Cryptomator](https://cryptomator.org/)
* [KeePassXC](https://keepassxc.org/)

### VPN

* [OpenVPN](https://openvpn.net/)

### Work

* [Chromium](https://www.chromium.org/Home)
* [Docker](https://www.docker.com/)
* [Git](https://git-scm.com/)
* [IntelliJ IDEA](https://www.jetbrains.com/idea/) (proprietary)
* [Oh-my-zsh](https://ohmyz.sh/)
* [Packer](https://www.packer.io/)
* [Python](https://www.python.org/)
* [Ruby](https://www.ruby-lang.org/)
* [Ruby Bundler](https://bundler.io/)
* [Terraform](https://www.terraform.io/)
* [The Fuck](https://github.com/nvbn/thefuck)
* [Visual Studio Code](https://code.visualstudio.com/)
* [ZSH](http://zsh.sourceforge.net/)

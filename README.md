# qubes-template-scripts

Simple Bash scripts for Qubes OS TemplateVM installations

## Test locally on Docker

NOTE: Qubes repository is not added and results in failures for installation of Qubes specific packages

`docker run -v ~/qubes-template-scripts/:/root/qubes-template-scripts -it fedora bash`

```
dnf -y install sudo
/root/qubes-template-scripts/install_fedora-minimal-work.sh
```


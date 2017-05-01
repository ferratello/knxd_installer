#!/bin/bash
# tinker OS didn't include dh-systemd
sudo apt install -y git-core build-essential dh-systemd cdbs libusb-1.0-0-dev libsystemd-dev libev-dev fakeroot libfmt3-dev
git clone https://github.com/knxd/knxd.git


# now build+install knxd itself
cd knxd
git checkout stable ## this branch
dpkg-buildpackage -b -uc
cd ..
sudo dpkg -i knxd_*.deb knxd-tools_*.deb

#!/bin/bash
# raspbian didn't include dh-systemd
sudo apt-get install git-core build-essential dh-systemd
git clone https://github.com/knxd/knxd.git

# knxd requires libpthsem which unfortunately isn't part of Debian
wget https://www.auto.tuwien.ac.at/~mkoegler/pth/pthsem_2.0.8.tar.gz
tar xzf pthsem_2.0.8.tar.gz
cd pthsem-2.0.8
dpkg-buildpackage -b -uc
cd ..
sudo dpkg -i libpthsem*.deb

# now build+install knxd itself
cd knxd
git checkout stable ## this branch
dpkg-buildpackage -b -uc
cd ..
sudo dpkg -i knxd_*.deb knxd-tools_*.deb

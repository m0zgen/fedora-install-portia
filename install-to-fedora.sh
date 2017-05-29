#!/bin/bash

# Usage
# ./portia.py 192.168.0.0/24 -d domain -u user -p userPass -M passwords

# If Fedora server uncomment this
# wget https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-25.noarch.rpm
# wget https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-25.noarch.rpm

dnf install git libesedb sysconftool automake gettext-devel python-devel libtool install gcc gcc-c++ kernel-devel libxslt-devel libffi-devel openssl-devel patch redhat-rpm-config

pip install virtualenv
pip install --upgrade pip

virtualenv -p python2 portia

source portia/bin/activate


cd portia

git clone https://github.com/CoreSecurity/impacket && cd impacket
python setup.py install
cd ..

git clone https://github.com/csababarta/ntdsxtract && cd ntdsxtract
python setup.py install
cd ..


git clone https://github.com/milo2012/portia.git && cd portia
./portia.py

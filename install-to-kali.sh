#!/bin/sh

echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

apt-get update && apt-get dist-upgrade && apt-get autoremove && apt-get autoclean
apt-get install -y autoconf automake autopoint libtool pkg-config build-essential libssl-dev libffi-dev python-dev

pip install virtualenv

virtualenv -p python2 portia
source portia/bin/activate
pip install pysmb tabulate termcolor xmltodict pyasn1 pycrypto pyOpenSSL dnspython netaddr

cd portia/

git clone https://github.com/CoreSecurity/impacket && cd impacket
python setup.py install

cd ../
git clone https://github.com/libyal/libesedb.git && cd libesedb
./synclibs.sh
./autogen.sh

cd ../
git clone https://github.com/csababarta/ntdsxtract && cd ntdsxtract
python setup.py install

cd ../
git clone https://github.com/milo2012/portia.git && cd portia
./portia.py

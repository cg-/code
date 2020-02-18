#!/bin/bash
echo "Installing dependencies."
apt update
apt install -y wget tar automake build-essential libtool byacc flex vim

wget https://github.com/filebench/filebench/archive/1.4.9.1.tar.gz -O /tmp/fb.tar.gz
tar -zxvf /tmp/fb.tar.gz -C /opt

wget http://www.coker.com.au/bonnie++/bonnie++-1.03e.tgz -O /tmp/bonnie.tgz
tar -zxvf /tmp/bonnie.tgz -C /opt

wget http://www.iozone.org/src/current/iozone3_457.tar -O /tmp/iozone.tar
tar -xvf /tmp/iozone.tar -C /opt

# Install filebench
cd /opt/filebench-1.4.9.1 && libtoolize && aclocal && autoheader && automake --add-missing && autoconf && ./configure && make && make install
rm -rf /opt/filebench-1.4.9.1
rm /tmp/fb.tar.gz

# Install bonnie++
cd /opt/bonnie++-1.03e && ./configure && make && make install
rm /tmp/bonnie.tgz
rm -rf bonnie++-1.03e

cd /opt/iozone3_457/src/current && make linux-AMD64 && mv iozone /usr/local/bin/iozone

rm -rf /opt/iozone3_457
rm /tmp/iozone.tar


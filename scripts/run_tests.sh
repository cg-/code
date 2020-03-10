#!/bin/bash

filebench -f /opt/fb_scripts/fileserver.f 1>/results/docker-$TESTNO.fb_fileserver 2>/results/docker-$TESTNO.fb_fileserver-err
filebench -f /opt/fb_scripts/varmail.f 1>/results/docker-$TESTNO.fb_varmail 2>/results/docker-$TESTNO.fb_varmail-err
filebench -f /opt/fb_scripts/webproxy.f 1>/results/docker-$TESTNO.fb_webproxy 2>/results/docker-$TESTNO.fb_webproxy-err
filebench -f /opt/fb_scripts/webserver.f 1>/results/docker-$TESTNO.fb_webserver 2>/results/docker-$TESTNO.fb_webserver-err

iozone -a -s 16 -f /test/iozone 1>/results/docker-$TESTNO.iozone-16k 2>/results/docker-$TESTNO.iozone-16k-err
iozone -a -s 64 -f /test/iozone 1>/results/docker-$TESTNO.iozone-64k 2>/results/docker-$TESTNO.iozone-64k-err
iozone -a -s 512 -f /test/iozone 1>/results/docker-$TESTNO.iozone-512k 2>/results/docker-$TESTNO.iozone-512k-err
iozone -a -s 1024 -f /test/iozone 1>/results/docker-$TESTNO.iozone-1024k 2>/results/docker-$TESTNO.iozone-1024k-err

bonnie++ -d /test -s 16M -n 0 -m test -f -b -u root 1>/results/docker-$TESTNO.bonnie 2>/results/docker-$TESTNO.bonnie-err


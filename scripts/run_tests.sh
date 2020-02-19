#!/bin/bash

mkdir -p /results/$TESTNO
filebench -f /opt/fb_scripts/fileserver.f 1>/results/$TESTNO/fb_fileserver.out 2>/results/$TESTNO/fb_fileserver.err
filebench -f /opt/fb_scripts/varmail.f 1>/results/$TESTNO/fb_varmail.out 2>/results/$TESTNO/fb_varmail.err
filebench -f /opt/fb_scripts/webproxy.f 1>/results/$TESTNO/fb_webproxy.out 2>/results/$TESTNO/fb_webproxy.err
filebench -f /opt/fb_scripts/webserver.f 1>/results/$TESTNO/fb_webserver.out 2>/results/$TESTNO/fb_webserver.err

iozone -a -s 16 -b /results/$TESTNO/iozone-16k.xls -f /test/iozone 1>/results/$TESTNO/iozone-16k.out 2>/results/$TESTNO/iozone-16k.err
iozone -a -s 64 -b /results/$TESTNO/iozone-64k.xls -f /test/iozone 1>/results/$TESTNO/iozone-64k.out 2>/results/$TESTNO/iozone-64k.err
iozone -a -s 512 -b /results/$TESTNO/iozone-512k.xls -f /test/iozone 1>/results/$TESTNO/iozone-512k.out 2>/results/$TESTNO/iozone-512k.err
iozone -a -s 1024 -b /results/$TESTNO/iozone-1024k.xls -f /test/iozone 1>/results/$TESTNO/iozone-1024k.out 2>/results/$TESTNO/iozone-1024k.err

bonnie++ -d /test -s 16M -n 0 -m test -f -b -u root 1>/results/$TESTNO/bonnie.out 2>/results/$TESTNO/bonnie.err


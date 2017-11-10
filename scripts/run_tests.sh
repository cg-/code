#!/bin/bash

#filebench -f /opt/fb_scripts/fileserver.f 1>/results/fb_fileserver.out 2>/results/fb_fileserver.err
#filebench -f /opt/fb_scripts/varmail.f 1>/results/fb_varmail.out 2>/results/fb_varmail.err
#filebench -f /opt/fb_scripts/webproxy.f 1>/results/fb_webproxy.out 2>/results/fb_webproxy.err
#filebench -f /opt/fb_scripts/webserver.f 1>/results/fb_webserver.out 2>/results/fb_webserver.err

iozone -a -s 16 -b /results/iozone-16k.xls -f /test/iozone 1>/results/iozone-16k.out 2>/results/iozone-16k.err
iozone -a -s 64 -b /results/iozone-64k.xls -f /test/iozone 1>/results/iozone-64k.out 2>/results/iozone-64k.err
iozone -a -s 512 -b /results/iozone-512k.xls -f /test/iozone 1>/results/iozone-512k.out 2>/results/iozone-512k.err
iozone -a -s 1024 -b /results/iozone-1024k.xls -f /test/iozone 1>/results/iozone-1024k.out 2>/results/iozone-1024k.err

#bonnie++ -d /test -s 16M -n 0 -m test -f -b -u root 1>/results/bonnie.out 2>/results/bonnie.err

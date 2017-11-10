#!/bin/bash

filebench -f /opt/fb_scripts/fileserver.f 1>/results/fb_fileserver.out 2>/results/fb_fileserver.err
filebench -f /opt/fb_scripts/varmail.f 1>/results/fb_varmail.out 2>/results/fb_varmail.err
filebench -f /opt/fb_scripts/webproxy.f 1>/results/fb_webproxy.out 2>/results/fb_webproxy.err
filebench -f /opt/fb_scripts/webserver.f 1>/results/fb_webserver.out 2>/results/fb_webserver.err

iozone -l 1 -u 1 -F /test/iozone -a -b /results/iozone.xls 1>/results/iozone.out 2>/results/iozone.err

bonnie++ -d /test -s 130G -n 0 -m test -f -b
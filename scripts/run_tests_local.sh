#!/bin/bash
mkdir -p /results/$TESTNO_C
mkdir -p /test/$TESTNO_C
mkdir -p /opt/fb_scripts/$TESTNO_C
for test in fileserver varmail webproxy webserver
do
	echo set \$dir=/test/$TESTNO_C > /opt/fb_scripts/$TESTNO_C/$test.f
	cat /opt/fb_scripts/$test.f >> /opt/fb_scripts/$TESTNO_C/$test.f
done

for test in fileserver varmail webproxy webserver
do
	filebench -f /opt/fb_scripts/$TESTNO_C/$test.f 1>/results/$TESTNO_C/fb_$test.out 2>/results/$TESTNO_C/fb_$test.err
done

iozone -a -s 16 -b /results/$TESTNO_C/iozone-16k.xls -f /test/$TESTNO_C/iozone 1>/results/$TESTNO_C/iozone-16k.out 2>/results/$TESTNO_C/iozone-16k.err
iozone -a -s 64 -b /results/$TESTNO_C/iozone-64k.xls -f /test/$TESTNO_C/iozone 1>/results/$TESTNO_C/iozone-64k.out 2>/results/$TESTNO_C/iozone-64k.err
iozone -a -s 512 -b /results/$TESTNO_C/iozone-512k.xls -f /test/$TESTNO_C/iozone 1>/results/$TESTNO_C/iozone-512k.out 2>/results/$TESTNO_C/iozone-512k.err
iozone -a -s 1024 -b /results/$TESTNO_C/iozone-1024k.xls -f /test/$TESTNO_C/iozone 1>/results/$TESTNO_C/iozone-1024k.out 2>/results/$TESTNO_C/iozone-1024k.err

bonnie++ -d /test/$TESTNO_C -s 16M -n 0 -m test -f -b -u root 1>/results/$TESTNO_C/bonnie.out 2>/results/$TESTNO_C/bonnie.err

rm -rf /opt/fb_scripts/$TESTNO_C

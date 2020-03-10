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
	filebench -f /opt/fb_scripts/$TESTNO_C/$test.f 1>/results/TESTNO_C.fb_$test 2>/results/TESTNO_C.fb_$test-err
done

iozone -a -s 16 -f /test/$TESTNO_C/iozone 1>/results/$TESTNO_C.iozone-16k 2>/results/$TESTNO_C.iozone-16k-err
iozone -a -s 64 -f /test/$TESTNO_C/iozone 1>/results/$TESTNO_C.iozone-64k 2>/results/$TESTNO_C.iozone-64k-err
iozone -a -s 512 -f /test/$TESTNO_C/iozone 1>/results/$TESTNO_C.iozone-512k 2>/results/$TESTNO_C.iozone-512k-err
iozone -a -s 1024 -f /test/$TESTNO_C/iozone 1>/results/$TESTNO_C.iozone-1024k 2>/results/$TESTNO_C.iozone-1024k-err

bonnie++ -d /test/$TESTNO_C -s 16M -n 0 -m test -f -b -u root 1>/results/$TESTNO_C/bonnie.out 2>/results/$TESTNO_C/bonnie_err

rm -rf /opt/fb_scripts/$TESTNO_C

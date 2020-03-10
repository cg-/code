#!/bin/bash
TESTNAME=docker1
export TESTNAME=docker1

for i in 1 2 4 8 16 32 64
do
	for j in $(seq 1 $i)
	do
		echo Launched $i-$j
		mkdir /tmp/$i-$j
		docker run -v /tmp/$i-$j:/test -v /opt/test/results:/results --rm -e TESTNO=$i-$j -e TESTNAME=$TESTNAME --name test$i-$j mine &
		pids[${j}]=$!
	done

	for j in $(seq 1 $i)
	do
		wait $pid
	done

	for j in $(seq 1 $i)
	do
		echo Finished $i-$j
		rm -rf /tmp/$i-$j
	done

	tar -zcvf $TESTNAME-results-$i.tgz results/*
	scp -o "StrictHostKeyChecking=no" $TESTNAME-results-$i.tgz cgrim@ssh.soe.ucsc.edu:~/results/
done


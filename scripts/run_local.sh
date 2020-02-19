#!/bin/bash
for i in 1 2 4 8
do
	for j in $(seq 1 $i)
	do
		echo Launched $i-$j
		TESTNO_C=$i-$j
		export TESTNO_C=$i-$j
		mkdir /test/$i-$j
		bash /opt/test/scripts/run_tests_local.sh &
		pids[${j}]=$!
	done

	for j in $(seq 1 $i)
	do
		wait $pid
	done

	for j in $(seq 1 $i)
	do
		rm -rf /test/$i-$j
	done
	tar -zcvf $(hostname)-results-$i.tgz /results/*
	scp -o "StrictHostKeyChecking=no" $(hostname)-results-$i.tgz cgrim@ssh.soe.ucsc.edu:~/results/
done

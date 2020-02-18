#!/bin/bash
for i in 1 2 4 8 16 32 64
do
	for j in $(seq 1 $i)
	do
		echo Launched $i-$j > /opt/test/results/$j
		#docker run -v /tmp:/test -v /opt/test/results:/results --rm -e TESTNO=$i-$j --name test$i-$j mine &
		pids[${j}]=$!
	done

	for j in $(seq 1 $i)
	do
		wait $pid
	done
	tar -zcvf $(hostname)-results-$i.tgz results/*
	scp -o "StrictHostKeyChecking=no" $(hostname)-results-$i.tgz cgrim@ssh.soe.ucsc.edu:~/results/
done


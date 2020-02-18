#!/bin/bash
for i in 1 2 4 6 8 16 32 64
do
	for j in $(seq 1 $i)
	do
		echo TESTNO=$i-$j
		docker run -v /tmp:/test -v /home/cg/code/results:/results --rm -e TESTNO=$i-$j --name test$i-$j hello-world &
		pids[${j}]=$!
	done

	for j in $(seq 1 $i)
	do
		wait $pid
	done
done

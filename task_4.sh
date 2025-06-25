#!/bin/bash
for i in {1..3}; do
	while true; do
		echo "Nomer $i: $(expr $i \* $i)" > /dev/null
	done &
	pids[$i]=$!
done

renice -n 10 -p ${pids[1]}
kill ${pids[3]}
top

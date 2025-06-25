#!/bin/bash
pipe="/tmp/calc_pipe"
while true; do
	read -r input
	echo "$input" > "$pipe"
	if [[ "$input" == "QUIT" ]]; then
		exit 0
	fi
done

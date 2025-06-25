#!/bin/bash
result=1
handle_usr1() {
	value=$((result + 2))
}
handle_usr2() {
	value=$((result * 2))
}
handle_term() {
	exit 0
}
trap 'handle_usr1' USR1
trap 'handle_usr2' USR2
trap 'handle_term' SIGTERM
echo $$ > handler.pid
while true; do
	echo "NICE: $result"
	sleep 1
done

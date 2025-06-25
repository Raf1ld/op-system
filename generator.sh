#!/bin/bash
if [ ! -f "handler.pid" ]; then
	echo "Pu pu pu..."
	exit 1
fi
handler_pid=$(cat handler.pid)
if  ! kill -0 "$handler_pid" 2>/dev/null; then
	echo "Nu startani handler, geniy"
	exit 1
fi
while read -r line; do
	case "$line" in
		"+")
			echo "USR1"
			kill -USR1 "$handler_pid"
			;;
		"*")
			echo "USR2"
			kill -USR2 "$handler_pid"
			;;
		"TEMP")
			echo "SIGTERM"
			kill -SIGRERM "$handler_pid"
			rm -f handler.pid
			exit 0
			;;
		*)
			;;
	esac
done

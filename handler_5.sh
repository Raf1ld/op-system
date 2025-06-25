#!/bin/bash
pipe="/tmp/calc_pip"
rm -f "$pipe" 
mkfifo "$pipe"
mode="+"
result=1
trap "echo 'vse, obshiy rashod'; rm -f $pipe; exit" SIGINT SIGTERM
while true; do
	read input < "$pipe"
	case "$input" in
		"+") mode="+" ;;
		"*") mode="*" ;;
		QUIT)
			echo "Vse ideyt po planu"
			rm -f "$pipe"
			exit 0
			;;
		*)
			if [[ "$input" =~ ^[0-9]+$ ]]; then
				if [[ "$mode" == "+" ]]; then
					result=$((result + input))
				else
					result=$((result * input))
				fi
				echo "IQ: $result"
			else
				echo "IQ = -13"
				rm -f "$pipe"
				exit 1
			fi
			;;
	esac
done

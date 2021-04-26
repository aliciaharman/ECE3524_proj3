#!/bin/bash

sub_menu () {
	printf "(please enter the number of your selection below)\n\n"
	printf "1. Show all processes\n"
	printf "2. Kill a process\n"
	printf "3. Bring up to top\n"
	printf "4. Return to Main Menu\n\n"
	read sub_choice
}


while :
do
	sub_menu
	if [ $sub_choice -eq 4 ] 
	then
		break

	elif [ $sub_choice -eq 1 ]
	then
		ps aux | less

	elif [ $sub_choice -eq 2 ]
	then
		echo "Please enter the PID of the process you would like to kill:"
		read kill_pid
		kill $kill_pid

	elif [ $sub_choice -eq 3 ]
	then
		top

	else
		echo "error: enter 1 - 4"
	fi
done


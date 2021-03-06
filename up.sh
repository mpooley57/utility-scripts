#!/bin/bash
#
# Enables easy movement back "up" a directory tree
# 
# Usage: . up.sh [n] 
#	This file must be SOURCED, i.e. use:
#		$ . up.sh
#	. up.sh -> moves up one directory level
#	. up.sh n -> moves up n directories
#	(NB: there is a ". " before the executable filename)
#	For convinience, consider placing a suitable alias in .bash_profile e.g.: alias up=". up.sh"
#	If symbolic link up --> up.sh is used then the alias can be: alias up=". up"
#
# EXAMPLES:
#	If $PWD=~/<Directory>/<subDirectory> then
#		. up.sh -> moves to ~/<Directory>
#		. up.sh 2 -> moves to ~/
	if [ -z "$1" ]; then # if argument is empty string or null
		cd .. # always move up at least one directory, even if no argument is passed
	elif [[ "$1" =~ ^[0-9]+$ ]]; then # check first input argument is a positive integer
		if [ "$1" -gt 1 ]; then # check if first input is positive
			if [ $# -gt 1 ]; then # check for too many arguments and alert if appropriate (only the 1st argument is used)
				echo "~~~~~~~~~~ up: INPUT ERROR ~~~~~~~~~~"
				echo "Usage: . up.sh [n]"
				echo Warning: Too many arguments - $# arguments detected, those after 1st have been ignored
				echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			fi
			for ((  i = 0 ;  i < $1;  i++  )) # move up by the passed number of directory levels
			do
				cd ..
			done
		fi
	else 
		echo "~~~~~~~~~~ up: INPUT ERROR ~~~~~~~~~~"
		echo "Usage: . up.sh [n]"
		echo Input [n] must be a positive integer
		echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"		
	fi

#!/bin/bash
#Remove extra spaces from the provided file 
#Writes the result to standard output

if test $# -eq 1
then
	if test -e $1; then
	cat $1 | while read line
		do
		test -n "$line" && echo $line
	done
	else
		echo "Your file does not exist"
		exit 1
	fi
else
	echo "Incorrect syntax, please provide a filename"
	echo "$0 FILENAME"
	exit 1
fi


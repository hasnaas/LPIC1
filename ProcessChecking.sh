#!/bin/bash
#an alternative to hostid
show_help(){
	echo "Program that checks wether a process is running at specified intervals, 5s by defaults"
	echo "$0 [-i seconds] PID"
}

interval=5
OPTIND=1         # Reset in case getopts has been used previously in the shell

#In case nor arguments are privided
if test -z "$*"
then
	show_help
	exit 1
fi

#parsing options. option followed by a ':' expects an argument
while getopts "hi:" opt; do
    case "$opt" in
    h)
        show_help
        exit 0
        ;;
    i)  
	interval=$OPTARG
        ;;
#    *)  echo "$opt is an invalid option"
#        ;;
    esac
done

shift $(($OPTIND-1))
r=$(ps | grep $1)
while test  "$r"
do
	echo "process $1 is running"
	sleep $interval
	r=$(ps | grep "$1" )
done
echo "process $1 is not running"

exit 0


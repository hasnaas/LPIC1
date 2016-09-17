#!/bin/bash
#This sript provides a backward listing of itself

nbline=$(wc -l $0 | awk '{ print $1}')
i=1
until test $i -gt $nbline
do
	tail -n $i $0 | head -n 1
	let i=i+1
done


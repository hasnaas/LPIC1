#!/bin/bash
echo "This script generates 5 different random numbers in the range [1-50]"
RANDOM=$(free | head -n 2 | tail -n 1 | awk '{ print $3}')
declare -a liste
gtime=$(date)

pResults(){

echo "Liste generated on $gtime"
for i in {0..4}
do
	echo ${liste[i]}
done
	
}


i=0
while test $i -lt 5
do
d=0   #duplicate detector 
v=$RANDOM
let v=v%50
let v=v+1

for((j=0;j<=$i;j++))
do
	if test "$v" == "${liste[$j]}"
	then
	let i=i-1
	d=1
	break
	fi
done
test $d -eq 0 && liste[$i]=$v
let i=i+1
done
echo "Numbers generated "
read -p  "Do you want to save them in a file (Y/n)? : " 
if test $REPLY == "Y"
then 
	pResults > rand1-50
	echo "Results saved to :"
	ls rand1-50
else
	pResults
fi


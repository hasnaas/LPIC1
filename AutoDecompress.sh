#!/bin/bash
#automatically uncompress the files provided as arguments

if test -z "$*"
then
	echo "provide some arguments please"
	echo "$0 FILE1 FILE2 ..."
	exit 1
fi

#declare an associative array for decompression programs to use
declare -A progtab
progtab["Zip"]="unzip"
progtab["bzip2"]="bunzip2"
progtab["gzip"]="gunzip"
progtab["compress'd"]="uncompress.real"

for f in $*
do
	#echo "processing $f  .."; echo
	if [ ! -e $f ]; then echo "$f does not exist"; exit 1; fi
	atype=$(file $f | awk '{print $2}' |egrep -i "compress|zip")
	echo $atype
	if [ -z "$atype" ]
		then echo "$f is not a compressed file"
		else
		acommand=$(echo ${progtab[$(echo $atype)]})
		#the following tells unzip to extract in the same directory as the source file, not necessarily the current one, which is the 			#default behavior
		if test $acommand == "unzip"; then acommand=$acommand" -d $(dirname $f)"; fi 
		echo "$acommand $f "| bash
	fi
done
exit 0

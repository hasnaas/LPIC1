#!/bin/bash
rm -f HomeDirecoryListing.gz 2>/dev/null
echo "This script recursively lists the content of user's home directory and saves the output to a file."
echo "Listing ..."
ls -lR ~/ > HomeDirecoryListing 2>/dev/null && gzip HomeDirecoryListing 
if test $? -eq 0
	then
	zenity --title="backup media" --info --text="Please insert a USB drive then press OK"
	save=$(df -t vfat 2>/dev/null| grep ^/ | awk '{ print $6}'| head -1)
	if test -z $save
		then
		echo "No USB drive detected"
		exit 1
	fi
	mv HomeDirecoryListing.gz $save/
	test $? -eq 0 && echo "Archive correctly saved to the first USB drive"
else
	echo "error performing the listing"
	exit 1
fi


#!/bin/bash
# Listing the planets.

declare -a pList #declare an array variable
i=0
for planet in Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto
do
  pList[$i]=$planet  # Each planet on a separate line.
  ((i++))
done

i=0
while test $i -lt ${#pList[*]}  #denotes the length of an array
do
  echo ${pList[$i]}
  ((i++))
done

echo; echo

echo; echo "Whoops! Pluto is no longer a planet!"

exit 0

#!/bin/bash

itemType=Baby

rm temp* 2> /dev/null
awk -F "\"*,\"*" '{print $3 "," $6, "," $14}' records.csv >> temp
cat temp | grep $itemType >> temp2

for str in '2010' '2011' '2012' '2013' '2014' '2015' '2016' '2017'; do
	awk -v str="$str" -F "\"*,\"*" '
	$2 ~ str {sum += $3} END {printf "%.12f\n", sum}
	' temp2 >> $itemType.csv
done
rm temp*

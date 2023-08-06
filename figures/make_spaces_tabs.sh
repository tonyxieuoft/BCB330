#! /usr/bin/sh

file=$1

while read line || test -n "$line"
do
	part1=$(echo $line | cut -d " " -f 1)
	part2=$(echo $line | cut -d " " -f 2)
	part3=$(echo $line | cut -d " " -f 3)
	echo "$part1	$part2	$part3" >> ${file}_tabbed

done < $file

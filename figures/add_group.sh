#! /usr/bin/sh

file=$1
group=$2

while read line || test -n "$line"
do
	echo "$line	$group"
done < $file

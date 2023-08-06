#! /usr/bin/sh

file=$1
size=$2

rm cleaned_GO/$file 2> /dev/null

echo "GO_annotation	percentage	FDR	log_FDR" > cleaned_GO/$file

while read line || test -n "$line"
do
	GO_annotation=$(echo "$line" | cut -d "	" -f 1)
	occurrences=$(echo "$line" | cut -d "	" -f 3)
	FDR=$(echo "$line" | cut -d "	" -f 8)

	percentage=$(echo "scale = 10; $occurrences * 100 / $size" | bc)
	echo $percentage
	# neg_log_FDR=$(echo "scale = 30; l(1/($FDR)) / l(10)" | bc -l)
	echo $neg_log_FDR
	echo "$GO_annotation	$percentage	$FDR" >> cleaned_GO/$file
done < $file

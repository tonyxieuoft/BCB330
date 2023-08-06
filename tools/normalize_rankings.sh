#! /usr/bin/sh

num_genes=$1
file_to_normalize=$2
total_arabidopsis_genes=27416

rm ../normalized_specificity_rankings/$file_to_normalize 2> /dev/null

while read line || test -n "$line"
do
	spec=$(echo $line | cut -d " " -f 1)
	agi=$(echo $line | cut -d " " -f 2)
	name=$(echo $line | cut -d " " -f 3)

	normalized_spec=$(echo "scale = 3; $spec * $total_arabidopsis_genes / $num_genes" | bc)
	echo "$normalized_spec $agi $name" >> ../normalized_specificity_rankings/$file_to_normalize

done < ../TF_specificity_rankings/$file_to_normalize

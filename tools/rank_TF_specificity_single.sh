#! /usr/bin/sh

group=$1

rm ../TF_specificity_rankings/$group 2> /dev/null

cd ../DE_gene_matches/$group

for file in *
do
	DE_genes=$(tail -n 2 "$file" | head -n 1)
	total_genes=$(tail -n 1 "$file")
	ratio=$(echo "scale = 6; $DE_genes / $total_genes" | bc)
	echo $ratio $file >> ../../TF_specificity_rankings/$group
done

cd ../../TF_specificity_rankings

sort -r -o $group $group

finished_moving_zeroes=0

while test $finished_moving_zeroes -eq 0
do
	first_line=$(head -n 1 $group)
	if test $(echo "$first_line" | cut -d " " -f 1) = 0
	then
		echo "$first_line" >> $group
		sed -i '1d' $group
	else
		finished_moving_zeroes=1
	fi
done






#! /usr/bin/sh

# ======== Objective =========
# Calculates the raw, unnormalized specificities for each TF in a folder contained
# in DE_gene_matches as specified by "$group", then appends it as a line in a new file.
# This file is sorted (and therefore ranked) by specificity. The built-in sorting sorts 
# whole numbers differently from decimals, is accounted for in a loop at the end of the
# file
#
# ======== Arguments =========
# group: The folder containing the TFs whose specificities it is to rank
#
# ======== Folders ===========
# Input: DE_gene_matches
# Ouput: TF_specificity_rankings


group=$1

rm ../TF_specificity_rankings/$group 2> /dev/null

cd ../DE_gene_matches/$group

# Calculates the raw specificities
for file in *
do
	DE_genes=$(tail -n 2 "$file" | head -n 1)
	total_genes=$(tail -n 1 "$file")
	ratio=$(echo "scale = 6; $DE_genes / $total_genes" | bc)
	echo $ratio $file >> ../../TF_specificity_rankings/$group
done

cd ../../TF_specificity_rankings

# sorts the file
sort -r -o $group $group

finished_moving_zeroes=0

# moves the zeroes in such a way that the file is "actually" sorted
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






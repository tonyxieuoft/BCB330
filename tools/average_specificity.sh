#! /usr/bin/sh

cd ../DE_gene_matches

for directory in *
do
	cd $directory

	sum=0
	
	for file in *
	do
		DE_genes=$(tail -n 2 "$file" | head -n 1)
		total_genes=$(tail -n 1 "$file")
		sum=$(echo "scale = 6; $DE_genes / $total_genes + $sum" | bc)
	done

	total_files=$(expr $(ls -l | wc -l) - 1)
	average=$(echo "scale = 8; $sum / $total_files" | bc)
	echo "$average	$directory"


	cd ..
done





#! /usr/bin/sh

# this will match DE genes to all of the folders in categorized_dap_files

cd ../categorized_dap_files

for directory in *
do
	rm -r ../DE_gene_matches/$directory 2> /dev/null
	mkdir ../DE_gene_matches/$directory

	cd $directory

	for file in *
	do
		../../tools/DE_gene_matcher ../../DE_genes.txt "$file" > ../../DE_gene_matches/${directory}/"$file"
	done

	cd ..
	echo "finished $directory"

done



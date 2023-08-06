#! /usr/bin/sh

# this will match DE genes to all of the folders in categorized_dap_files

gene_profile=$1

cd ../cleaned_dap_files

rm -r ../DE_gene_matches/$gene_profile 2> /dev/null
mkdir ../DE_gene_matches/$gene_profile


for file in *
do
	../tools/DE_gene_matcher ../control_genes/"$gene_profile" "$file" > ../DE_gene_matches/${gene_profile}/"$file"
done



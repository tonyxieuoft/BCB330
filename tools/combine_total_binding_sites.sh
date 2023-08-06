#! /usr/bin/sh

mkdir ../DAP_stats
cd ../DE_gene_matches
cd all

for file in *
do
	tail -n 1 "$file" >> ../../DAP_stats/combine_total_binding_sites
done

rm ../../DAP_stats

#! /usr/bin/sh

rm ../DAP_stats/combine_total_binding_sites 2> /dev/null
cd ../DE_gene_matches
cd phospho_network_in

for file in *
do
	tail -n 1 "$file" >> ../../DAP_stats/combine_total_binding_sites
done

cd ../phospho_network_out

for file in *
do
	tail -n 1 "$file" >> ../../DAP_stats/combine_total_binding_sites
done

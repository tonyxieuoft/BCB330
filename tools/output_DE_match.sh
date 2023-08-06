#! /usr/bin/sh

cd ../DE_gene_matches/ZAT10_ChIP

for file in *
do
	tail -n 2 "$file" | head -n 1
done

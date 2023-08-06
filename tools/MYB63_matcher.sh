#! /usr/bin/sh

cd ../cleaned_dap_files

for file in *
do
	../tools/DE_gene_matcher "AT1G79180 MYB63_col_a" "$file" > ../MYB63_matches/"$file"
done

cd ../MYB63_matches

rm ../figures/MYB63_matches 2> /dev/null

for file in *
do
	intersect=$(tail -n 2 "$file" | head -n 1)
	MYB63_ratio=$(echo "scale = 6; $intersect / 2353.00000" | bc)

	other_total_bound_genes=$(tail -n 1 "$file")
	other_ratio=$(echo "scale = 6; $intersect / $other_total_bound_genes" | bc)

	classification="other"
	if echo "$file" | grep MYB
	then
		if echo "$file" | grep MYB63
		then
			classification="MYB63"
		elif echo "$file" | grep MYB58
		then
			classification="MYB58"
		else
			classification="MYB family protein"
		fi
	fi

	echo "$intersect	$MYB63_ratio	$other_ratio	$file	$classification" >> ../figures/MYB63_matches
done


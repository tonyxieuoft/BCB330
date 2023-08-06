#! /usr/bin/sh

cd ../DE_gene_matches

for directory in *
do

	rep=0
	total=0

	cd $directory
	for file in *
	do
		rep=$(expr $rep + $(tail -n 2 "$file" | head -n 1))
		total=$(expr $total + $(tail -n 1 "$file"))
	done

	echo "=================================="
	echo "$directory:"
	echo "$rep	DE binding"
	echo "$total	total binding"
	echo "=================================="

	cd ..
done

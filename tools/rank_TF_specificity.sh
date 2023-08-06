#! /usr/bin/sh

cd ../DE_gene_matches
mkdir ../temp
mkdir ../temp2

for directory in *
do

	cd $directory
	for file in *
	do
		DE_genes=$(tail -n 2 "$file" | head -n 1)
		total_genes=$(tail -n 1 "$file")
		ratio=$(echo "scale = 6; $DE_genes / $total_genes" | bc)
		echo $ratio $file >> ../../temp/$directory
	done
	cd ..
done

cd ../temp

for file in *
do
	rm ../TF_specificity_rankings/$file 2> /dev/null
	sort -r $file > ../temp2/$file

done

cd ..
rm -r temp 

cd temp2
for file in *
do
	while read line || test -n "$line"
	do
		if test $(echo "$line" | cut -d " " -f 1) = 0
		then
			:
		else
			echo "$line" >> ../TF_specificity_rankings/$file
		fi
	done < $file

	while read line2 && test $(echo "$line2" | cut -d " " -f 1) = 0
	do
		echo "$line2" >> ../TF_specificity_rankings/$file
	done < $file
done
cd ..
rm -r temp2






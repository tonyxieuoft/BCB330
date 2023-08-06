#! /usr/bin/sh

category=$1

sum=0

rm ../corresponding_spec/$category 2> /dev/null

while read line || test -n "$line"
do
	file_AGI=$(echo "$line" | cut -d " " -f 2)

	while read TF2_agi || test -n "$TF2_agi"
	do
		found=0
		if test $file_AGI = $TF2_agi
		then
			echo "$line" >> ../corresponding_spec/$category
			found=1
			break
		fi
	done < ../cleaned_files/sort_results_by_AGI

	if test $found -eq 0
	then
		echo "$line" >> ../corresponding_spec/${category}_not_in_results

	fi
done < ../../normalized_specificity_rankings/$category

#! /usr/bin/sh

while read line || test -n "$line"
do
	TF2_agi=$(echo "$line" | cut -d "	" -f 1)
	source=$(echo "$line" | cut -d "	" -f 6)

	while read line2 || test -n "$line2"
	do
		intersect_agi=$(echo "$line2" | cut -d " " -f 2)
		name=$(echo "$line2" | cut -d " " -f 3)
		if test $TF2_agi = $intersect_agi
		then
			echo $TF2_agi $name $source
			break
		fi
	done < ../corresponding_spec/phospho_network_out

done < ../original_files/DE_result.txt

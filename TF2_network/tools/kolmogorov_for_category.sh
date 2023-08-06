#! /usr/bin/sh

for AGI in $(cat ../cleaned_files/ranked_results)
do
	in_category=false
	for category_AGI in $(cat ../category_rep/phospho_network)
	do
		if test $AGI = $category_AGI
		then
			in_category=true
			break
		fi
	done

	if test $in_category = true
	then
		echo yes
	else
		echo no
	fi
done

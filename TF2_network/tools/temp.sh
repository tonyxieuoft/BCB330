#! /usr/bin/sh

cut -d "	" -f 1 ../original_files/DE_result.txt | sed '1d' | uniq > ../cleaned_files/ranked_results

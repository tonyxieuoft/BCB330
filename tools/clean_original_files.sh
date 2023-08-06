#! /usr/bin/sh

cd ../dap_original_files

for file in *
do
	file_agi=$(head -n 2 $file | tail -n 1 | cut -d "	" -f 1)
	new_filename="$file_agi $file"
	sed '1d' $file | cut -d "	" -f 2 | sort > ../cleaned_dap_files/"$new_filename"
done

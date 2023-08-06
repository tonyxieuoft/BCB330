#! /usr/bin/sh

cd ../dap_plus_amp_original_files

for file in *
do
	if ../tools/find_amp $file
	then
		:
	else
		cp $file ../dap_original_files/$file
	fi
done

#! /usr/bin/sh

TF_file=$1

# location is in tools

if mkdir ../categorized_dap_files/${TF_file}_in
then
	mkdir ../categorized_dap_files/${TF_file}_out
else
	echo 'make sure to double check categorized_dap_files for duplicates'
fi

cd ../cleaned_dap_files

for file in *
do
	in_list=false
	file_agi=$(echo $file | cut -d " " -f 1)

	# iterates until a match is found
	for TF_agi in $(cat ../reference_TF_files/$TF_file)
	do
		if test $file_agi = $TF_agi
		then
			in_list=true
			break
		fi
	done

	if test $in_list = true
	then
		cp "$file" ../categorized_dap_files/${TF_file}_in/"$file"
	else
		cp "$file" ../categorized_dap_files/${TF_file}_out/"$file"
	fi
done





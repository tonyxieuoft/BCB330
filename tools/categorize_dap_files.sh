#! /usr/bin/sh

# ======== Objectives ==========
# For a given set of TFs, sorts the DAP-seq TFs into two folders based on whether they are in
# in the set or not. 
#
# ======== Arguments ===========
# TF_file: The file referring to the set of TFs to use. For instance, the set of DMN TFs. This file
# MUST be in the folder reference_TF_files
#
# ======== Folders ==============
# Input: cleaned_dap_files
# Ouput: {TF_file}_in, {TF_file}_out, nested in the parent folder categorized_dap_files

# Takes in the argument
TF_file=$1

# Makes folders for the in-group and outgroup
if mkdir ../categorized_dap_files/${TF_file}_in
then
	mkdir ../categorized_dap_files/${TF_file}_out
else
	echo 'make sure to double check categorized_dap_files for duplicates'
fi

# Goes into the cleaned_dap_files folder
cd ../cleaned_dap_files

# For every file in the folder, checks whether the AGI matches a gene in the set
# indicated by TF_file
for file in *
do
	in_list=false
	file_agi=$(echo $file | cut -d " " -f 1)

	# iterates through the list in TF_file until a match is found
	for TF_agi in $(cat ../reference_TF_files/$TF_file)
	do
		if test $file_agi = $TF_agi
		then
			in_list=true
			break
		fi
	done

	# copies the file into categorized_dap_files depending on whether it is in the 
	# gene set
	if test $in_list = true
	then
		cp "$file" ../categorized_dap_files/${TF_file}_in/"$file"
	else
		cp "$file" ../categorized_dap_files/${TF_file}_out/"$file"
	fi
done





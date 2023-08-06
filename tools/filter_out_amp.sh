#! /usr/bin/sh

# ======== Objective ========
# This was called after all DAP-seq binding profiles were combined into a single folder
# (rather than multiple folders with TF families). Some of these files still contained
# ampDAP-seq files though, and this shell script adds exclusively DAP-seq files to a new
# folder by iterating through and calling the C program "find amp"
#
# ======= Arguments =========
# None!
#
# ======= Folders ===========
# Input: dap_plus_amp_original_files
# Output: dap_original_files

# Go into the folder containing both original DAP-seq and ampDAP-seq files
cd ../dap_plus_amp_original_files

# iterates through every file
for file in *
do
	# calls the C program "find_amp"
	if ../tools/find_amp $file
	then
		:
	else
		# copies ony the DAP-seq  files into a new folder
		cp $file ../dap_original_files/$file
	fi
done

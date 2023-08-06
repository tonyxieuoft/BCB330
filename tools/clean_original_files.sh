#! /usr/bin/sh

# ======== Objective ========
# "Cleans" the original dap-seq files by:
# 1) Removing the headers of each file
# 2) Taking only the second column (the list of target genes)
# 3) Sorting them in order as a prerequisite for the matching algorithm
# 4) Changing the name of the DAP-seq files to the TFs AGI and common name
#
# ======== Arguments ========
# None!
#
# ======== Folders ==========
# Input: dap_original_files
# Output: cleaned_dap_files


cd ../dap_original_files

for file in *
do
	file_agi=$(head -n 2 $file | tail -n 1 | cut -d "	" -f 1)
	new_filename="$file_agi $file"
	sed '1d' $file | cut -d "	" -f 2 | sort > ../cleaned_dap_files/"$new_filename"
done

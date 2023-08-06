D#! /usr/bin/sh

# ======== Objectives ========
# For every folder in categorized_dap_files, identifies the IRGs matching
# the binding profile contained in every file. Outputs this into a folder
# in DE_gene_matches with the same name as the folder in categorized_dap_files.
#
# ======== Arguments =========
# None!
#
# ======== Folders ===========
# Input: categorized_dap_files
# Output: DE_gene_matcher.sh
#

cd ../categorized_dap_files

for directory in *
do
	rm -r ../DE_gene_matches/$directory 2> /dev/null
	mkdir ../DE_gene_matches/$directory

	cd $directory

	# for every file in a directory in categorized_dap_files, calls on DE_gene_matcher to match IRGs to
	# the the AGIs in the file
	for file in *
	do
		../../tools/DE_gene_matcher ../../DE_genes.txt "$file" > ../../DE_gene_matches/${directory}/"$file"
	done

	cd ..
	echo "finished matching $directory"

done



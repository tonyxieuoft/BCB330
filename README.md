# BCB330

## General Outline

The code for the computational pipeline is in the "tools" folder.

If no* processing has been completed on the DAP-seq files downloaded from the Plant Cistrome database, run the following to clean and reformat the files:

1) filter_out_amp.sh
2) clean_original_files.sh

If the DAP-seq files have been processed and cleaned, run the following given a set of input genes and input TFs (eg. the list of IRGs and the list of TFs in the DMN) to generate specificity score rankings for all DAP-seq represented TFs separated into in- and out-groups:

3) categorize_dap_files.sh
4) DE_gene_matcher.sh
5) rank_TF_specificity.sh
6) normalize_rankings.sh

Scripts 3-6 have functions mirroring the 4 steps outlined in the materials and methods section. The programs are commented in greater detail, indicating which files they take input from, and which files they output into.

*Since the location of the downloaded Plant Cistrome database files will be different for every user, the initial code used to combine the files in the initial TF family folder hierarchy all into a single folder have been omitted. This can be achieved manually; however, it would take a lot of time. 

## What Each Folder Contains


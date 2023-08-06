# BCB330

The code for the computational pipeline is in the "tools" folder and is run in the following order:

~ Starting with the original DAP-seq + ampDAP-seq files

1) filter_out_amp.sh
2) clean_original_files.sh

~ Given a set of genes of interest (ex. the list of IRGs)

3) categorize_dap_files.sh
4) DE_gene_matcher.sh
5) rank_TF_specificity.sh
6) normalize_rankings.sh

The first two programs filtered and formatted the DAP-seq data, while the last four have functions mirroring the 4 steps outlined in the materials and methods section. The programs are commented in greater detail, indicating which files they take input from, and which files they output into.

Note that the folders TF2_network and MYB63_matches are independent of this pipeline. 

Let me know if anything is unclear!

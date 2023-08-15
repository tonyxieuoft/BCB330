# BCB330

## General Outline

The code for the computational pipeline is in the **tools** folder.

If no* processing has been completed on the DAP-seq files downloaded from the Plant Cistrome database, run the following to clean and reformat the files:

1) filter_out_amp.sh
2) clean_original_files.sh

If the DAP-seq files have been processed and cleaned, run the following given a set of input genes and input TFs (eg. the list of IRGs and the list of TFs in the DMN) to generate specificity score rankings for all DAP-seq represented TFs separated into in- and out-groups:

3) categorize_dap_files.sh
4) DE_gene_matcher.sh
5) rank_TF_specificity.sh
6) normalize_rankings.sh

Scripts 3-6 have functions mirroring the 4 steps outlined in the materials and methods section. The code itself is commented in greater detail, with indication on which files they take input from, and which files they output into.

*Since the location of the downloaded Plant Cistrome database files will be different for every user, the initial code used to combine the files in the initial TF family folder hierarchy all into a single folder have been omitted. This can be achieved manually; however, it would take a lot of time. 

## What Each Folder Contains

Folders were created for each output step partly to document the step-by-step process that the pipeline runs through. Additionally, although the end result was to create a ranking of specificity scores, some of the intermediate outputs such as the list of IRGs that each TF bound to were equally useful to view and store. The following folders are organized by order of analysis in the pipeline.

### dap_plus_amp_original_files
The original DAP-seq (and ampDAP-seq) files from the Plant Cistrome Database. This is the starting point for the analysis.   

### dap_original_files
The original files from the Plant Cistrome Database, **minus** the ones that were from ampDAP-seq experiments. ampDAP-seq removes DNA methylation, which increases the chance for false-positive identification to occur. The script `filter_out_amp.sh` (along with the helper program find_amp.c/find_amp) moved non-ampDAP-seq files from `dap_plus_amp_original_files` to this directory. 

### cleaned_dap_files
The files from dap_original_files after they were cleaned by the script `clean_original_files.sh`. "Cleaning", in this sense, refers to extracting a TF's gene accession and common name, putting them in the filename, and emptying the file of everything except for the TF's gene targets (thus creating a cleaned binding profile).  

### reference_TF_files
Storage of the input sets of transcription factors for scripts 3-6 to act on. For the purpose of the investigation, the input sets were the list of TFs in the interactomes amongst differentially phosphorylated and ubiquitinated proteins. 

### DE_genes.txt
NOT a folder, but this file contained the set of input genes that scripts 3-6 acted on, ie. the list of isoxaben-responsive genes.

### categorized_dap_files
Given a set of TFs stored in `reference_TF_files` as input, the script `categorize_dap_files.sh` took files from cleaned_dap_files and sorted them into in- and out-subfolders based on whether the TF in each file was a member of the set. These in- and out- subfolders were located in `categorized_dap_files`. For instance, given an input set of TFs in the phsophorylation network, DAP-seq binding profiles files were sorted into the two subfolders `phospho_network_in` and `phospho_network_out` for later analysis. 

### DE_gene_matches
Contains lists of bound IRGs in the binding profiles for each DAP-seq represented TF. The files are organized into two-subfolders in the same style that they were organized in `categorized_dap_files`. The script `DE_gene_matcher.sh` was used to generate the output in DE_gene_matches and utilized the helper program DE_gene_matcher.c/DE_gene_matcher. It used `DE_genes.txt` as the input file containing the set of isoxaben-responsive genes to compare to. On the bottom of each file outputted into this folder was a count of the number of bound IRGs, as well as the total size of the DAP-seq binding profile for the specific TF.

### TF_specificity_rankings
Given an input of a folder from `DE_gene_matches`, the TFs in the folder were ranked from greatest to least in terms of "raw specificity score" using the script `rank_TF_specificity.sh`. Here, raw specificity score was defined as the "number of bound IRGs / number of total bound genes". 

### normalized_specificity_rankings
Contains the normalized and final specificity scores used for the investigation, with the folder `TF_specificity_rankings` as input. The script `normalize_rankings.sh` was used to carry out the normalization. 

## Additional Analysis not in the Pipeline

Some of the computational analysis conducted in the investigation was very similar to, but not a direct part of the pipeline. This included: 
- analysis on binding profile overlap between MYB63 and other DAP-seq represented TFs. The results of the analysis are contained in the `MYB63_matches` folder.
- Labeling TRUE/FALSE for each TF based on whether they bound to at least one IRG. Although this was initially conducted before the development of the specificity scoring system, the results from the pipeline can be easily modified to represent this data.
- Specificity rankings for the positive controls, based on their ChIP binding profiles.

All of the above were omitted from this repository for the sake of clarity; however, they follow from the pipeline in very straightforward ways:

1) In the case of identifying binding profile overlap between MYB63 and other DAP-seq represented TFs, steps 3-6 of the computational pipeline were used exactly (no changes whatsover), except that MYB63's binding profile replaced the list of IRGs.
2) For the TRUE/FALSE labelling, simply take a list of specificity scores, mark "FALSE" the TFs with a score of zero, and mark "TRUE" otherwise.
3) Like in step 1, to generate specificity score rankings for control TFs, simply replace their ChIP-seq binding profiles with the list of IRGs. 

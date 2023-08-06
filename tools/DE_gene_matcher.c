#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define AGI_LENGTH 20
// the actual AGI length is 9, but this was used to prevent any segmentation faults from happening

// **** NOTE: generally requires DE_gene_matcher.c to function as intended

// "Empties a string" -> must be done manually in C"
void clear_string(char *string, int size){
	for (int i = 0; i < size; i++){
		string[i] = '\0';
	}
}

// calculates the numerical value of an AGI: the chromosome number is the 10000's digit, while the
// last 4 digits are the last 4 of the AGI
int AGI_abs_pos(char *agi){

	return (agi[2] - '0') * 100000 + strtol(agi + 4, NULL, 10);

}

// ARGUMENTS: must be called in the form ./DE_gene_matcher.c file1 file2, where file1 and file 2 contain
// two sets of genes to be compared
int main(int argc, char **argv){

	// DE_list is the file containing the list of isoxaben-responsive genes
	FILE *DE_list = fopen(argv[1], "r");
	// DAP_list is the file containing the DAP-seq binding profile for a list
	FILE *DAP_list = fopen(argv[2], "r");

	char DE_agi[AGI_LENGTH];
	char DAP_agi[AGI_LENGTH];
	// both arrays store one AGI at a time for comparison

	clear_string(DE_agi, AGI_LENGTH);
	clear_string(DAP_agi, AGI_LENGTH);

	int total_DAP_genes = 0;

	fscanf(DAP_list, "%s", DAP_agi);
	total_DAP_genes++;

	fscanf(DE_list, "%s", DE_agi);

	int match_count = 0;

	// iterates through until the end of a list is reached
	// the total number of iterations is at least the size of the smaller set and at most the sum
	// of the sizes of both sets
	int end_of_list = 0;
	while(!end_of_list){

		int dap_pos = AGI_abs_pos(DAP_agi);
		int de_pos = AGI_abs_pos(DE_agi);

		// compares the sizes of the current AGIs, if they are equal then they match, and the gene is 
		// printed out
		if (de_pos == dap_pos){
			printf("%s\n", DAP_agi);
			match_count += 1;
			if (fscanf(DAP_list, "%s", DAP_agi) <= 0 || fscanf(DE_list, "%s", DE_agi) <= 0){
				end_of_list = 1;
			}
			else{
				total_DAP_genes++;
			}
		}

		// otherwise, keeps going down both lists for comparison
		else if (de_pos > dap_pos){
			if (fscanf(DAP_list, "%s", DAP_agi) <= 0){
				end_of_list = 1;
			}
			else{
				total_DAP_genes++;
			}
		}
		else{
			if (fscanf(DE_list, "%s", DE_agi) <= 0){
				end_of_list = 1;
			}
		}
	}

	while (fscanf(DAP_list, "%s", DAP_agi) > 0){
		total_DAP_genes++;
	}

	// prints the number of matches, and the size of the DAP-seq binding profile
	printf("%d\n", match_count);
	printf("%d\n", total_DAP_genes);
	fclose(DAP_list);
	fclose(DE_list);

	return 0;
}

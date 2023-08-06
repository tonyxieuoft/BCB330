#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define AGI_LENGTH 20

void clear_string(char *string, int size){
	for (int i = 0; i < size; i++){
		string[i] = '\0';
	}
}

int AGI_abs_pos(char *agi){

	return (agi[2] - '0') * 100000 + strtol(agi + 4, NULL, 10);

}

int main(int argc, char **argv){

	FILE *DE_list = fopen(argv[1], "r");
	FILE *DAP_list = fopen(argv[2], "r");

	char DE_agi[AGI_LENGTH];
	char DAP_agi[AGI_LENGTH];

	clear_string(DE_agi, AGI_LENGTH);
	clear_string(DAP_agi, AGI_LENGTH);

	// fscanf(DAP_list, "%s", DAP_agi); // for the very first row (column header)
	int total_DAP_genes = 0;

	fscanf(DAP_list, "%s", DAP_agi);
	total_DAP_genes++;

	fscanf(DE_list, "%s", DE_agi);

	int match_count = 0;

	int end_of_list = 0;
	while(!end_of_list){

		int dap_pos = AGI_abs_pos(DAP_agi);
		int de_pos = AGI_abs_pos(DE_agi);
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

	printf("%d\n", match_count);
	printf("%d\n", total_DAP_genes);
	fclose(DAP_list);
	fclose(DE_list);

	return 0;
}

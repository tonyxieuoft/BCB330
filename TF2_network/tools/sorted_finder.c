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

	FILE *list1 = fopen(argv[1], "r");
	FILE *list2 = fopen(argv[2], "r");

	char list1_agi[AGI_LENGTH];
	char list2_agi[AGI_LENGTH];

	clear_string(list1_agi, AGI_LENGTH);
	clear_string(list2_agi, AGI_LENGTH);

	// fscanf(DAP_list, "%s", DAP_agi); // for the very first row (column header)
	// int total_list2_genes = 0; // -> if the total for list2 is needed

	fscanf(list2, "%s", list2_agi);
	// total_list2_genes++; //

	fscanf(list1, "%s", list1_agi);

	int match_count = 0;

	int end_of_list = 0;
	while(!end_of_list){

		int list2_pos = AGI_abs_pos(list2_agi);
		int list1_pos = AGI_abs_pos(list1_agi);
		if (list1_pos == list2_pos){
			printf("%s\n", list2_agi);
			match_count += 1;
			if (fscanf(list2, "%s", list2_agi) <= 0 || fscanf(list1, "%s", list1_agi) <= 0){
				end_of_list = 1;
			}
			else{
				// total_list2_genes++;
			}
		}
		else if (list1_pos > list2_pos){
			if (fscanf(list2, "%s", list2_agi) <= 0){
				end_of_list = 1;
			}
			else{
				// total_list2_genes++;
			}
		}
		else{
			if (fscanf(list1, "%s", list1_agi) <= 0){
				end_of_list = 1;
			}
		}
	}

/*
	while (fscanf(list2, "%s", list2_agi) > 0){
		total_list2_genes++;
	}
*/

	printf("%d\n", match_count);
	// printf("%d\n", total_list2_genes);
	fclose(list1);
	fclose(list2);

	return 0;
}

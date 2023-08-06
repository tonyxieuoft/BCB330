#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// *** NOTE: requires find_amp.sh to function
//
// ARGUMENTS:
// must be called in the form ./find_amp.c str, where str is a filename to checl

int main(int argc, char **argv){

	// takes in a string as an argument
	char *result = strstr(argv[1], "colamp");

	// returns 1 iff "colamp" is in the string (which would be the filename)
	if (result == NULL){
		return 1;
	}
	else{
		return 0;
	}
}

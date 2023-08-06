#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv){
	char *result = strstr(argv[1], "colamp");
	if (result == NULL){
		return 1;
	}
	else{
		return 0;
	}
}

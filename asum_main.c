#include <stdio.h>
#include <stdlib.h>
#include "md1.h"

int main (int argc, char **argv) {
	int i = atoi(argv[1]);
	printf("%u\n", asum(i));
	return 0;
}
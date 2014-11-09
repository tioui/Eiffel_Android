#include <stdio.h>
#include "libexample.h"
#include "eif_setup.h"

extern char **environ;

int main(void)
{
	int argc = 1;
	char program_name[] = "Java Application";
	char* argv[1];
	argv[0] = program_name;
	char **envp = environ;

	int* l_fib;
	int i;

	EIF_INITIALIZE(failure)
	printf("%s\n",hello_from_eiffel());
	l_fib = fibonacci_sequence_from_eiffel(5);
	printf("The fibonacci sequence: ");
	for(i = 0; i<5;i++){
		printf("%d, ",l_fib[i]);
	}
	printf("\n");
	EIF_DISPOSE_ALL
}

#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char *argv[]) {

	int n = 23;
	int counts[n];

	/*********************
	 * Print Init Counts *
	 *********************/

	// get system call counts
	countTraps(counts, n);

	// pretty print all system call counts
	printf(1, "\n***INITIAL USER PROCESS TRAP COUNT***\n");

	for (int i = 1; i < n; i++)
		if(counts[i] > 0) {
			printf(1, " -trap count for syscall #%d: %d\n", i, counts[i]);
		}

	printf(1, "*************************************************\n\n");


	printf(1, "\n****FORK TEST****\n\n");

	printf(1, "\n   User Process: mkdir...\n");

	// mkdir test
	printf(1, "\n   Calling mkdir()");
	mkdir("Jay_Patel");
	printf(1, "\n   - Directory 'Jay_Patel' created\n");

	// write test
	int sz, fd;
	char *c = (char *) malloc(sizeof("Jay_Patel"));
	printf(1, "\n   Calling write()");
	fd = open("hello-world.txt", O_CREATE | O_WRONLY);
	write(fd, "Jay_Patel", strlen("Jay_Patel"));
	printf(1, "\n   - File hello-world.txt created");
	printf(1, "\n   - 'Jay_Patel' written to file");
	printf(1, "\n   - %d bytes were written\n", sizeof(strlen("Jay_Patel")));
	close(fd);

	printf(1, "\n   **********************\n\n");

	// get system call counts
	countTraps(counts, n);

	// pretty print all system call counts
	printf(1, "\n   ***FORK: PARENT***\n");

	for (int i = 1; i < n; i++)
		if(counts[i] > 0) {
			printf(1, " -trap count for syscall #%d: %d\n", i, counts[i]);
		}
	printf(1, "**********************************************************\n");

	if (fork() == 0) {

		

		printf(1, "\n   User Process: read....\n");

		// read test
		printf(1, "\n   Calling read()");
		fd = open("Jay_Patel.txt", O_RDONLY);
		sz = read(fd, c, 10);
		printf(1, "\n   - '%s' was read from file", c);
		printf(1, "\n   - %d bytes were read\n", sz);
		close(fd);

		// strcpy test
		char src[40];
		char dest[100];
		printf(1, "\n   Calling strcpy()");
		printf(1, "\n   - Copying string: Jay_Patel");
		memset(dest, '\0', sizeof(dest));
		strcpy(src, "Jay_Patel");
		strcpy(dest, src);
		printf(1, "\n   - Final copied string: %s\n", dest);

		printf(1, "\n  **********************\n\n");

		// get system call counts
		countTraps(counts, n);

		// pretty print all system call counts
		printf(1, "\n***FORK: CHILD***\n");

		for (int i = 1; i < n; i++)
			if(counts[i] > 0) {
			printf(1, " -trap count for syscall #%d: %d\n", i, counts[i]);
		}
		printf(1, "   **********************\n");
	}

	wait();

	exit();

}
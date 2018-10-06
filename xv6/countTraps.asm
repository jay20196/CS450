
_countTraps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
	/*********************
	 * Print Init Counts *
	 *********************/

	// get system call counts
	countTraps(counts, n);
  11:	8d b5 28 ff ff ff    	lea    -0xd8(%ebp),%esi

	// pretty print all system call counts
	printf(1, "\n***INITIAL USER PROCESS TRAP COUNT***\n");

	for (int i = 1; i < n; i++)
  17:	bb 01 00 00 00       	mov    $0x1,%ebx
int main(int argc, char *argv[]) {
  1c:	81 ec 10 01 00 00    	sub    $0x110,%esp
	countTraps(counts, n);
  22:	6a 17                	push   $0x17
  24:	56                   	push   %esi
  25:	e8 a8 05 00 00       	call   5d2 <countTraps>
	printf(1, "\n***INITIAL USER PROCESS TRAP COUNT***\n");
  2a:	5f                   	pop    %edi
  2b:	58                   	pop    %eax
  2c:	68 d8 09 00 00       	push   $0x9d8
  31:	6a 01                	push   $0x1
  33:	e8 48 06 00 00       	call   680 <printf>
  38:	83 c4 10             	add    $0x10,%esp
  3b:	90                   	nop
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if(counts[i] > 0) {
  40:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
  43:	85 c0                	test   %eax,%eax
  45:	7e 11                	jle    58 <main+0x58>
			printf(1, " -trap count for syscall #%d: %d\n", i, counts[i]);
  47:	50                   	push   %eax
  48:	53                   	push   %ebx
  49:	68 00 0a 00 00       	push   $0xa00
  4e:	6a 01                	push   $0x1
  50:	e8 2b 06 00 00       	call   680 <printf>
  55:	83 c4 10             	add    $0x10,%esp
	for (int i = 1; i < n; i++)
  58:	83 c3 01             	add    $0x1,%ebx
  5b:	83 fb 17             	cmp    $0x17,%ebx
  5e:	75 e0                	jne    40 <main+0x40>
		}

	printf(1, "*************************************************\n\n");
  60:	83 ec 08             	sub    $0x8,%esp
  63:	68 24 0a 00 00       	push   $0xa24
  68:	6a 01                	push   $0x1
  6a:	e8 11 06 00 00       	call   680 <printf>


	printf(1, "\n****FORK TEST****\n\n");
  6f:	58                   	pop    %eax
  70:	5a                   	pop    %edx
  71:	68 44 0b 00 00       	push   $0xb44
  76:	6a 01                	push   $0x1
  78:	e8 03 06 00 00       	call   680 <printf>

	printf(1, "\n   User Process: mkdir...\n");
  7d:	59                   	pop    %ecx
  7e:	5b                   	pop    %ebx
  7f:	68 59 0b 00 00       	push   $0xb59
  84:	6a 01                	push   $0x1
  86:	e8 f5 05 00 00       	call   680 <printf>

	// mkdir test
	printf(1, "\n   Calling mkdir()");
  8b:	5f                   	pop    %edi
  8c:	58                   	pop    %eax
  8d:	68 75 0b 00 00       	push   $0xb75
  92:	6a 01                	push   $0x1
  94:	e8 e7 05 00 00       	call   680 <printf>
	mkdir("Jay_Patel");
  99:	c7 04 24 89 0b 00 00 	movl   $0xb89,(%esp)
  a0:	e8 f5 04 00 00       	call   59a <mkdir>
	printf(1, "\n   - Directory 'Jay_Patel' created\n");
  a5:	58                   	pop    %eax
  a6:	5a                   	pop    %edx
  a7:	68 58 0a 00 00       	push   $0xa58
  ac:	6a 01                	push   $0x1
  ae:	e8 cd 05 00 00       	call   680 <printf>

	// write test
	int sz, fd;
	char *c = (char *) malloc(sizeof("Jay_Patel"));
  b3:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  ba:	e8 21 08 00 00       	call   8e0 <malloc>
	printf(1, "\n   Calling write()");
  bf:	59                   	pop    %ecx
  c0:	5b                   	pop    %ebx
  c1:	68 93 0b 00 00       	push   $0xb93
  c6:	6a 01                	push   $0x1
	char *c = (char *) malloc(sizeof("Jay_Patel"));
  c8:	89 c7                	mov    %eax,%edi
	printf(1, "\n   Calling write()");
  ca:	e8 b1 05 00 00       	call   680 <printf>
	fd = open("hello-world.txt", O_CREATE | O_WRONLY);
  cf:	58                   	pop    %eax
  d0:	5a                   	pop    %edx
  d1:	68 01 02 00 00       	push   $0x201
  d6:	68 a7 0b 00 00       	push   $0xba7
  db:	e8 92 04 00 00       	call   572 <open>
	write(fd, "Jay_Patel", strlen("Jay_Patel"));
  e0:	c7 04 24 89 0b 00 00 	movl   $0xb89,(%esp)
	fd = open("hello-world.txt", O_CREATE | O_WRONLY);
  e7:	89 c3                	mov    %eax,%ebx
	write(fd, "Jay_Patel", strlen("Jay_Patel"));
  e9:	e8 72 02 00 00       	call   360 <strlen>
  ee:	83 c4 0c             	add    $0xc,%esp
  f1:	50                   	push   %eax
  f2:	68 89 0b 00 00       	push   $0xb89
  f7:	53                   	push   %ebx
  f8:	e8 55 04 00 00       	call   552 <write>
	printf(1, "\n   - File hello-world.txt created");
  fd:	59                   	pop    %ecx
  fe:	58                   	pop    %eax
  ff:	68 80 0a 00 00       	push   $0xa80
 104:	6a 01                	push   $0x1
 106:	e8 75 05 00 00       	call   680 <printf>
	printf(1, "\n   - 'Jay_Patel' written to file");
 10b:	58                   	pop    %eax
 10c:	5a                   	pop    %edx
 10d:	68 a4 0a 00 00       	push   $0xaa4
 112:	6a 01                	push   $0x1
 114:	e8 67 05 00 00       	call   680 <printf>
	printf(1, "\n   - %d bytes were written\n", sizeof(strlen("Jay_Patel")));
 119:	83 c4 0c             	add    $0xc,%esp
 11c:	6a 04                	push   $0x4
 11e:	68 b7 0b 00 00       	push   $0xbb7
 123:	6a 01                	push   $0x1
 125:	e8 56 05 00 00       	call   680 <printf>
	close(fd);
 12a:	89 1c 24             	mov    %ebx,(%esp)
 12d:	e8 28 04 00 00       	call   55a <close>

	printf(1, "\n   **********************\n\n");
 132:	59                   	pop    %ecx
 133:	5b                   	pop    %ebx
 134:	68 d4 0b 00 00       	push   $0xbd4
 139:	6a 01                	push   $0x1
 13b:	e8 40 05 00 00       	call   680 <printf>

	// get system call counts
	countTraps(counts, n);
 140:	58                   	pop    %eax
 141:	5a                   	pop    %edx
 142:	6a 17                	push   $0x17
 144:	56                   	push   %esi
 145:	e8 88 04 00 00       	call   5d2 <countTraps>

	// pretty print all system call counts
	printf(1, "\n   ***FORK: PARENT***\n");
 14a:	59                   	pop    %ecx
 14b:	5b                   	pop    %ebx
 14c:	68 f1 0b 00 00       	push   $0xbf1
 151:	6a 01                	push   $0x1

	for (int i = 1; i < n; i++)
 153:	bb 01 00 00 00       	mov    $0x1,%ebx
	printf(1, "\n   ***FORK: PARENT***\n");
 158:	e8 23 05 00 00       	call   680 <printf>
 15d:	83 c4 10             	add    $0x10,%esp
		if(counts[i] > 0) {
 160:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
 163:	85 c0                	test   %eax,%eax
 165:	7e 11                	jle    178 <main+0x178>
			printf(1, " -trap count for syscall #%d: %d\n", i, counts[i]);
 167:	50                   	push   %eax
 168:	53                   	push   %ebx
 169:	68 00 0a 00 00       	push   $0xa00
 16e:	6a 01                	push   $0x1
 170:	e8 0b 05 00 00       	call   680 <printf>
 175:	83 c4 10             	add    $0x10,%esp
	for (int i = 1; i < n; i++)
 178:	83 c3 01             	add    $0x1,%ebx
 17b:	83 fb 17             	cmp    $0x17,%ebx
 17e:	75 e0                	jne    160 <main+0x160>
		}
	printf(1, "**********************************************************\n");
 180:	83 ec 08             	sub    $0x8,%esp
 183:	68 c8 0a 00 00       	push   $0xac8
 188:	6a 01                	push   $0x1
 18a:	e8 f1 04 00 00       	call   680 <printf>

	if (fork() == 0) {
 18f:	e8 96 03 00 00       	call   52a <fork>
 194:	83 c4 10             	add    $0x10,%esp
 197:	85 c0                	test   %eax,%eax
 199:	74 0a                	je     1a5 <main+0x1a5>
			printf(1, " -trap count for syscall #%d: %d\n", i, counts[i]);
		}
		printf(1, "   **********************\n");
	}

	wait();
 19b:	e8 9a 03 00 00       	call   53a <wait>

	exit();
 1a0:	e8 8d 03 00 00       	call   532 <exit>
		printf(1, "\n   User Process: read....\n");
 1a5:	52                   	push   %edx
 1a6:	52                   	push   %edx
 1a7:	68 09 0c 00 00       	push   $0xc09
 1ac:	6a 01                	push   $0x1
 1ae:	e8 cd 04 00 00       	call   680 <printf>
		printf(1, "\n   Calling read()");
 1b3:	59                   	pop    %ecx
 1b4:	5b                   	pop    %ebx
 1b5:	68 25 0c 00 00       	push   $0xc25
 1ba:	6a 01                	push   $0x1
 1bc:	e8 bf 04 00 00       	call   680 <printf>
		fd = open("Jay_Patel.txt", O_RDONLY);
 1c1:	58                   	pop    %eax
 1c2:	5a                   	pop    %edx
 1c3:	6a 00                	push   $0x0
 1c5:	68 38 0c 00 00       	push   $0xc38
 1ca:	e8 a3 03 00 00       	call   572 <open>
		sz = read(fd, c, 10);
 1cf:	83 c4 0c             	add    $0xc,%esp
		fd = open("Jay_Patel.txt", O_RDONLY);
 1d2:	89 c3                	mov    %eax,%ebx
		sz = read(fd, c, 10);
 1d4:	6a 0a                	push   $0xa
 1d6:	57                   	push   %edi
 1d7:	50                   	push   %eax
 1d8:	e8 6d 03 00 00       	call   54a <read>
		printf(1, "\n   - '%s' was read from file", c);
 1dd:	83 c4 0c             	add    $0xc,%esp
		sz = read(fd, c, 10);
 1e0:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
		printf(1, "\n   - '%s' was read from file", c);
 1e6:	57                   	push   %edi
 1e7:	68 46 0c 00 00       	push   $0xc46
 1ec:	6a 01                	push   $0x1
 1ee:	e8 8d 04 00 00       	call   680 <printf>
		printf(1, "\n   - %d bytes were read\n", sz);
 1f3:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
 1f9:	83 c4 0c             	add    $0xc,%esp
 1fc:	50                   	push   %eax
 1fd:	68 64 0c 00 00       	push   $0xc64
 202:	6a 01                	push   $0x1
 204:	e8 77 04 00 00       	call   680 <printf>
		close(fd);
 209:	89 1c 24             	mov    %ebx,(%esp)
 20c:	e8 49 03 00 00       	call   55a <close>
		printf(1, "\n   Calling strcpy()");
 211:	59                   	pop    %ecx
 212:	5b                   	pop    %ebx
 213:	68 7e 0c 00 00       	push   $0xc7e
 218:	6a 01                	push   $0x1
		memset(dest, '\0', sizeof(dest));
 21a:	8d 5d 84             	lea    -0x7c(%ebp),%ebx
		printf(1, "\n   Calling strcpy()");
 21d:	e8 5e 04 00 00       	call   680 <printf>
		printf(1, "\n   - Copying string: Jay_Patel");
 222:	5f                   	pop    %edi
 223:	58                   	pop    %eax
 224:	68 04 0b 00 00       	push   $0xb04
 229:	6a 01                	push   $0x1
		strcpy(src, "Jay_Patel");
 22b:	8d bd 00 ff ff ff    	lea    -0x100(%ebp),%edi
		printf(1, "\n   - Copying string: Jay_Patel");
 231:	e8 4a 04 00 00       	call   680 <printf>
		memset(dest, '\0', sizeof(dest));
 236:	83 c4 0c             	add    $0xc,%esp
 239:	6a 64                	push   $0x64
 23b:	6a 00                	push   $0x0
 23d:	53                   	push   %ebx
 23e:	e8 4d 01 00 00       	call   390 <memset>
		strcpy(src, "Jay_Patel");
 243:	58                   	pop    %eax
 244:	5a                   	pop    %edx
 245:	68 89 0b 00 00       	push   $0xb89
 24a:	57                   	push   %edi
 24b:	e8 90 00 00 00       	call   2e0 <strcpy>
		strcpy(dest, src);
 250:	59                   	pop    %ecx
 251:	58                   	pop    %eax
 252:	57                   	push   %edi
 253:	53                   	push   %ebx
 254:	e8 87 00 00 00       	call   2e0 <strcpy>
		printf(1, "\n   - Final copied string: %s\n", dest);
 259:	83 c4 0c             	add    $0xc,%esp
 25c:	53                   	push   %ebx
 25d:	68 24 0b 00 00       	push   $0xb24
 262:	6a 01                	push   $0x1
 264:	e8 17 04 00 00       	call   680 <printf>
		printf(1, "\n  **********************\n\n");
 269:	58                   	pop    %eax
 26a:	5a                   	pop    %edx
 26b:	68 93 0c 00 00       	push   $0xc93
 270:	6a 01                	push   $0x1
 272:	e8 09 04 00 00       	call   680 <printf>
		countTraps(counts, n);
 277:	59                   	pop    %ecx
 278:	5b                   	pop    %ebx
 279:	6a 17                	push   $0x17
 27b:	56                   	push   %esi
		for (int i = 1; i < n; i++)
 27c:	bb 01 00 00 00       	mov    $0x1,%ebx
		countTraps(counts, n);
 281:	e8 4c 03 00 00       	call   5d2 <countTraps>
		printf(1, "\n***FORK: CHILD***\n");
 286:	5f                   	pop    %edi
 287:	58                   	pop    %eax
 288:	68 af 0c 00 00       	push   $0xcaf
 28d:	6a 01                	push   $0x1
 28f:	e8 ec 03 00 00       	call   680 <printf>
 294:	83 c4 10             	add    $0x10,%esp
 297:	89 f6                	mov    %esi,%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
			if(counts[i] > 0) {
 2a0:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
 2a3:	85 c0                	test   %eax,%eax
 2a5:	7e 11                	jle    2b8 <main+0x2b8>
			printf(1, " -trap count for syscall #%d: %d\n", i, counts[i]);
 2a7:	50                   	push   %eax
 2a8:	53                   	push   %ebx
 2a9:	68 00 0a 00 00       	push   $0xa00
 2ae:	6a 01                	push   $0x1
 2b0:	e8 cb 03 00 00       	call   680 <printf>
 2b5:	83 c4 10             	add    $0x10,%esp
		for (int i = 1; i < n; i++)
 2b8:	83 c3 01             	add    $0x1,%ebx
 2bb:	83 fb 17             	cmp    $0x17,%ebx
 2be:	75 e0                	jne    2a0 <main+0x2a0>
		printf(1, "   **********************\n");
 2c0:	50                   	push   %eax
 2c1:	50                   	push   %eax
 2c2:	68 c3 0c 00 00       	push   $0xcc3
 2c7:	6a 01                	push   $0x1
 2c9:	e8 b2 03 00 00       	call   680 <printf>
 2ce:	83 c4 10             	add    $0x10,%esp
 2d1:	e9 c5 fe ff ff       	jmp    19b <main+0x19b>
 2d6:	66 90                	xchg   %ax,%ax
 2d8:	66 90                	xchg   %ax,%ax
 2da:	66 90                	xchg   %ax,%ax
 2dc:	66 90                	xchg   %ax,%ax
 2de:	66 90                	xchg   %ax,%ax

000002e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2ea:	89 c2                	mov    %eax,%edx
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2f0:	83 c1 01             	add    $0x1,%ecx
 2f3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 2f7:	83 c2 01             	add    $0x1,%edx
 2fa:	84 db                	test   %bl,%bl
 2fc:	88 5a ff             	mov    %bl,-0x1(%edx)
 2ff:	75 ef                	jne    2f0 <strcpy+0x10>
    ;
  return os;
}
 301:	5b                   	pop    %ebx
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    
 304:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 30a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000310 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	53                   	push   %ebx
 314:	8b 55 08             	mov    0x8(%ebp),%edx
 317:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 31a:	0f b6 02             	movzbl (%edx),%eax
 31d:	0f b6 19             	movzbl (%ecx),%ebx
 320:	84 c0                	test   %al,%al
 322:	75 1c                	jne    340 <strcmp+0x30>
 324:	eb 2a                	jmp    350 <strcmp+0x40>
 326:	8d 76 00             	lea    0x0(%esi),%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 330:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 333:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 336:	83 c1 01             	add    $0x1,%ecx
 339:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 33c:	84 c0                	test   %al,%al
 33e:	74 10                	je     350 <strcmp+0x40>
 340:	38 d8                	cmp    %bl,%al
 342:	74 ec                	je     330 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 344:	29 d8                	sub    %ebx,%eax
}
 346:	5b                   	pop    %ebx
 347:	5d                   	pop    %ebp
 348:	c3                   	ret    
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 350:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 352:	29 d8                	sub    %ebx,%eax
}
 354:	5b                   	pop    %ebx
 355:	5d                   	pop    %ebp
 356:	c3                   	ret    
 357:	89 f6                	mov    %esi,%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <strlen>:

uint
strlen(char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 366:	80 39 00             	cmpb   $0x0,(%ecx)
 369:	74 15                	je     380 <strlen+0x20>
 36b:	31 d2                	xor    %edx,%edx
 36d:	8d 76 00             	lea    0x0(%esi),%esi
 370:	83 c2 01             	add    $0x1,%edx
 373:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 377:	89 d0                	mov    %edx,%eax
 379:	75 f5                	jne    370 <strlen+0x10>
    ;
  return n;
}
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    
 37d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 380:	31 c0                	xor    %eax,%eax
}
 382:	5d                   	pop    %ebp
 383:	c3                   	ret    
 384:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 38a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000390 <memset>:

void*
memset(void *dst, int c, uint n)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 397:	8b 4d 10             	mov    0x10(%ebp),%ecx
 39a:	8b 45 0c             	mov    0xc(%ebp),%eax
 39d:	89 d7                	mov    %edx,%edi
 39f:	fc                   	cld    
 3a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3a2:	89 d0                	mov    %edx,%eax
 3a4:	5f                   	pop    %edi
 3a5:	5d                   	pop    %ebp
 3a6:	c3                   	ret    
 3a7:	89 f6                	mov    %esi,%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <strchr>:

char*
strchr(const char *s, char c)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 45 08             	mov    0x8(%ebp),%eax
 3b7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 3ba:	0f b6 10             	movzbl (%eax),%edx
 3bd:	84 d2                	test   %dl,%dl
 3bf:	74 1d                	je     3de <strchr+0x2e>
    if(*s == c)
 3c1:	38 d3                	cmp    %dl,%bl
 3c3:	89 d9                	mov    %ebx,%ecx
 3c5:	75 0d                	jne    3d4 <strchr+0x24>
 3c7:	eb 17                	jmp    3e0 <strchr+0x30>
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d0:	38 ca                	cmp    %cl,%dl
 3d2:	74 0c                	je     3e0 <strchr+0x30>
  for(; *s; s++)
 3d4:	83 c0 01             	add    $0x1,%eax
 3d7:	0f b6 10             	movzbl (%eax),%edx
 3da:	84 d2                	test   %dl,%dl
 3dc:	75 f2                	jne    3d0 <strchr+0x20>
      return (char*)s;
  return 0;
 3de:	31 c0                	xor    %eax,%eax
}
 3e0:	5b                   	pop    %ebx
 3e1:	5d                   	pop    %ebp
 3e2:	c3                   	ret    
 3e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <gets>:

char*
gets(char *buf, int max)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3f6:	31 f6                	xor    %esi,%esi
 3f8:	89 f3                	mov    %esi,%ebx
{
 3fa:	83 ec 1c             	sub    $0x1c,%esp
 3fd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 400:	eb 2f                	jmp    431 <gets+0x41>
 402:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 408:	8d 45 e7             	lea    -0x19(%ebp),%eax
 40b:	83 ec 04             	sub    $0x4,%esp
 40e:	6a 01                	push   $0x1
 410:	50                   	push   %eax
 411:	6a 00                	push   $0x0
 413:	e8 32 01 00 00       	call   54a <read>
    if(cc < 1)
 418:	83 c4 10             	add    $0x10,%esp
 41b:	85 c0                	test   %eax,%eax
 41d:	7e 1c                	jle    43b <gets+0x4b>
      break;
    buf[i++] = c;
 41f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 423:	83 c7 01             	add    $0x1,%edi
 426:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 429:	3c 0a                	cmp    $0xa,%al
 42b:	74 23                	je     450 <gets+0x60>
 42d:	3c 0d                	cmp    $0xd,%al
 42f:	74 1f                	je     450 <gets+0x60>
  for(i=0; i+1 < max; ){
 431:	83 c3 01             	add    $0x1,%ebx
 434:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 437:	89 fe                	mov    %edi,%esi
 439:	7c cd                	jl     408 <gets+0x18>
 43b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 43d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 440:	c6 03 00             	movb   $0x0,(%ebx)
}
 443:	8d 65 f4             	lea    -0xc(%ebp),%esp
 446:	5b                   	pop    %ebx
 447:	5e                   	pop    %esi
 448:	5f                   	pop    %edi
 449:	5d                   	pop    %ebp
 44a:	c3                   	ret    
 44b:	90                   	nop
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 450:	8b 75 08             	mov    0x8(%ebp),%esi
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	01 de                	add    %ebx,%esi
 458:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 45a:	c6 03 00             	movb   $0x0,(%ebx)
}
 45d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 460:	5b                   	pop    %ebx
 461:	5e                   	pop    %esi
 462:	5f                   	pop    %edi
 463:	5d                   	pop    %ebp
 464:	c3                   	ret    
 465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000470 <stat>:

int
stat(char *n, struct stat *st)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	56                   	push   %esi
 474:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 475:	83 ec 08             	sub    $0x8,%esp
 478:	6a 00                	push   $0x0
 47a:	ff 75 08             	pushl  0x8(%ebp)
 47d:	e8 f0 00 00 00       	call   572 <open>
  if(fd < 0)
 482:	83 c4 10             	add    $0x10,%esp
 485:	85 c0                	test   %eax,%eax
 487:	78 27                	js     4b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 489:	83 ec 08             	sub    $0x8,%esp
 48c:	ff 75 0c             	pushl  0xc(%ebp)
 48f:	89 c3                	mov    %eax,%ebx
 491:	50                   	push   %eax
 492:	e8 f3 00 00 00       	call   58a <fstat>
  close(fd);
 497:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 49a:	89 c6                	mov    %eax,%esi
  close(fd);
 49c:	e8 b9 00 00 00       	call   55a <close>
  return r;
 4a1:	83 c4 10             	add    $0x10,%esp
}
 4a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4a7:	89 f0                	mov    %esi,%eax
 4a9:	5b                   	pop    %ebx
 4aa:	5e                   	pop    %esi
 4ab:	5d                   	pop    %ebp
 4ac:	c3                   	ret    
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 4b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4b5:	eb ed                	jmp    4a4 <stat+0x34>
 4b7:	89 f6                	mov    %esi,%esi
 4b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004c0 <atoi>:

int
atoi(const char *s)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	53                   	push   %ebx
 4c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4c7:	0f be 11             	movsbl (%ecx),%edx
 4ca:	8d 42 d0             	lea    -0x30(%edx),%eax
 4cd:	3c 09                	cmp    $0x9,%al
  n = 0;
 4cf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 4d4:	77 1f                	ja     4f5 <atoi+0x35>
 4d6:	8d 76 00             	lea    0x0(%esi),%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 4e0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 4e3:	83 c1 01             	add    $0x1,%ecx
 4e6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 4ea:	0f be 11             	movsbl (%ecx),%edx
 4ed:	8d 5a d0             	lea    -0x30(%edx),%ebx
 4f0:	80 fb 09             	cmp    $0x9,%bl
 4f3:	76 eb                	jbe    4e0 <atoi+0x20>
  return n;
}
 4f5:	5b                   	pop    %ebx
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret    
 4f8:	90                   	nop
 4f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000500 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	56                   	push   %esi
 504:	53                   	push   %ebx
 505:	8b 5d 10             	mov    0x10(%ebp),%ebx
 508:	8b 45 08             	mov    0x8(%ebp),%eax
 50b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 50e:	85 db                	test   %ebx,%ebx
 510:	7e 14                	jle    526 <memmove+0x26>
 512:	31 d2                	xor    %edx,%edx
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 518:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 51c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 51f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 522:	39 d3                	cmp    %edx,%ebx
 524:	75 f2                	jne    518 <memmove+0x18>
  return vdst;
}
 526:	5b                   	pop    %ebx
 527:	5e                   	pop    %esi
 528:	5d                   	pop    %ebp
 529:	c3                   	ret    

0000052a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 52a:	b8 01 00 00 00       	mov    $0x1,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <exit>:
SYSCALL(exit)
 532:	b8 02 00 00 00       	mov    $0x2,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <wait>:
SYSCALL(wait)
 53a:	b8 03 00 00 00       	mov    $0x3,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <pipe>:
SYSCALL(pipe)
 542:	b8 04 00 00 00       	mov    $0x4,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <read>:
SYSCALL(read)
 54a:	b8 05 00 00 00       	mov    $0x5,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <write>:
SYSCALL(write)
 552:	b8 10 00 00 00       	mov    $0x10,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <close>:
SYSCALL(close)
 55a:	b8 15 00 00 00       	mov    $0x15,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <kill>:
SYSCALL(kill)
 562:	b8 06 00 00 00       	mov    $0x6,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <exec>:
SYSCALL(exec)
 56a:	b8 07 00 00 00       	mov    $0x7,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <open>:
SYSCALL(open)
 572:	b8 0f 00 00 00       	mov    $0xf,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <mknod>:
SYSCALL(mknod)
 57a:	b8 11 00 00 00       	mov    $0x11,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <unlink>:
SYSCALL(unlink)
 582:	b8 12 00 00 00       	mov    $0x12,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <fstat>:
SYSCALL(fstat)
 58a:	b8 08 00 00 00       	mov    $0x8,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <link>:
SYSCALL(link)
 592:	b8 13 00 00 00       	mov    $0x13,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <mkdir>:
SYSCALL(mkdir)
 59a:	b8 14 00 00 00       	mov    $0x14,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <chdir>:
SYSCALL(chdir)
 5a2:	b8 09 00 00 00       	mov    $0x9,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <dup>:
SYSCALL(dup)
 5aa:	b8 0a 00 00 00       	mov    $0xa,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <getpid>:
SYSCALL(getpid)
 5b2:	b8 0b 00 00 00       	mov    $0xb,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <sbrk>:
SYSCALL(sbrk)
 5ba:	b8 0c 00 00 00       	mov    $0xc,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <sleep>:
SYSCALL(sleep)
 5c2:	b8 0d 00 00 00       	mov    $0xd,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <uptime>:
SYSCALL(uptime)
 5ca:	b8 0e 00 00 00       	mov    $0xe,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <countTraps>:
# system call count trap
SYSCALL(countTraps)
 5d2:	b8 16 00 00 00       	mov    $0x16,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    
 5da:	66 90                	xchg   %ax,%ax
 5dc:	66 90                	xchg   %ax,%ax
 5de:	66 90                	xchg   %ax,%ax

000005e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
 5e6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5e9:	85 d2                	test   %edx,%edx
{
 5eb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 5ee:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 5f0:	79 76                	jns    668 <printint+0x88>
 5f2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5f6:	74 70                	je     668 <printint+0x88>
    x = -xx;
 5f8:	f7 d8                	neg    %eax
    neg = 1;
 5fa:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 601:	31 f6                	xor    %esi,%esi
 603:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 606:	eb 0a                	jmp    612 <printint+0x32>
 608:	90                   	nop
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 610:	89 fe                	mov    %edi,%esi
 612:	31 d2                	xor    %edx,%edx
 614:	8d 7e 01             	lea    0x1(%esi),%edi
 617:	f7 f1                	div    %ecx
 619:	0f b6 92 e8 0c 00 00 	movzbl 0xce8(%edx),%edx
  }while((x /= base) != 0);
 620:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 622:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 625:	75 e9                	jne    610 <printint+0x30>
  if(neg)
 627:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 62a:	85 c0                	test   %eax,%eax
 62c:	74 08                	je     636 <printint+0x56>
    buf[i++] = '-';
 62e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 633:	8d 7e 02             	lea    0x2(%esi),%edi
 636:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 63a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 63d:	8d 76 00             	lea    0x0(%esi),%esi
 640:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 643:	83 ec 04             	sub    $0x4,%esp
 646:	83 ee 01             	sub    $0x1,%esi
 649:	6a 01                	push   $0x1
 64b:	53                   	push   %ebx
 64c:	57                   	push   %edi
 64d:	88 45 d7             	mov    %al,-0x29(%ebp)
 650:	e8 fd fe ff ff       	call   552 <write>

  while(--i >= 0)
 655:	83 c4 10             	add    $0x10,%esp
 658:	39 de                	cmp    %ebx,%esi
 65a:	75 e4                	jne    640 <printint+0x60>
    putc(fd, buf[i]);
}
 65c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 65f:	5b                   	pop    %ebx
 660:	5e                   	pop    %esi
 661:	5f                   	pop    %edi
 662:	5d                   	pop    %ebp
 663:	c3                   	ret    
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 668:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 66f:	eb 90                	jmp    601 <printint+0x21>
 671:	eb 0d                	jmp    680 <printf>
 673:	90                   	nop
 674:	90                   	nop
 675:	90                   	nop
 676:	90                   	nop
 677:	90                   	nop
 678:	90                   	nop
 679:	90                   	nop
 67a:	90                   	nop
 67b:	90                   	nop
 67c:	90                   	nop
 67d:	90                   	nop
 67e:	90                   	nop
 67f:	90                   	nop

00000680 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 689:	8b 75 0c             	mov    0xc(%ebp),%esi
 68c:	0f b6 1e             	movzbl (%esi),%ebx
 68f:	84 db                	test   %bl,%bl
 691:	0f 84 b3 00 00 00    	je     74a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 697:	8d 45 10             	lea    0x10(%ebp),%eax
 69a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 69d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 69f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6a2:	eb 2f                	jmp    6d3 <printf+0x53>
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6a8:	83 f8 25             	cmp    $0x25,%eax
 6ab:	0f 84 a7 00 00 00    	je     758 <printf+0xd8>
  write(fd, &c, 1);
 6b1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 6b4:	83 ec 04             	sub    $0x4,%esp
 6b7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 6ba:	6a 01                	push   $0x1
 6bc:	50                   	push   %eax
 6bd:	ff 75 08             	pushl  0x8(%ebp)
 6c0:	e8 8d fe ff ff       	call   552 <write>
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 6cb:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 6cf:	84 db                	test   %bl,%bl
 6d1:	74 77                	je     74a <printf+0xca>
    if(state == 0){
 6d3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 6d5:	0f be cb             	movsbl %bl,%ecx
 6d8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6db:	74 cb                	je     6a8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 6dd:	83 ff 25             	cmp    $0x25,%edi
 6e0:	75 e6                	jne    6c8 <printf+0x48>
      if(c == 'd'){
 6e2:	83 f8 64             	cmp    $0x64,%eax
 6e5:	0f 84 05 01 00 00    	je     7f0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6eb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6f1:	83 f9 70             	cmp    $0x70,%ecx
 6f4:	74 72                	je     768 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6f6:	83 f8 73             	cmp    $0x73,%eax
 6f9:	0f 84 99 00 00 00    	je     798 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ff:	83 f8 63             	cmp    $0x63,%eax
 702:	0f 84 08 01 00 00    	je     810 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 708:	83 f8 25             	cmp    $0x25,%eax
 70b:	0f 84 ef 00 00 00    	je     800 <printf+0x180>
  write(fd, &c, 1);
 711:	8d 45 e7             	lea    -0x19(%ebp),%eax
 714:	83 ec 04             	sub    $0x4,%esp
 717:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 71b:	6a 01                	push   $0x1
 71d:	50                   	push   %eax
 71e:	ff 75 08             	pushl  0x8(%ebp)
 721:	e8 2c fe ff ff       	call   552 <write>
 726:	83 c4 0c             	add    $0xc,%esp
 729:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 72c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 72f:	6a 01                	push   $0x1
 731:	50                   	push   %eax
 732:	ff 75 08             	pushl  0x8(%ebp)
 735:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 738:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 73a:	e8 13 fe ff ff       	call   552 <write>
  for(i = 0; fmt[i]; i++){
 73f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 743:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 746:	84 db                	test   %bl,%bl
 748:	75 89                	jne    6d3 <printf+0x53>
    }
  }
}
 74a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 74d:	5b                   	pop    %ebx
 74e:	5e                   	pop    %esi
 74f:	5f                   	pop    %edi
 750:	5d                   	pop    %ebp
 751:	c3                   	ret    
 752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 758:	bf 25 00 00 00       	mov    $0x25,%edi
 75d:	e9 66 ff ff ff       	jmp    6c8 <printf+0x48>
 762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 768:	83 ec 0c             	sub    $0xc,%esp
 76b:	b9 10 00 00 00       	mov    $0x10,%ecx
 770:	6a 00                	push   $0x0
 772:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 775:	8b 45 08             	mov    0x8(%ebp),%eax
 778:	8b 17                	mov    (%edi),%edx
 77a:	e8 61 fe ff ff       	call   5e0 <printint>
        ap++;
 77f:	89 f8                	mov    %edi,%eax
 781:	83 c4 10             	add    $0x10,%esp
      state = 0;
 784:	31 ff                	xor    %edi,%edi
        ap++;
 786:	83 c0 04             	add    $0x4,%eax
 789:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 78c:	e9 37 ff ff ff       	jmp    6c8 <printf+0x48>
 791:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 798:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 79b:	8b 08                	mov    (%eax),%ecx
        ap++;
 79d:	83 c0 04             	add    $0x4,%eax
 7a0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 7a3:	85 c9                	test   %ecx,%ecx
 7a5:	0f 84 8e 00 00 00    	je     839 <printf+0x1b9>
        while(*s != 0){
 7ab:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 7ae:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 7b0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 7b2:	84 c0                	test   %al,%al
 7b4:	0f 84 0e ff ff ff    	je     6c8 <printf+0x48>
 7ba:	89 75 d0             	mov    %esi,-0x30(%ebp)
 7bd:	89 de                	mov    %ebx,%esi
 7bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7c2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 7c5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7c8:	83 ec 04             	sub    $0x4,%esp
          s++;
 7cb:	83 c6 01             	add    $0x1,%esi
 7ce:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 7d1:	6a 01                	push   $0x1
 7d3:	57                   	push   %edi
 7d4:	53                   	push   %ebx
 7d5:	e8 78 fd ff ff       	call   552 <write>
        while(*s != 0){
 7da:	0f b6 06             	movzbl (%esi),%eax
 7dd:	83 c4 10             	add    $0x10,%esp
 7e0:	84 c0                	test   %al,%al
 7e2:	75 e4                	jne    7c8 <printf+0x148>
 7e4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 7e7:	31 ff                	xor    %edi,%edi
 7e9:	e9 da fe ff ff       	jmp    6c8 <printf+0x48>
 7ee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 7f0:	83 ec 0c             	sub    $0xc,%esp
 7f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7f8:	6a 01                	push   $0x1
 7fa:	e9 73 ff ff ff       	jmp    772 <printf+0xf2>
 7ff:	90                   	nop
  write(fd, &c, 1);
 800:	83 ec 04             	sub    $0x4,%esp
 803:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 806:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 809:	6a 01                	push   $0x1
 80b:	e9 21 ff ff ff       	jmp    731 <printf+0xb1>
        putc(fd, *ap);
 810:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 813:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 816:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 818:	6a 01                	push   $0x1
        ap++;
 81a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 81d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 820:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 823:	50                   	push   %eax
 824:	ff 75 08             	pushl  0x8(%ebp)
 827:	e8 26 fd ff ff       	call   552 <write>
        ap++;
 82c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 82f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 832:	31 ff                	xor    %edi,%edi
 834:	e9 8f fe ff ff       	jmp    6c8 <printf+0x48>
          s = "(null)";
 839:	bb de 0c 00 00       	mov    $0xcde,%ebx
        while(*s != 0){
 83e:	b8 28 00 00 00       	mov    $0x28,%eax
 843:	e9 72 ff ff ff       	jmp    7ba <printf+0x13a>
 848:	66 90                	xchg   %ax,%ax
 84a:	66 90                	xchg   %ax,%ax
 84c:	66 90                	xchg   %ax,%ax
 84e:	66 90                	xchg   %ax,%ax

00000850 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 850:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 851:	a1 98 0f 00 00       	mov    0xf98,%eax
{
 856:	89 e5                	mov    %esp,%ebp
 858:	57                   	push   %edi
 859:	56                   	push   %esi
 85a:	53                   	push   %ebx
 85b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 85e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 868:	39 c8                	cmp    %ecx,%eax
 86a:	8b 10                	mov    (%eax),%edx
 86c:	73 32                	jae    8a0 <free+0x50>
 86e:	39 d1                	cmp    %edx,%ecx
 870:	72 04                	jb     876 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 872:	39 d0                	cmp    %edx,%eax
 874:	72 32                	jb     8a8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 876:	8b 73 fc             	mov    -0x4(%ebx),%esi
 879:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 87c:	39 fa                	cmp    %edi,%edx
 87e:	74 30                	je     8b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 880:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 883:	8b 50 04             	mov    0x4(%eax),%edx
 886:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 889:	39 f1                	cmp    %esi,%ecx
 88b:	74 3a                	je     8c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 88d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 88f:	a3 98 0f 00 00       	mov    %eax,0xf98
}
 894:	5b                   	pop    %ebx
 895:	5e                   	pop    %esi
 896:	5f                   	pop    %edi
 897:	5d                   	pop    %ebp
 898:	c3                   	ret    
 899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a0:	39 d0                	cmp    %edx,%eax
 8a2:	72 04                	jb     8a8 <free+0x58>
 8a4:	39 d1                	cmp    %edx,%ecx
 8a6:	72 ce                	jb     876 <free+0x26>
{
 8a8:	89 d0                	mov    %edx,%eax
 8aa:	eb bc                	jmp    868 <free+0x18>
 8ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 8b0:	03 72 04             	add    0x4(%edx),%esi
 8b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8b6:	8b 10                	mov    (%eax),%edx
 8b8:	8b 12                	mov    (%edx),%edx
 8ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8bd:	8b 50 04             	mov    0x4(%eax),%edx
 8c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8c3:	39 f1                	cmp    %esi,%ecx
 8c5:	75 c6                	jne    88d <free+0x3d>
    p->s.size += bp->s.size;
 8c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 8ca:	a3 98 0f 00 00       	mov    %eax,0xf98
    p->s.size += bp->s.size;
 8cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8d2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8d5:	89 10                	mov    %edx,(%eax)
}
 8d7:	5b                   	pop    %ebx
 8d8:	5e                   	pop    %esi
 8d9:	5f                   	pop    %edi
 8da:	5d                   	pop    %ebp
 8db:	c3                   	ret    
 8dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	57                   	push   %edi
 8e4:	56                   	push   %esi
 8e5:	53                   	push   %ebx
 8e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8ec:	8b 15 98 0f 00 00    	mov    0xf98,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8f2:	8d 78 07             	lea    0x7(%eax),%edi
 8f5:	c1 ef 03             	shr    $0x3,%edi
 8f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 8fb:	85 d2                	test   %edx,%edx
 8fd:	0f 84 9d 00 00 00    	je     9a0 <malloc+0xc0>
 903:	8b 02                	mov    (%edx),%eax
 905:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 908:	39 cf                	cmp    %ecx,%edi
 90a:	76 6c                	jbe    978 <malloc+0x98>
 90c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 912:	bb 00 10 00 00       	mov    $0x1000,%ebx
 917:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 91a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 921:	eb 0e                	jmp    931 <malloc+0x51>
 923:	90                   	nop
 924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 928:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 92a:	8b 48 04             	mov    0x4(%eax),%ecx
 92d:	39 f9                	cmp    %edi,%ecx
 92f:	73 47                	jae    978 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 931:	39 05 98 0f 00 00    	cmp    %eax,0xf98
 937:	89 c2                	mov    %eax,%edx
 939:	75 ed                	jne    928 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 93b:	83 ec 0c             	sub    $0xc,%esp
 93e:	56                   	push   %esi
 93f:	e8 76 fc ff ff       	call   5ba <sbrk>
  if(p == (char*)-1)
 944:	83 c4 10             	add    $0x10,%esp
 947:	83 f8 ff             	cmp    $0xffffffff,%eax
 94a:	74 1c                	je     968 <malloc+0x88>
  hp->s.size = nu;
 94c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 94f:	83 ec 0c             	sub    $0xc,%esp
 952:	83 c0 08             	add    $0x8,%eax
 955:	50                   	push   %eax
 956:	e8 f5 fe ff ff       	call   850 <free>
  return freep;
 95b:	8b 15 98 0f 00 00    	mov    0xf98,%edx
      if((p = morecore(nunits)) == 0)
 961:	83 c4 10             	add    $0x10,%esp
 964:	85 d2                	test   %edx,%edx
 966:	75 c0                	jne    928 <malloc+0x48>
        return 0;
  }
}
 968:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 96b:	31 c0                	xor    %eax,%eax
}
 96d:	5b                   	pop    %ebx
 96e:	5e                   	pop    %esi
 96f:	5f                   	pop    %edi
 970:	5d                   	pop    %ebp
 971:	c3                   	ret    
 972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 978:	39 cf                	cmp    %ecx,%edi
 97a:	74 54                	je     9d0 <malloc+0xf0>
        p->s.size -= nunits;
 97c:	29 f9                	sub    %edi,%ecx
 97e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 981:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 984:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 987:	89 15 98 0f 00 00    	mov    %edx,0xf98
}
 98d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 990:	83 c0 08             	add    $0x8,%eax
}
 993:	5b                   	pop    %ebx
 994:	5e                   	pop    %esi
 995:	5f                   	pop    %edi
 996:	5d                   	pop    %ebp
 997:	c3                   	ret    
 998:	90                   	nop
 999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 9a0:	c7 05 98 0f 00 00 9c 	movl   $0xf9c,0xf98
 9a7:	0f 00 00 
 9aa:	c7 05 9c 0f 00 00 9c 	movl   $0xf9c,0xf9c
 9b1:	0f 00 00 
    base.s.size = 0;
 9b4:	b8 9c 0f 00 00       	mov    $0xf9c,%eax
 9b9:	c7 05 a0 0f 00 00 00 	movl   $0x0,0xfa0
 9c0:	00 00 00 
 9c3:	e9 44 ff ff ff       	jmp    90c <malloc+0x2c>
 9c8:	90                   	nop
 9c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 9d0:	8b 08                	mov    (%eax),%ecx
 9d2:	89 0a                	mov    %ecx,(%edx)
 9d4:	eb b1                	jmp    987 <malloc+0xa7>

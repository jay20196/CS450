# CS450 Operating Systems

Jay Patel
A20328510
jpatel71@hawk.iit.edu

## Programming Assignment 1

### Introduction
The code that was given to us from the MIT xv-6 repository already had the > or redirect operator implemented, so no changes had to be made to that part of the sh.c file. This part of the code has been highlighted with comments for reference.

### Changes Made...

The Prompt for the shell was changed to `CS450$` in section of `getcmd`:

```
int
getcmd(char *buf, int nbuf)
{
  /*--------------------/
  /CS 450 Prompt Command/
  *--------------------*/
  printf(2, "CS450$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}

```

`echo`, `wc`, `cat`, `ls`, `rm` are some system calls that work with this program.

The file was changed to add the `#define ORD 6` representation for parallel commands. These were the structures defined for the redirect and parallel functions

```
/*----------------/
  Ordered Command Struct
/----------------*/
struct ordcmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};


/*----------------/
  Redirect Command Struct
/----------------*/
struct redircmd {
  int type;
  struct cmd *cmd;
  char *file;
  char *efile;
  int mode;
  int fd;
};

```

Other Changes were made to the Constructor for adding Ordered Command to follow sequence after `;` :

```
  /*---------------------/
 /ORD Constructors    /
/---------------------*/

struct cmd* ordcmd(struct cmd *left, struct cmd *right)
{
  struct ordcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = ORD;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;

}

```

In order to parse the commands we changed:
```
  Parsing ordcmd 
  ------------------------*/

  if(peek(ps, es, "()")){
    gettoken(ps, es, 0, 0);
    cmd = ordcmd(cmd, parseline(ps, es));
  }

  return cmd;
}

```

### Build XV6 

Simply Run `make` Comand while in /xv6 directory:
``$ make``
After successfully building, Launch QEMU by typing:

`` $ make qemu-nox``

### Test Cases
1. Ordered Operation

``CS450$ echo A; echo "Hello CS450!!" > file1; ls``

This uses `echo` function in different ways, as well as list the given file, that will be make only after it echo Hello world to File1

2. Complex Operation

``CS450$ wc file1; rm file1; ls``

This case shows that all the commands are run only after the previous(left) finishes

3.	Subshell

```CS450$ echo A; (echo B; echo C )```

The command runs the B and C first then A.


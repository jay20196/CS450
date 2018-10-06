
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    if (buf[0] == 0) // EOF
        return -1;
    return 0;
}

int main(void) {
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
    static char buf[100];
    int fd;

    // Ensure that three file descriptors are open.
    while ((fd = open("console", O_RDWR)) >= 0) {
      11:	eb 0a                	jmp    1d <main+0x1d>
      13:	90                   	nop
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if (fd >= 3) {
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	7f 76                	jg     93 <main+0x93>
    while ((fd = open("console", O_RDWR)) >= 0) {
      1d:	83 ec 08             	sub    $0x8,%esp
      20:	6a 02                	push   $0x2
      22:	68 1e 13 00 00       	push   $0x131e
      27:	e8 e6 0d 00 00       	call   e12 <open>
      2c:	83 c4 10             	add    $0x10,%esp
      2f:	85 c0                	test   %eax,%eax
      31:	79 e5                	jns    18 <main+0x18>
      33:	eb 1f                	jmp    54 <main+0x54>
      35:	8d 76 00             	lea    0x0(%esi),%esi
        }
    }

    // Read and run input commands.
    while (getcmd(buf, sizeof(buf)) >= 0) {
        if (buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' ') {
      38:	80 3d 82 19 00 00 20 	cmpb   $0x20,0x1982
      3f:	74 7a                	je     bb <main+0xbb>
}

int fork1(void) {
    int pid;

    pid = fork();
      41:	e8 84 0d 00 00       	call   dca <fork>
    if (pid == -1)
      46:	83 f8 ff             	cmp    $0xffffffff,%eax
      49:	74 3b                	je     86 <main+0x86>
        if (fork1() == 0)
      4b:	85 c0                	test   %eax,%eax
      4d:	74 57                	je     a6 <main+0xa6>
        wait();
      4f:	e8 86 0d 00 00       	call   dda <wait>
    while (getcmd(buf, sizeof(buf)) >= 0) {
      54:	83 ec 08             	sub    $0x8,%esp
      57:	6a 64                	push   $0x64
      59:	68 80 19 00 00       	push   $0x1980
      5e:	e8 9d 00 00 00       	call   100 <getcmd>
      63:	83 c4 10             	add    $0x10,%esp
      66:	85 c0                	test   %eax,%eax
      68:	78 37                	js     a1 <main+0xa1>
        if (buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' ') {
      6a:	80 3d 80 19 00 00 63 	cmpb   $0x63,0x1980
      71:	75 ce                	jne    41 <main+0x41>
      73:	80 3d 81 19 00 00 64 	cmpb   $0x64,0x1981
      7a:	74 bc                	je     38 <main+0x38>
    pid = fork();
      7c:	e8 49 0d 00 00       	call   dca <fork>
    if (pid == -1)
      81:	83 f8 ff             	cmp    $0xffffffff,%eax
      84:	75 c5                	jne    4b <main+0x4b>
        panic("fork");
      86:	83 ec 0c             	sub    $0xc,%esp
      89:	68 a7 12 00 00       	push   $0x12a7
      8e:	e8 bd 00 00 00       	call   150 <panic>
            close(fd);
      93:	83 ec 0c             	sub    $0xc,%esp
      96:	50                   	push   %eax
      97:	e8 5e 0d 00 00       	call   dfa <close>
            break;
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	eb b3                	jmp    54 <main+0x54>
    exit();
      a1:	e8 2c 0d 00 00       	call   dd2 <exit>
            runcmd(parsecmd(buf));
      a6:	83 ec 0c             	sub    $0xc,%esp
      a9:	68 80 19 00 00       	push   $0x1980
      ae:	e8 5d 0a 00 00       	call   b10 <parsecmd>
      b3:	89 04 24             	mov    %eax,(%esp)
      b6:	e8 b5 00 00 00       	call   170 <runcmd>
            buf[strlen(buf) - 1] = 0;  // chop \n
      bb:	83 ec 0c             	sub    $0xc,%esp
      be:	68 80 19 00 00       	push   $0x1980
      c3:	e8 38 0b 00 00       	call   c00 <strlen>
            if (chdir(buf + 3) < 0)
      c8:	c7 04 24 83 19 00 00 	movl   $0x1983,(%esp)
            buf[strlen(buf) - 1] = 0;  // chop \n
      cf:	c6 80 7f 19 00 00 00 	movb   $0x0,0x197f(%eax)
            if (chdir(buf + 3) < 0)
      d6:	e8 67 0d 00 00       	call   e42 <chdir>
      db:	83 c4 10             	add    $0x10,%esp
      de:	85 c0                	test   %eax,%eax
      e0:	0f 89 6e ff ff ff    	jns    54 <main+0x54>
                printf(2, "cannot cd %s\n", buf + 3);
      e6:	50                   	push   %eax
      e7:	68 83 19 00 00       	push   $0x1983
      ec:	68 26 13 00 00       	push   $0x1326
      f1:	6a 02                	push   $0x2
      f3:	e8 28 0e 00 00       	call   f20 <printf>
      f8:	83 c4 10             	add    $0x10,%esp
      fb:	e9 54 ff ff ff       	jmp    54 <main+0x54>

00000100 <getcmd>:
int getcmd(char *buf, int nbuf) {
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	56                   	push   %esi
     104:	53                   	push   %ebx
     105:	8b 75 0c             	mov    0xc(%ebp),%esi
     108:	8b 5d 08             	mov    0x8(%ebp),%ebx
    printf(2, "CS450$ ");
     10b:	83 ec 08             	sub    $0x8,%esp
     10e:	68 78 12 00 00       	push   $0x1278
     113:	6a 02                	push   $0x2
     115:	e8 06 0e 00 00       	call   f20 <printf>
    memset(buf, 0, nbuf);
     11a:	83 c4 0c             	add    $0xc,%esp
     11d:	56                   	push   %esi
     11e:	6a 00                	push   $0x0
     120:	53                   	push   %ebx
     121:	e8 0a 0b 00 00       	call   c30 <memset>
    gets(buf, nbuf);
     126:	58                   	pop    %eax
     127:	5a                   	pop    %edx
     128:	56                   	push   %esi
     129:	53                   	push   %ebx
     12a:	e8 61 0b 00 00       	call   c90 <gets>
    if (buf[0] == 0) // EOF
     12f:	83 c4 10             	add    $0x10,%esp
     132:	31 c0                	xor    %eax,%eax
     134:	80 3b 00             	cmpb   $0x0,(%ebx)
     137:	0f 94 c0             	sete   %al
}
     13a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    if (buf[0] == 0) // EOF
     13d:	f7 d8                	neg    %eax
}
     13f:	5b                   	pop    %ebx
     140:	5e                   	pop    %esi
     141:	5d                   	pop    %ebp
     142:	c3                   	ret    
     143:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <panic>:
void panic(char *s) {
     150:	55                   	push   %ebp
     151:	89 e5                	mov    %esp,%ebp
     153:	83 ec 0c             	sub    $0xc,%esp
    printf(2, "%s\n", s);
     156:	ff 75 08             	pushl  0x8(%ebp)
     159:	68 1a 13 00 00       	push   $0x131a
     15e:	6a 02                	push   $0x2
     160:	e8 bb 0d 00 00       	call   f20 <printf>
    exit();
     165:	e8 68 0c 00 00       	call   dd2 <exit>
     16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <runcmd>:
void runcmd(struct cmd *cmd) {
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	53                   	push   %ebx
     174:	83 ec 14             	sub    $0x14,%esp
     177:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if (cmd == 0)
     17a:	85 db                	test   %ebx,%ebx
     17c:	74 48                	je     1c6 <runcmd+0x56>
    switch (cmd->type) {
     17e:	83 3b 06             	cmpl   $0x6,(%ebx)
     181:	0f 87 46 01 00 00    	ja     2cd <runcmd+0x15d>
     187:	8b 03                	mov    (%ebx),%eax
     189:	ff 24 85 34 13 00 00 	jmp    *0x1334(,%eax,4)
    pid = fork();
     190:	e8 35 0c 00 00       	call   dca <fork>
    if (pid == -1)
     195:	83 f8 ff             	cmp    $0xffffffff,%eax
     198:	0f 84 3c 01 00 00    	je     2da <runcmd+0x16a>
            if (fork1() == 0)
     19e:	85 c0                	test   %eax,%eax
     1a0:	0f 84 1c 01 00 00    	je     2c2 <runcmd+0x152>
    pid = fork();
     1a6:	e8 1f 0c 00 00       	call   dca <fork>
    if (pid == -1)
     1ab:	83 f8 ff             	cmp    $0xffffffff,%eax
     1ae:	0f 84 26 01 00 00    	je     2da <runcmd+0x16a>
            if (fork1() == 0)
     1b4:	85 c0                	test   %eax,%eax
     1b6:	0f 84 38 01 00 00    	je     2f4 <runcmd+0x184>
            wait();
     1bc:	e8 19 0c 00 00       	call   dda <wait>
            wait();
     1c1:	e8 14 0c 00 00       	call   dda <wait>
        exit();
     1c6:	e8 07 0c 00 00       	call   dd2 <exit>
            if (ecmd->argv[0] == 0)
     1cb:	8b 43 04             	mov    0x4(%ebx),%eax
     1ce:	85 c0                	test   %eax,%eax
     1d0:	74 f4                	je     1c6 <runcmd+0x56>
            exec(ecmd->argv[0], ecmd->argv);
     1d2:	52                   	push   %edx
     1d3:	52                   	push   %edx
     1d4:	8d 53 04             	lea    0x4(%ebx),%edx
     1d7:	52                   	push   %edx
     1d8:	50                   	push   %eax
     1d9:	e8 2c 0c 00 00       	call   e0a <exec>
            printf(2, "exec %s failed\n", ecmd->argv[0]);
     1de:	83 c4 0c             	add    $0xc,%esp
     1e1:	ff 73 04             	pushl  0x4(%ebx)
     1e4:	68 87 12 00 00       	push   $0x1287
     1e9:	6a 02                	push   $0x2
     1eb:	e8 30 0d 00 00       	call   f20 <printf>
            break;
     1f0:	83 c4 10             	add    $0x10,%esp
     1f3:	eb d1                	jmp    1c6 <runcmd+0x56>
            close(rcmd->fd);
     1f5:	83 ec 0c             	sub    $0xc,%esp
     1f8:	ff 73 14             	pushl  0x14(%ebx)
     1fb:	e8 fa 0b 00 00       	call   dfa <close>
            if (open(rcmd->file, rcmd->mode) < 0) {
     200:	59                   	pop    %ecx
     201:	58                   	pop    %eax
     202:	ff 73 10             	pushl  0x10(%ebx)
     205:	ff 73 08             	pushl  0x8(%ebx)
     208:	e8 05 0c 00 00       	call   e12 <open>
     20d:	83 c4 10             	add    $0x10,%esp
     210:	85 c0                	test   %eax,%eax
     212:	0f 89 aa 00 00 00    	jns    2c2 <runcmd+0x152>
                printf(2, "open %s failed\n", rcmd->file);
     218:	52                   	push   %edx
     219:	ff 73 08             	pushl  0x8(%ebx)
     21c:	68 97 12 00 00       	push   $0x1297
     221:	6a 02                	push   $0x2
     223:	e8 f8 0c 00 00       	call   f20 <printf>
                exit();
     228:	e8 a5 0b 00 00       	call   dd2 <exit>
            if (pipe(p) < 0)
     22d:	8d 45 f0             	lea    -0x10(%ebp),%eax
     230:	83 ec 0c             	sub    $0xc,%esp
     233:	50                   	push   %eax
     234:	e8 a9 0b 00 00       	call   de2 <pipe>
     239:	83 c4 10             	add    $0x10,%esp
     23c:	85 c0                	test   %eax,%eax
     23e:	0f 88 a3 00 00 00    	js     2e7 <runcmd+0x177>
    pid = fork();
     244:	e8 81 0b 00 00       	call   dca <fork>
    if (pid == -1)
     249:	83 f8 ff             	cmp    $0xffffffff,%eax
     24c:	0f 84 88 00 00 00    	je     2da <runcmd+0x16a>
            if (fork1() == 0) {
     252:	85 c0                	test   %eax,%eax
     254:	0f 84 a5 00 00 00    	je     2ff <runcmd+0x18f>
    pid = fork();
     25a:	e8 6b 0b 00 00       	call   dca <fork>
    if (pid == -1)
     25f:	83 f8 ff             	cmp    $0xffffffff,%eax
     262:	74 76                	je     2da <runcmd+0x16a>
            if (fork1() == 0) {
     264:	85 c0                	test   %eax,%eax
     266:	0f 84 c1 00 00 00    	je     32d <runcmd+0x1bd>
            close(p[0]);
     26c:	83 ec 0c             	sub    $0xc,%esp
     26f:	ff 75 f0             	pushl  -0x10(%ebp)
     272:	e8 83 0b 00 00       	call   dfa <close>
            close(p[1]);
     277:	58                   	pop    %eax
     278:	ff 75 f4             	pushl  -0xc(%ebp)
     27b:	e8 7a 0b 00 00       	call   dfa <close>
            wait();
     280:	e8 55 0b 00 00       	call   dda <wait>
            wait();
     285:	e8 50 0b 00 00       	call   dda <wait>
            break;
     28a:	83 c4 10             	add    $0x10,%esp
     28d:	e9 34 ff ff ff       	jmp    1c6 <runcmd+0x56>
    pid = fork();
     292:	e8 33 0b 00 00       	call   dca <fork>
    if (pid == -1)
     297:	83 f8 ff             	cmp    $0xffffffff,%eax
     29a:	74 3e                	je     2da <runcmd+0x16a>
            if (fork1() == 0)
     29c:	85 c0                	test   %eax,%eax
     29e:	74 22                	je     2c2 <runcmd+0x152>
            wait();
     2a0:	e8 35 0b 00 00       	call   dda <wait>
            runcmd(lcmd->right);
     2a5:	83 ec 0c             	sub    $0xc,%esp
     2a8:	ff 73 08             	pushl  0x8(%ebx)
     2ab:	e8 c0 fe ff ff       	call   170 <runcmd>
    pid = fork();
     2b0:	e8 15 0b 00 00       	call   dca <fork>
    if (pid == -1)
     2b5:	83 f8 ff             	cmp    $0xffffffff,%eax
     2b8:	74 20                	je     2da <runcmd+0x16a>
            if (fork1() == 0)
     2ba:	85 c0                	test   %eax,%eax
     2bc:	0f 85 04 ff ff ff    	jne    1c6 <runcmd+0x56>
                runcmd(ocmd->left);
     2c2:	83 ec 0c             	sub    $0xc,%esp
     2c5:	ff 73 04             	pushl  0x4(%ebx)
     2c8:	e8 a3 fe ff ff       	call   170 <runcmd>
            panic("runcmd");
     2cd:	83 ec 0c             	sub    $0xc,%esp
     2d0:	68 80 12 00 00       	push   $0x1280
     2d5:	e8 76 fe ff ff       	call   150 <panic>
        panic("fork");
     2da:	83 ec 0c             	sub    $0xc,%esp
     2dd:	68 a7 12 00 00       	push   $0x12a7
     2e2:	e8 69 fe ff ff       	call   150 <panic>
                panic("pipe");
     2e7:	83 ec 0c             	sub    $0xc,%esp
     2ea:	68 ac 12 00 00       	push   $0x12ac
     2ef:	e8 5c fe ff ff       	call   150 <panic>
                runcmd(ocmd->right);
     2f4:	83 ec 0c             	sub    $0xc,%esp
     2f7:	ff 73 08             	pushl  0x8(%ebx)
     2fa:	e8 71 fe ff ff       	call   170 <runcmd>
                close(1);
     2ff:	83 ec 0c             	sub    $0xc,%esp
     302:	6a 01                	push   $0x1
     304:	e8 f1 0a 00 00       	call   dfa <close>
                dup(p[1]);
     309:	58                   	pop    %eax
     30a:	ff 75 f4             	pushl  -0xc(%ebp)
     30d:	e8 38 0b 00 00       	call   e4a <dup>
                close(p[0]);
     312:	58                   	pop    %eax
     313:	ff 75 f0             	pushl  -0x10(%ebp)
     316:	e8 df 0a 00 00       	call   dfa <close>
                close(p[1]);
     31b:	58                   	pop    %eax
     31c:	ff 75 f4             	pushl  -0xc(%ebp)
     31f:	e8 d6 0a 00 00       	call   dfa <close>
                runcmd(pcmd->left);
     324:	58                   	pop    %eax
     325:	ff 73 04             	pushl  0x4(%ebx)
     328:	e8 43 fe ff ff       	call   170 <runcmd>
                close(0);
     32d:	83 ec 0c             	sub    $0xc,%esp
     330:	6a 00                	push   $0x0
     332:	e8 c3 0a 00 00       	call   dfa <close>
                dup(p[0]);
     337:	5a                   	pop    %edx
     338:	ff 75 f0             	pushl  -0x10(%ebp)
     33b:	e8 0a 0b 00 00       	call   e4a <dup>
                close(p[0]);
     340:	59                   	pop    %ecx
     341:	ff 75 f0             	pushl  -0x10(%ebp)
     344:	e8 b1 0a 00 00       	call   dfa <close>
                close(p[1]);
     349:	58                   	pop    %eax
     34a:	ff 75 f4             	pushl  -0xc(%ebp)
     34d:	e8 a8 0a 00 00       	call   dfa <close>
                runcmd(pcmd->right);
     352:	58                   	pop    %eax
     353:	ff 73 08             	pushl  0x8(%ebx)
     356:	e8 15 fe ff ff       	call   170 <runcmd>
     35b:	90                   	nop
     35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <fork1>:
int fork1(void) {
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	83 ec 08             	sub    $0x8,%esp
    pid = fork();
     366:	e8 5f 0a 00 00       	call   dca <fork>
    if (pid == -1)
     36b:	83 f8 ff             	cmp    $0xffffffff,%eax
     36e:	74 02                	je     372 <fork1+0x12>
    return pid;
}
     370:	c9                   	leave  
     371:	c3                   	ret    
        panic("fork");
     372:	83 ec 0c             	sub    $0xc,%esp
     375:	68 a7 12 00 00       	push   $0x12a7
     37a:	e8 d1 fd ff ff       	call   150 <panic>
     37f:	90                   	nop

00000380 <execcmd>:

//PAGEBREAK!
// Constructors

struct cmd *execcmd(void) {
     380:	55                   	push   %ebp
     381:	89 e5                	mov    %esp,%ebp
     383:	53                   	push   %ebx
     384:	83 ec 10             	sub    $0x10,%esp
    struct execcmd *cmd;

    cmd = malloc(sizeof(*cmd));
     387:	6a 54                	push   $0x54
     389:	e8 f2 0d 00 00       	call   1180 <malloc>
    memset(cmd, 0, sizeof(*cmd));
     38e:	83 c4 0c             	add    $0xc,%esp
    cmd = malloc(sizeof(*cmd));
     391:	89 c3                	mov    %eax,%ebx
    memset(cmd, 0, sizeof(*cmd));
     393:	6a 54                	push   $0x54
     395:	6a 00                	push   $0x0
     397:	50                   	push   %eax
     398:	e8 93 08 00 00       	call   c30 <memset>
    cmd->type = EXEC;
     39d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    return (struct cmd *) cmd;
}
     3a3:	89 d8                	mov    %ebx,%eax
     3a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3a8:	c9                   	leave  
     3a9:	c3                   	ret    
     3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003b0 <redircmd>:

/*-------------------------------*/
/* REDIRECT COMMAND CONSTRUCTOR */
/*-----------------------------*/

struct cmd *redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd) {
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	53                   	push   %ebx
     3b4:	83 ec 10             	sub    $0x10,%esp
    struct redircmd *cmd;

    cmd = malloc(sizeof(*cmd));
     3b7:	6a 18                	push   $0x18
     3b9:	e8 c2 0d 00 00       	call   1180 <malloc>
    memset(cmd, 0, sizeof(*cmd));
     3be:	83 c4 0c             	add    $0xc,%esp
    cmd = malloc(sizeof(*cmd));
     3c1:	89 c3                	mov    %eax,%ebx
    memset(cmd, 0, sizeof(*cmd));
     3c3:	6a 18                	push   $0x18
     3c5:	6a 00                	push   $0x0
     3c7:	50                   	push   %eax
     3c8:	e8 63 08 00 00       	call   c30 <memset>
    cmd->type = REDIR;
    cmd->cmd = subcmd;
     3cd:	8b 45 08             	mov    0x8(%ebp),%eax
    cmd->type = REDIR;
     3d0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
    cmd->cmd = subcmd;
     3d6:	89 43 04             	mov    %eax,0x4(%ebx)
    cmd->file = file;
     3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3dc:	89 43 08             	mov    %eax,0x8(%ebx)
    cmd->efile = efile;
     3df:	8b 45 10             	mov    0x10(%ebp),%eax
     3e2:	89 43 0c             	mov    %eax,0xc(%ebx)
    cmd->mode = mode;
     3e5:	8b 45 14             	mov    0x14(%ebp),%eax
     3e8:	89 43 10             	mov    %eax,0x10(%ebx)
    cmd->fd = fd;
     3eb:	8b 45 18             	mov    0x18(%ebp),%eax
     3ee:	89 43 14             	mov    %eax,0x14(%ebx)
    return (struct cmd *) cmd;
}
     3f1:	89 d8                	mov    %ebx,%eax
     3f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3f6:	c9                   	leave  
     3f7:	c3                   	ret    
     3f8:	90                   	nop
     3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <pipecmd>:

struct cmd *pipecmd(struct cmd *left, struct cmd *right) {
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	53                   	push   %ebx
     404:	83 ec 10             	sub    $0x10,%esp
    struct pipecmd *cmd;

    cmd = malloc(sizeof(*cmd));
     407:	6a 0c                	push   $0xc
     409:	e8 72 0d 00 00       	call   1180 <malloc>
    memset(cmd, 0, sizeof(*cmd));
     40e:	83 c4 0c             	add    $0xc,%esp
    cmd = malloc(sizeof(*cmd));
     411:	89 c3                	mov    %eax,%ebx
    memset(cmd, 0, sizeof(*cmd));
     413:	6a 0c                	push   $0xc
     415:	6a 00                	push   $0x0
     417:	50                   	push   %eax
     418:	e8 13 08 00 00       	call   c30 <memset>
    cmd->type = PIPE;
    cmd->left = left;
     41d:	8b 45 08             	mov    0x8(%ebp),%eax
    cmd->type = PIPE;
     420:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
    cmd->left = left;
     426:	89 43 04             	mov    %eax,0x4(%ebx)
    cmd->right = right;
     429:	8b 45 0c             	mov    0xc(%ebp),%eax
     42c:	89 43 08             	mov    %eax,0x8(%ebx)
    return (struct cmd *) cmd;
}
     42f:	89 d8                	mov    %ebx,%eax
     431:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     434:	c9                   	leave  
     435:	c3                   	ret    
     436:	8d 76 00             	lea    0x0(%esi),%esi
     439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <listcmd>:

struct cmd *listcmd(struct cmd *left, struct cmd *right) {
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	53                   	push   %ebx
     444:	83 ec 10             	sub    $0x10,%esp
    struct listcmd *cmd;

    cmd = malloc(sizeof(*cmd));
     447:	6a 0c                	push   $0xc
     449:	e8 32 0d 00 00       	call   1180 <malloc>
    memset(cmd, 0, sizeof(*cmd));
     44e:	83 c4 0c             	add    $0xc,%esp
    cmd = malloc(sizeof(*cmd));
     451:	89 c3                	mov    %eax,%ebx
    memset(cmd, 0, sizeof(*cmd));
     453:	6a 0c                	push   $0xc
     455:	6a 00                	push   $0x0
     457:	50                   	push   %eax
     458:	e8 d3 07 00 00       	call   c30 <memset>
    cmd->type = LIST;
    cmd->left = left;
     45d:	8b 45 08             	mov    0x8(%ebp),%eax
    cmd->type = LIST;
     460:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
    cmd->left = left;
     466:	89 43 04             	mov    %eax,0x4(%ebx)
    cmd->right = right;
     469:	8b 45 0c             	mov    0xc(%ebp),%eax
     46c:	89 43 08             	mov    %eax,0x8(%ebx)
    return (struct cmd *) cmd;
}
     46f:	89 d8                	mov    %ebx,%eax
     471:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     474:	c9                   	leave  
     475:	c3                   	ret    
     476:	8d 76 00             	lea    0x0(%esi),%esi
     479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000480 <backcmd>:

struct cmd *backcmd(struct cmd *subcmd) {
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	53                   	push   %ebx
     484:	83 ec 10             	sub    $0x10,%esp
    struct backcmd *cmd;

    cmd = malloc(sizeof(*cmd));
     487:	6a 08                	push   $0x8
     489:	e8 f2 0c 00 00       	call   1180 <malloc>
    memset(cmd, 0, sizeof(*cmd));
     48e:	83 c4 0c             	add    $0xc,%esp
    cmd = malloc(sizeof(*cmd));
     491:	89 c3                	mov    %eax,%ebx
    memset(cmd, 0, sizeof(*cmd));
     493:	6a 08                	push   $0x8
     495:	6a 00                	push   $0x0
     497:	50                   	push   %eax
     498:	e8 93 07 00 00       	call   c30 <memset>
    cmd->type = BACK;
    cmd->cmd = subcmd;
     49d:	8b 45 08             	mov    0x8(%ebp),%eax
    cmd->type = BACK;
     4a0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
    cmd->cmd = subcmd;
     4a6:	89 43 04             	mov    %eax,0x4(%ebx)
    return (struct cmd *) cmd;
}
     4a9:	89 d8                	mov    %ebx,%eax
     4ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4ae:	c9                   	leave  
     4af:	c3                   	ret    

000004b0 <ordcmd>:

/*-----------------------------*/
/* ORDERED COMMAND CONSTRUCTOR */
/*-----------------------------*/

struct cmd *ordcmd(struct cmd *left, struct cmd *right) {
     4b0:	55                   	push   %ebp
     4b1:	89 e5                	mov    %esp,%ebp
     4b3:	53                   	push   %ebx
     4b4:	83 ec 10             	sub    $0x10,%esp
    struct ordcmd *cmd;

    cmd = malloc(sizeof(*cmd));
     4b7:	6a 0c                	push   $0xc
     4b9:	e8 c2 0c 00 00       	call   1180 <malloc>
    memset(cmd, 0, sizeof(*cmd));
     4be:	83 c4 0c             	add    $0xc,%esp
    cmd = malloc(sizeof(*cmd));
     4c1:	89 c3                	mov    %eax,%ebx
    memset(cmd, 0, sizeof(*cmd));
     4c3:	6a 0c                	push   $0xc
     4c5:	6a 00                	push   $0x0
     4c7:	50                   	push   %eax
     4c8:	e8 63 07 00 00       	call   c30 <memset>
    cmd->type = ORD;
    cmd->left = left;
     4cd:	8b 45 08             	mov    0x8(%ebp),%eax
    cmd->type = ORD;
     4d0:	c7 03 06 00 00 00    	movl   $0x6,(%ebx)
    cmd->left = left;
     4d6:	89 43 04             	mov    %eax,0x4(%ebx)
    cmd->right = right;
     4d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     4dc:	89 43 08             	mov    %eax,0x8(%ebx)
    return (struct cmd *) cmd;
}
     4df:	89 d8                	mov    %ebx,%eax
     4e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4e4:	c9                   	leave  
     4e5:	c3                   	ret    
     4e6:	8d 76 00             	lea    0x0(%esi),%esi
     4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004f0 <gettoken>:
// Parsing

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int gettoken(char **ps, char *es, char **q, char **eq) {
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	57                   	push   %edi
     4f4:	56                   	push   %esi
     4f5:	53                   	push   %ebx
     4f6:	83 ec 0c             	sub    $0xc,%esp
    char *s;
    int ret;

    s = *ps;
     4f9:	8b 45 08             	mov    0x8(%ebp),%eax
int gettoken(char **ps, char *es, char **q, char **eq) {
     4fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     4ff:	8b 7d 10             	mov    0x10(%ebp),%edi
    s = *ps;
     502:	8b 30                	mov    (%eax),%esi
    while (s < es && strchr(whitespace, *s))
     504:	39 de                	cmp    %ebx,%esi
     506:	72 0f                	jb     517 <gettoken+0x27>
     508:	eb 25                	jmp    52f <gettoken+0x3f>
     50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        s++;
     510:	83 c6 01             	add    $0x1,%esi
    while (s < es && strchr(whitespace, *s))
     513:	39 f3                	cmp    %esi,%ebx
     515:	74 18                	je     52f <gettoken+0x3f>
     517:	0f be 06             	movsbl (%esi),%eax
     51a:	83 ec 08             	sub    $0x8,%esp
     51d:	50                   	push   %eax
     51e:	68 60 19 00 00       	push   $0x1960
     523:	e8 28 07 00 00       	call   c50 <strchr>
     528:	83 c4 10             	add    $0x10,%esp
     52b:	85 c0                	test   %eax,%eax
     52d:	75 e1                	jne    510 <gettoken+0x20>
    if (q)
     52f:	85 ff                	test   %edi,%edi
     531:	74 02                	je     535 <gettoken+0x45>
        *q = s;
     533:	89 37                	mov    %esi,(%edi)
    ret = *s;
     535:	0f be 06             	movsbl (%esi),%eax
    switch (*s) {
     538:	3c 29                	cmp    $0x29,%al
     53a:	7f 54                	jg     590 <gettoken+0xa0>
     53c:	3c 28                	cmp    $0x28,%al
     53e:	0f 8d c8 00 00 00    	jge    60c <gettoken+0x11c>
     544:	31 ff                	xor    %edi,%edi
     546:	84 c0                	test   %al,%al
     548:	0f 85 d2 00 00 00    	jne    620 <gettoken+0x130>
            ret = 'a';
            while (s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
                s++;
            break;
    }
    if (eq)
     54e:	8b 55 14             	mov    0x14(%ebp),%edx
     551:	85 d2                	test   %edx,%edx
     553:	74 05                	je     55a <gettoken+0x6a>
        *eq = s;
     555:	8b 45 14             	mov    0x14(%ebp),%eax
     558:	89 30                	mov    %esi,(%eax)

    while (s < es && strchr(whitespace, *s))
     55a:	39 de                	cmp    %ebx,%esi
     55c:	72 09                	jb     567 <gettoken+0x77>
     55e:	eb 1f                	jmp    57f <gettoken+0x8f>
        s++;
     560:	83 c6 01             	add    $0x1,%esi
    while (s < es && strchr(whitespace, *s))
     563:	39 f3                	cmp    %esi,%ebx
     565:	74 18                	je     57f <gettoken+0x8f>
     567:	0f be 06             	movsbl (%esi),%eax
     56a:	83 ec 08             	sub    $0x8,%esp
     56d:	50                   	push   %eax
     56e:	68 60 19 00 00       	push   $0x1960
     573:	e8 d8 06 00 00       	call   c50 <strchr>
     578:	83 c4 10             	add    $0x10,%esp
     57b:	85 c0                	test   %eax,%eax
     57d:	75 e1                	jne    560 <gettoken+0x70>
    *ps = s;
     57f:	8b 45 08             	mov    0x8(%ebp),%eax
     582:	89 30                	mov    %esi,(%eax)
    return ret;
}
     584:	8d 65 f4             	lea    -0xc(%ebp),%esp
     587:	89 f8                	mov    %edi,%eax
     589:	5b                   	pop    %ebx
     58a:	5e                   	pop    %esi
     58b:	5f                   	pop    %edi
     58c:	5d                   	pop    %ebp
     58d:	c3                   	ret    
     58e:	66 90                	xchg   %ax,%ax
    switch (*s) {
     590:	3c 3e                	cmp    $0x3e,%al
     592:	75 1c                	jne    5b0 <gettoken+0xc0>
            if (*s == '>') {
     594:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
            s++;
     598:	8d 46 01             	lea    0x1(%esi),%eax
            if (*s == '>') {
     59b:	0f 84 a4 00 00 00    	je     645 <gettoken+0x155>
            s++;
     5a1:	89 c6                	mov    %eax,%esi
     5a3:	bf 3e 00 00 00       	mov    $0x3e,%edi
     5a8:	eb a4                	jmp    54e <gettoken+0x5e>
     5aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    switch (*s) {
     5b0:	7f 56                	jg     608 <gettoken+0x118>
     5b2:	8d 48 c5             	lea    -0x3b(%eax),%ecx
     5b5:	80 f9 01             	cmp    $0x1,%cl
     5b8:	76 52                	jbe    60c <gettoken+0x11c>
            while (s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5ba:	39 f3                	cmp    %esi,%ebx
     5bc:	77 24                	ja     5e2 <gettoken+0xf2>
     5be:	eb 70                	jmp    630 <gettoken+0x140>
     5c0:	0f be 06             	movsbl (%esi),%eax
     5c3:	83 ec 08             	sub    $0x8,%esp
     5c6:	50                   	push   %eax
     5c7:	68 58 19 00 00       	push   $0x1958
     5cc:	e8 7f 06 00 00       	call   c50 <strchr>
     5d1:	83 c4 10             	add    $0x10,%esp
     5d4:	85 c0                	test   %eax,%eax
     5d6:	75 1f                	jne    5f7 <gettoken+0x107>
                s++;
     5d8:	83 c6 01             	add    $0x1,%esi
            while (s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5db:	39 f3                	cmp    %esi,%ebx
     5dd:	74 51                	je     630 <gettoken+0x140>
     5df:	0f be 06             	movsbl (%esi),%eax
     5e2:	83 ec 08             	sub    $0x8,%esp
     5e5:	50                   	push   %eax
     5e6:	68 60 19 00 00       	push   $0x1960
     5eb:	e8 60 06 00 00       	call   c50 <strchr>
     5f0:	83 c4 10             	add    $0x10,%esp
     5f3:	85 c0                	test   %eax,%eax
     5f5:	74 c9                	je     5c0 <gettoken+0xd0>
            ret = 'a';
     5f7:	bf 61 00 00 00       	mov    $0x61,%edi
     5fc:	e9 4d ff ff ff       	jmp    54e <gettoken+0x5e>
     601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    switch (*s) {
     608:	3c 7c                	cmp    $0x7c,%al
     60a:	75 ae                	jne    5ba <gettoken+0xca>
    ret = *s;
     60c:	0f be f8             	movsbl %al,%edi
            s++;
     60f:	83 c6 01             	add    $0x1,%esi
            break;
     612:	e9 37 ff ff ff       	jmp    54e <gettoken+0x5e>
     617:	89 f6                	mov    %esi,%esi
     619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    switch (*s) {
     620:	3c 26                	cmp    $0x26,%al
     622:	75 96                	jne    5ba <gettoken+0xca>
     624:	eb e6                	jmp    60c <gettoken+0x11c>
     626:	8d 76 00             	lea    0x0(%esi),%esi
     629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if (eq)
     630:	8b 45 14             	mov    0x14(%ebp),%eax
     633:	bf 61 00 00 00       	mov    $0x61,%edi
     638:	85 c0                	test   %eax,%eax
     63a:	0f 85 15 ff ff ff    	jne    555 <gettoken+0x65>
     640:	e9 3a ff ff ff       	jmp    57f <gettoken+0x8f>
                s++;
     645:	83 c6 02             	add    $0x2,%esi
                ret = '+';
     648:	bf 2b 00 00 00       	mov    $0x2b,%edi
     64d:	e9 fc fe ff ff       	jmp    54e <gettoken+0x5e>
     652:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <peek>:

int peek(char **ps, char *es, char *toks) {
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	57                   	push   %edi
     664:	56                   	push   %esi
     665:	53                   	push   %ebx
     666:	83 ec 0c             	sub    $0xc,%esp
     669:	8b 7d 08             	mov    0x8(%ebp),%edi
     66c:	8b 75 0c             	mov    0xc(%ebp),%esi
    char *s;

    s = *ps;
     66f:	8b 1f                	mov    (%edi),%ebx
    while (s < es && strchr(whitespace, *s))
     671:	39 f3                	cmp    %esi,%ebx
     673:	72 12                	jb     687 <peek+0x27>
     675:	eb 28                	jmp    69f <peek+0x3f>
     677:	89 f6                	mov    %esi,%esi
     679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s++;
     680:	83 c3 01             	add    $0x1,%ebx
    while (s < es && strchr(whitespace, *s))
     683:	39 de                	cmp    %ebx,%esi
     685:	74 18                	je     69f <peek+0x3f>
     687:	0f be 03             	movsbl (%ebx),%eax
     68a:	83 ec 08             	sub    $0x8,%esp
     68d:	50                   	push   %eax
     68e:	68 60 19 00 00       	push   $0x1960
     693:	e8 b8 05 00 00       	call   c50 <strchr>
     698:	83 c4 10             	add    $0x10,%esp
     69b:	85 c0                	test   %eax,%eax
     69d:	75 e1                	jne    680 <peek+0x20>
    *ps = s;
     69f:	89 1f                	mov    %ebx,(%edi)
    return *s && strchr(toks, *s);
     6a1:	0f be 13             	movsbl (%ebx),%edx
     6a4:	31 c0                	xor    %eax,%eax
     6a6:	84 d2                	test   %dl,%dl
     6a8:	74 17                	je     6c1 <peek+0x61>
     6aa:	83 ec 08             	sub    $0x8,%esp
     6ad:	52                   	push   %edx
     6ae:	ff 75 10             	pushl  0x10(%ebp)
     6b1:	e8 9a 05 00 00       	call   c50 <strchr>
     6b6:	83 c4 10             	add    $0x10,%esp
     6b9:	85 c0                	test   %eax,%eax
     6bb:	0f 95 c0             	setne  %al
     6be:	0f b6 c0             	movzbl %al,%eax
}
     6c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6c4:	5b                   	pop    %ebx
     6c5:	5e                   	pop    %esi
     6c6:	5f                   	pop    %edi
     6c7:	5d                   	pop    %ebp
     6c8:	c3                   	ret    
     6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006d0 <parseredirs>:

/*------------------------*/
/* PARSE REDIRECT COMMAND */
/*------------------------*/

struct cmd *parseredirs(struct cmd *cmd, char **ps, char *es) {
     6d0:	55                   	push   %ebp
     6d1:	89 e5                	mov    %esp,%ebp
     6d3:	57                   	push   %edi
     6d4:	56                   	push   %esi
     6d5:	53                   	push   %ebx
     6d6:	83 ec 1c             	sub    $0x1c,%esp
     6d9:	8b 75 0c             	mov    0xc(%ebp),%esi
     6dc:	8b 5d 10             	mov    0x10(%ebp),%ebx
     6df:	90                   	nop
    int tok;
    char *q, *eq;

    while (peek(ps, es, "<>")) {
     6e0:	83 ec 04             	sub    $0x4,%esp
     6e3:	68 ce 12 00 00       	push   $0x12ce
     6e8:	53                   	push   %ebx
     6e9:	56                   	push   %esi
     6ea:	e8 71 ff ff ff       	call   660 <peek>
     6ef:	83 c4 10             	add    $0x10,%esp
     6f2:	85 c0                	test   %eax,%eax
     6f4:	74 6a                	je     760 <parseredirs+0x90>
        tok = gettoken(ps, es, 0, 0);
     6f6:	6a 00                	push   $0x0
     6f8:	6a 00                	push   $0x0
     6fa:	53                   	push   %ebx
     6fb:	56                   	push   %esi
     6fc:	e8 ef fd ff ff       	call   4f0 <gettoken>
     701:	89 c7                	mov    %eax,%edi
        if (gettoken(ps, es, &q, &eq) != 'a')
     703:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     706:	50                   	push   %eax
     707:	8d 45 e0             	lea    -0x20(%ebp),%eax
     70a:	50                   	push   %eax
     70b:	53                   	push   %ebx
     70c:	56                   	push   %esi
     70d:	e8 de fd ff ff       	call   4f0 <gettoken>
     712:	83 c4 20             	add    $0x20,%esp
     715:	83 f8 61             	cmp    $0x61,%eax
     718:	75 51                	jne    76b <parseredirs+0x9b>
            panic("missing file for redirection");
        switch (tok) {
     71a:	83 ff 3c             	cmp    $0x3c,%edi
     71d:	74 31                	je     750 <parseredirs+0x80>
     71f:	83 ff 3e             	cmp    $0x3e,%edi
     722:	74 05                	je     729 <parseredirs+0x59>
     724:	83 ff 2b             	cmp    $0x2b,%edi
     727:	75 b7                	jne    6e0 <parseredirs+0x10>
                break;
            case '>':
                cmd = redircmd(cmd, q, eq, O_WRONLY | O_CREATE, 1);
                break;
            case '+':  // >>
                cmd = redircmd(cmd, q, eq, O_WRONLY | O_CREATE, 1);
     729:	83 ec 0c             	sub    $0xc,%esp
     72c:	6a 01                	push   $0x1
     72e:	68 01 02 00 00       	push   $0x201
     733:	ff 75 e4             	pushl  -0x1c(%ebp)
     736:	ff 75 e0             	pushl  -0x20(%ebp)
     739:	ff 75 08             	pushl  0x8(%ebp)
     73c:	e8 6f fc ff ff       	call   3b0 <redircmd>
                break;
     741:	83 c4 20             	add    $0x20,%esp
                cmd = redircmd(cmd, q, eq, O_WRONLY | O_CREATE, 1);
     744:	89 45 08             	mov    %eax,0x8(%ebp)
                break;
     747:	eb 97                	jmp    6e0 <parseredirs+0x10>
     749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     750:	83 ec 0c             	sub    $0xc,%esp
     753:	6a 00                	push   $0x0
     755:	6a 00                	push   $0x0
     757:	eb da                	jmp    733 <parseredirs+0x63>
     759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
    }
    return cmd;
}
     760:	8b 45 08             	mov    0x8(%ebp),%eax
     763:	8d 65 f4             	lea    -0xc(%ebp),%esp
     766:	5b                   	pop    %ebx
     767:	5e                   	pop    %esi
     768:	5f                   	pop    %edi
     769:	5d                   	pop    %ebp
     76a:	c3                   	ret    
            panic("missing file for redirection");
     76b:	83 ec 0c             	sub    $0xc,%esp
     76e:	68 b1 12 00 00       	push   $0x12b1
     773:	e8 d8 f9 ff ff       	call   150 <panic>
     778:	90                   	nop
     779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000780 <parseexec>:
    gettoken(ps, es, 0, 0);
    cmd = parseredirs(cmd, ps, es);
    return cmd;
}

struct cmd *parseexec(char **ps, char *es) {
     780:	55                   	push   %ebp
     781:	89 e5                	mov    %esp,%ebp
     783:	57                   	push   %edi
     784:	56                   	push   %esi
     785:	53                   	push   %ebx
     786:	83 ec 30             	sub    $0x30,%esp
     789:	8b 75 08             	mov    0x8(%ebp),%esi
     78c:	8b 7d 0c             	mov    0xc(%ebp),%edi
    char *q, *eq;
    int tok, argc;
    struct execcmd *cmd;
    struct cmd *ret;

    if (peek(ps, es, "("))
     78f:	68 d1 12 00 00       	push   $0x12d1
     794:	57                   	push   %edi
     795:	56                   	push   %esi
     796:	e8 c5 fe ff ff       	call   660 <peek>
     79b:	83 c4 10             	add    $0x10,%esp
     79e:	85 c0                	test   %eax,%eax
     7a0:	0f 85 92 00 00 00    	jne    838 <parseexec+0xb8>
     7a6:	89 c3                	mov    %eax,%ebx
        return parseblock(ps, es);

    ret = execcmd();
     7a8:	e8 d3 fb ff ff       	call   380 <execcmd>
    cmd = (struct execcmd *) ret;

    argc = 0;
    ret = parseredirs(ret, ps, es);
     7ad:	83 ec 04             	sub    $0x4,%esp
    ret = execcmd();
     7b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    ret = parseredirs(ret, ps, es);
     7b3:	57                   	push   %edi
     7b4:	56                   	push   %esi
     7b5:	50                   	push   %eax
     7b6:	e8 15 ff ff ff       	call   6d0 <parseredirs>
     7bb:	83 c4 10             	add    $0x10,%esp
     7be:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     7c1:	eb 18                	jmp    7db <parseexec+0x5b>
     7c3:	90                   	nop
     7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cmd->argv[argc] = q;
        cmd->eargv[argc] = eq;
        argc++;
        if (argc >= MAXARGS)
            panic("too many args");
        ret = parseredirs(ret, ps, es);
     7c8:	83 ec 04             	sub    $0x4,%esp
     7cb:	57                   	push   %edi
     7cc:	56                   	push   %esi
     7cd:	ff 75 d4             	pushl  -0x2c(%ebp)
     7d0:	e8 fb fe ff ff       	call   6d0 <parseredirs>
     7d5:	83 c4 10             	add    $0x10,%esp
     7d8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (!peek(ps, es, "|)&;")) {
     7db:	83 ec 04             	sub    $0x4,%esp
     7de:	68 e8 12 00 00       	push   $0x12e8
     7e3:	57                   	push   %edi
     7e4:	56                   	push   %esi
     7e5:	e8 76 fe ff ff       	call   660 <peek>
     7ea:	83 c4 10             	add    $0x10,%esp
     7ed:	85 c0                	test   %eax,%eax
     7ef:	75 67                	jne    858 <parseexec+0xd8>
        if ((tok = gettoken(ps, es, &q, &eq)) == 0)
     7f1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7f4:	50                   	push   %eax
     7f5:	8d 45 e0             	lea    -0x20(%ebp),%eax
     7f8:	50                   	push   %eax
     7f9:	57                   	push   %edi
     7fa:	56                   	push   %esi
     7fb:	e8 f0 fc ff ff       	call   4f0 <gettoken>
     800:	83 c4 10             	add    $0x10,%esp
     803:	85 c0                	test   %eax,%eax
     805:	74 51                	je     858 <parseexec+0xd8>
        if (tok != 'a')
     807:	83 f8 61             	cmp    $0x61,%eax
     80a:	75 6b                	jne    877 <parseexec+0xf7>
        cmd->argv[argc] = q;
     80c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     80f:	8b 55 d0             	mov    -0x30(%ebp),%edx
     812:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
        cmd->eargv[argc] = eq;
     816:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     819:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
        argc++;
     81d:	83 c3 01             	add    $0x1,%ebx
        if (argc >= MAXARGS)
     820:	83 fb 0a             	cmp    $0xa,%ebx
     823:	75 a3                	jne    7c8 <parseexec+0x48>
            panic("too many args");
     825:	83 ec 0c             	sub    $0xc,%esp
     828:	68 da 12 00 00       	push   $0x12da
     82d:	e8 1e f9 ff ff       	call   150 <panic>
     832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return parseblock(ps, es);
     838:	83 ec 08             	sub    $0x8,%esp
     83b:	57                   	push   %edi
     83c:	56                   	push   %esi
     83d:	e8 9e 01 00 00       	call   9e0 <parseblock>
     842:	83 c4 10             	add    $0x10,%esp
     845:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    }
    cmd->argv[argc] = 0;
    cmd->eargv[argc] = 0;
    return ret;
}
     848:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     84b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     84e:	5b                   	pop    %ebx
     84f:	5e                   	pop    %esi
     850:	5f                   	pop    %edi
     851:	5d                   	pop    %ebp
     852:	c3                   	ret    
     853:	90                   	nop
     854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     858:	8b 45 d0             	mov    -0x30(%ebp),%eax
     85b:	8d 04 98             	lea    (%eax,%ebx,4),%eax
    cmd->argv[argc] = 0;
     85e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    cmd->eargv[argc] = 0;
     865:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     86c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     86f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     872:	5b                   	pop    %ebx
     873:	5e                   	pop    %esi
     874:	5f                   	pop    %edi
     875:	5d                   	pop    %ebp
     876:	c3                   	ret    
            panic("syntax");
     877:	83 ec 0c             	sub    $0xc,%esp
     87a:	68 d3 12 00 00       	push   $0x12d3
     87f:	e8 cc f8 ff ff       	call   150 <panic>
     884:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     88a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000890 <parsepipe>:
struct cmd *parsepipe(char **ps, char *es) {
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	57                   	push   %edi
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	83 ec 14             	sub    $0x14,%esp
     899:	8b 5d 08             	mov    0x8(%ebp),%ebx
     89c:	8b 75 0c             	mov    0xc(%ebp),%esi
    cmd = parseexec(ps, es);
     89f:	56                   	push   %esi
     8a0:	53                   	push   %ebx
     8a1:	e8 da fe ff ff       	call   780 <parseexec>
    if (peek(ps, es, "|")) {
     8a6:	83 c4 0c             	add    $0xc,%esp
    cmd = parseexec(ps, es);
     8a9:	89 c7                	mov    %eax,%edi
    if (peek(ps, es, "|")) {
     8ab:	68 ed 12 00 00       	push   $0x12ed
     8b0:	56                   	push   %esi
     8b1:	53                   	push   %ebx
     8b2:	e8 a9 fd ff ff       	call   660 <peek>
     8b7:	83 c4 10             	add    $0x10,%esp
     8ba:	85 c0                	test   %eax,%eax
     8bc:	75 12                	jne    8d0 <parsepipe+0x40>
}
     8be:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8c1:	89 f8                	mov    %edi,%eax
     8c3:	5b                   	pop    %ebx
     8c4:	5e                   	pop    %esi
     8c5:	5f                   	pop    %edi
     8c6:	5d                   	pop    %ebp
     8c7:	c3                   	ret    
     8c8:	90                   	nop
     8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        gettoken(ps, es, 0, 0);
     8d0:	6a 00                	push   $0x0
     8d2:	6a 00                	push   $0x0
     8d4:	56                   	push   %esi
     8d5:	53                   	push   %ebx
     8d6:	e8 15 fc ff ff       	call   4f0 <gettoken>
        cmd = pipecmd(cmd, parsepipe(ps, es));
     8db:	58                   	pop    %eax
     8dc:	5a                   	pop    %edx
     8dd:	56                   	push   %esi
     8de:	53                   	push   %ebx
     8df:	e8 ac ff ff ff       	call   890 <parsepipe>
     8e4:	89 7d 08             	mov    %edi,0x8(%ebp)
     8e7:	89 45 0c             	mov    %eax,0xc(%ebp)
     8ea:	83 c4 10             	add    $0x10,%esp
}
     8ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8f0:	5b                   	pop    %ebx
     8f1:	5e                   	pop    %esi
     8f2:	5f                   	pop    %edi
     8f3:	5d                   	pop    %ebp
        cmd = pipecmd(cmd, parsepipe(ps, es));
     8f4:	e9 07 fb ff ff       	jmp    400 <pipecmd>
     8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000900 <parseline>:
struct cmd *parseline(char **ps, char *es) {
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	57                   	push   %edi
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	83 ec 14             	sub    $0x14,%esp
     909:	8b 5d 08             	mov    0x8(%ebp),%ebx
     90c:	8b 75 0c             	mov    0xc(%ebp),%esi
    cmd = parsepipe(ps, es);
     90f:	56                   	push   %esi
     910:	53                   	push   %ebx
     911:	e8 7a ff ff ff       	call   890 <parsepipe>
    while (peek(ps, es, "&")) {
     916:	83 c4 10             	add    $0x10,%esp
    cmd = parsepipe(ps, es);
     919:	89 c7                	mov    %eax,%edi
    while (peek(ps, es, "&")) {
     91b:	eb 1b                	jmp    938 <parseline+0x38>
     91d:	8d 76 00             	lea    0x0(%esi),%esi
        gettoken(ps, es, 0, 0);
     920:	6a 00                	push   $0x0
     922:	6a 00                	push   $0x0
     924:	56                   	push   %esi
     925:	53                   	push   %ebx
     926:	e8 c5 fb ff ff       	call   4f0 <gettoken>
        cmd = backcmd(cmd);
     92b:	89 3c 24             	mov    %edi,(%esp)
     92e:	e8 4d fb ff ff       	call   480 <backcmd>
     933:	83 c4 10             	add    $0x10,%esp
     936:	89 c7                	mov    %eax,%edi
    while (peek(ps, es, "&")) {
     938:	83 ec 04             	sub    $0x4,%esp
     93b:	68 ef 12 00 00       	push   $0x12ef
     940:	56                   	push   %esi
     941:	53                   	push   %ebx
     942:	e8 19 fd ff ff       	call   660 <peek>
     947:	83 c4 10             	add    $0x10,%esp
     94a:	85 c0                	test   %eax,%eax
     94c:	75 d2                	jne    920 <parseline+0x20>
    if (peek(ps, es, ";")) {
     94e:	83 ec 04             	sub    $0x4,%esp
     951:	68 eb 12 00 00       	push   $0x12eb
     956:	56                   	push   %esi
     957:	53                   	push   %ebx
     958:	e8 03 fd ff ff       	call   660 <peek>
     95d:	83 c4 10             	add    $0x10,%esp
     960:	85 c0                	test   %eax,%eax
     962:	75 54                	jne    9b8 <parseline+0xb8>
    if (peek(ps, es, "(")) {
     964:	83 ec 04             	sub    $0x4,%esp
     967:	68 d1 12 00 00       	push   $0x12d1
     96c:	56                   	push   %esi
     96d:	53                   	push   %ebx
     96e:	e8 ed fc ff ff       	call   660 <peek>
     973:	83 c4 10             	add    $0x10,%esp
     976:	85 c0                	test   %eax,%eax
     978:	75 0e                	jne    988 <parseline+0x88>
}
     97a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     97d:	89 f8                	mov    %edi,%eax
     97f:	5b                   	pop    %ebx
     980:	5e                   	pop    %esi
     981:	5f                   	pop    %edi
     982:	5d                   	pop    %ebp
     983:	c3                   	ret    
     984:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        gettoken(ps, es, 0, 0);
     988:	6a 00                	push   $0x0
     98a:	6a 00                	push   $0x0
     98c:	56                   	push   %esi
     98d:	53                   	push   %ebx
     98e:	e8 5d fb ff ff       	call   4f0 <gettoken>
        cmd = ordcmd(cmd, parseline(ps, es));
     993:	58                   	pop    %eax
     994:	5a                   	pop    %edx
     995:	56                   	push   %esi
     996:	53                   	push   %ebx
     997:	e8 64 ff ff ff       	call   900 <parseline>
     99c:	89 7d 08             	mov    %edi,0x8(%ebp)
     99f:	89 45 0c             	mov    %eax,0xc(%ebp)
     9a2:	83 c4 10             	add    $0x10,%esp
}
     9a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9a8:	5b                   	pop    %ebx
     9a9:	5e                   	pop    %esi
     9aa:	5f                   	pop    %edi
     9ab:	5d                   	pop    %ebp
        cmd = ordcmd(cmd, parseline(ps, es));
     9ac:	e9 ff fa ff ff       	jmp    4b0 <ordcmd>
     9b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        gettoken(ps, es, 0, 0);
     9b8:	6a 00                	push   $0x0
     9ba:	6a 00                	push   $0x0
     9bc:	56                   	push   %esi
     9bd:	53                   	push   %ebx
     9be:	e8 2d fb ff ff       	call   4f0 <gettoken>
        cmd = listcmd(cmd, parseline(ps, es));
     9c3:	59                   	pop    %ecx
     9c4:	58                   	pop    %eax
     9c5:	56                   	push   %esi
     9c6:	53                   	push   %ebx
     9c7:	e8 34 ff ff ff       	call   900 <parseline>
     9cc:	5a                   	pop    %edx
     9cd:	59                   	pop    %ecx
     9ce:	50                   	push   %eax
     9cf:	57                   	push   %edi
     9d0:	e8 6b fa ff ff       	call   440 <listcmd>
     9d5:	83 c4 10             	add    $0x10,%esp
     9d8:	89 c7                	mov    %eax,%edi
     9da:	eb 88                	jmp    964 <parseline+0x64>
     9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009e0 <parseblock>:
struct cmd *parseblock(char **ps, char *es) {
     9e0:	55                   	push   %ebp
     9e1:	89 e5                	mov    %esp,%ebp
     9e3:	57                   	push   %edi
     9e4:	56                   	push   %esi
     9e5:	53                   	push   %ebx
     9e6:	83 ec 10             	sub    $0x10,%esp
     9e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     9ec:	8b 75 0c             	mov    0xc(%ebp),%esi
    if (!peek(ps, es, "("))
     9ef:	68 d1 12 00 00       	push   $0x12d1
     9f4:	56                   	push   %esi
     9f5:	53                   	push   %ebx
     9f6:	e8 65 fc ff ff       	call   660 <peek>
     9fb:	83 c4 10             	add    $0x10,%esp
     9fe:	85 c0                	test   %eax,%eax
     a00:	74 4a                	je     a4c <parseblock+0x6c>
    gettoken(ps, es, 0, 0);
     a02:	6a 00                	push   $0x0
     a04:	6a 00                	push   $0x0
     a06:	56                   	push   %esi
     a07:	53                   	push   %ebx
     a08:	e8 e3 fa ff ff       	call   4f0 <gettoken>
    cmd = parseline(ps, es);
     a0d:	58                   	pop    %eax
     a0e:	5a                   	pop    %edx
     a0f:	56                   	push   %esi
     a10:	53                   	push   %ebx
     a11:	e8 ea fe ff ff       	call   900 <parseline>
    if (!peek(ps, es, ")"))
     a16:	83 c4 0c             	add    $0xc,%esp
    cmd = parseline(ps, es);
     a19:	89 c7                	mov    %eax,%edi
    if (!peek(ps, es, ")"))
     a1b:	68 0d 13 00 00       	push   $0x130d
     a20:	56                   	push   %esi
     a21:	53                   	push   %ebx
     a22:	e8 39 fc ff ff       	call   660 <peek>
     a27:	83 c4 10             	add    $0x10,%esp
     a2a:	85 c0                	test   %eax,%eax
     a2c:	74 2b                	je     a59 <parseblock+0x79>
    gettoken(ps, es, 0, 0);
     a2e:	6a 00                	push   $0x0
     a30:	6a 00                	push   $0x0
     a32:	56                   	push   %esi
     a33:	53                   	push   %ebx
     a34:	e8 b7 fa ff ff       	call   4f0 <gettoken>
    cmd = parseredirs(cmd, ps, es);
     a39:	83 c4 0c             	add    $0xc,%esp
     a3c:	56                   	push   %esi
     a3d:	53                   	push   %ebx
     a3e:	57                   	push   %edi
     a3f:	e8 8c fc ff ff       	call   6d0 <parseredirs>
}
     a44:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a47:	5b                   	pop    %ebx
     a48:	5e                   	pop    %esi
     a49:	5f                   	pop    %edi
     a4a:	5d                   	pop    %ebp
     a4b:	c3                   	ret    
        panic("parseblock");
     a4c:	83 ec 0c             	sub    $0xc,%esp
     a4f:	68 f1 12 00 00       	push   $0x12f1
     a54:	e8 f7 f6 ff ff       	call   150 <panic>
        panic("syntax - missing )");
     a59:	83 ec 0c             	sub    $0xc,%esp
     a5c:	68 fc 12 00 00       	push   $0x12fc
     a61:	e8 ea f6 ff ff       	call   150 <panic>
     a66:	8d 76 00             	lea    0x0(%esi),%esi
     a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a70 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd *nulterminate(struct cmd *cmd) {
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	53                   	push   %ebx
     a74:	83 ec 04             	sub    $0x4,%esp
     a77:	8b 5d 08             	mov    0x8(%ebp),%ebx
    struct listcmd *lcmd;
    struct pipecmd *pcmd;
    struct redircmd *rcmd;
    struct ordcmd *ocmd;

    if (cmd == 0)
     a7a:	85 db                	test   %ebx,%ebx
     a7c:	74 29                	je     aa7 <nulterminate+0x37>
        return 0;

    switch (cmd->type) {
     a7e:	83 3b 06             	cmpl   $0x6,(%ebx)
     a81:	77 24                	ja     aa7 <nulterminate+0x37>
     a83:	8b 03                	mov    (%ebx),%eax
     a85:	ff 24 85 50 13 00 00 	jmp    *0x1350(,%eax,4)
     a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            /* NULL TERMINATE ORDERED CMD */
            /*----------------------------*/

        case ORD:
            ocmd = (struct ordcmd *) cmd;
            nulterminate(ocmd->left);
     a90:	83 ec 0c             	sub    $0xc,%esp
     a93:	ff 73 04             	pushl  0x4(%ebx)
     a96:	e8 d5 ff ff ff       	call   a70 <nulterminate>
            nulterminate(ocmd->right);
     a9b:	58                   	pop    %eax
     a9c:	ff 73 08             	pushl  0x8(%ebx)
     a9f:	e8 cc ff ff ff       	call   a70 <nulterminate>
            break;
     aa4:	83 c4 10             	add    $0x10,%esp
    }
    return cmd;
     aa7:	89 d8                	mov    %ebx,%eax
     aa9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aac:	c9                   	leave  
     aad:	c3                   	ret    
     aae:	66 90                	xchg   %ax,%ax
            nulterminate(rcmd->cmd);
     ab0:	83 ec 0c             	sub    $0xc,%esp
     ab3:	ff 73 04             	pushl  0x4(%ebx)
     ab6:	e8 b5 ff ff ff       	call   a70 <nulterminate>
            *rcmd->efile = 0;
     abb:	8b 43 0c             	mov    0xc(%ebx),%eax
            break;
     abe:	83 c4 10             	add    $0x10,%esp
            *rcmd->efile = 0;
     ac1:	c6 00 00             	movb   $0x0,(%eax)
     ac4:	89 d8                	mov    %ebx,%eax
     ac6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ac9:	c9                   	leave  
     aca:	c3                   	ret    
     acb:	90                   	nop
     acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            nulterminate(bcmd->cmd);
     ad0:	83 ec 0c             	sub    $0xc,%esp
     ad3:	ff 73 04             	pushl  0x4(%ebx)
     ad6:	e8 95 ff ff ff       	call   a70 <nulterminate>
     adb:	89 d8                	mov    %ebx,%eax
            break;
     add:	83 c4 10             	add    $0x10,%esp
     ae0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ae3:	c9                   	leave  
     ae4:	c3                   	ret    
     ae5:	8d 76 00             	lea    0x0(%esi),%esi
            for (i = 0; ecmd->argv[i]; i++)
     ae8:	8b 4b 04             	mov    0x4(%ebx),%ecx
     aeb:	8d 43 08             	lea    0x8(%ebx),%eax
     aee:	85 c9                	test   %ecx,%ecx
     af0:	74 b5                	je     aa7 <nulterminate+0x37>
     af2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                *ecmd->eargv[i] = 0;
     af8:	8b 50 24             	mov    0x24(%eax),%edx
     afb:	83 c0 04             	add    $0x4,%eax
     afe:	c6 02 00             	movb   $0x0,(%edx)
            for (i = 0; ecmd->argv[i]; i++)
     b01:	8b 50 fc             	mov    -0x4(%eax),%edx
     b04:	85 d2                	test   %edx,%edx
     b06:	75 f0                	jne    af8 <nulterminate+0x88>
     b08:	89 d8                	mov    %ebx,%eax
     b0a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b0d:	c9                   	leave  
     b0e:	c3                   	ret    
     b0f:	90                   	nop

00000b10 <parsecmd>:
struct cmd *parsecmd(char *s) {
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	56                   	push   %esi
     b14:	53                   	push   %ebx
    es = s + strlen(s);
     b15:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b18:	83 ec 0c             	sub    $0xc,%esp
     b1b:	53                   	push   %ebx
     b1c:	e8 df 00 00 00       	call   c00 <strlen>
    cmd = parseline(&s, es);
     b21:	59                   	pop    %ecx
    es = s + strlen(s);
     b22:	01 c3                	add    %eax,%ebx
    cmd = parseline(&s, es);
     b24:	8d 45 08             	lea    0x8(%ebp),%eax
     b27:	5e                   	pop    %esi
     b28:	53                   	push   %ebx
     b29:	50                   	push   %eax
     b2a:	e8 d1 fd ff ff       	call   900 <parseline>
     b2f:	89 c6                	mov    %eax,%esi
    peek(&s, es, "");
     b31:	8d 45 08             	lea    0x8(%ebp),%eax
     b34:	83 c4 0c             	add    $0xc,%esp
     b37:	68 96 12 00 00       	push   $0x1296
     b3c:	53                   	push   %ebx
     b3d:	50                   	push   %eax
     b3e:	e8 1d fb ff ff       	call   660 <peek>
    if (s != es) {
     b43:	8b 45 08             	mov    0x8(%ebp),%eax
     b46:	83 c4 10             	add    $0x10,%esp
     b49:	39 d8                	cmp    %ebx,%eax
     b4b:	75 12                	jne    b5f <parsecmd+0x4f>
    nulterminate(cmd);
     b4d:	83 ec 0c             	sub    $0xc,%esp
     b50:	56                   	push   %esi
     b51:	e8 1a ff ff ff       	call   a70 <nulterminate>
}
     b56:	8d 65 f8             	lea    -0x8(%ebp),%esp
     b59:	89 f0                	mov    %esi,%eax
     b5b:	5b                   	pop    %ebx
     b5c:	5e                   	pop    %esi
     b5d:	5d                   	pop    %ebp
     b5e:	c3                   	ret    
        printf(2, "leftovers: %s\n", s);
     b5f:	52                   	push   %edx
     b60:	50                   	push   %eax
     b61:	68 0f 13 00 00       	push   $0x130f
     b66:	6a 02                	push   $0x2
     b68:	e8 b3 03 00 00       	call   f20 <printf>
        panic("syntax");
     b6d:	c7 04 24 d3 12 00 00 	movl   $0x12d3,(%esp)
     b74:	e8 d7 f5 ff ff       	call   150 <panic>
     b79:	66 90                	xchg   %ax,%ax
     b7b:	66 90                	xchg   %ax,%ax
     b7d:	66 90                	xchg   %ax,%ax
     b7f:	90                   	nop

00000b80 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     b80:	55                   	push   %ebp
     b81:	89 e5                	mov    %esp,%ebp
     b83:	53                   	push   %ebx
     b84:	8b 45 08             	mov    0x8(%ebp),%eax
     b87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     b8a:	89 c2                	mov    %eax,%edx
     b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b90:	83 c1 01             	add    $0x1,%ecx
     b93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     b97:	83 c2 01             	add    $0x1,%edx
     b9a:	84 db                	test   %bl,%bl
     b9c:	88 5a ff             	mov    %bl,-0x1(%edx)
     b9f:	75 ef                	jne    b90 <strcpy+0x10>
    ;
  return os;
}
     ba1:	5b                   	pop    %ebx
     ba2:	5d                   	pop    %ebp
     ba3:	c3                   	ret    
     ba4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     baa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000bb0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	53                   	push   %ebx
     bb4:	8b 55 08             	mov    0x8(%ebp),%edx
     bb7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     bba:	0f b6 02             	movzbl (%edx),%eax
     bbd:	0f b6 19             	movzbl (%ecx),%ebx
     bc0:	84 c0                	test   %al,%al
     bc2:	75 1c                	jne    be0 <strcmp+0x30>
     bc4:	eb 2a                	jmp    bf0 <strcmp+0x40>
     bc6:	8d 76 00             	lea    0x0(%esi),%esi
     bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     bd0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     bd3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     bd6:	83 c1 01             	add    $0x1,%ecx
     bd9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
     bdc:	84 c0                	test   %al,%al
     bde:	74 10                	je     bf0 <strcmp+0x40>
     be0:	38 d8                	cmp    %bl,%al
     be2:	74 ec                	je     bd0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     be4:	29 d8                	sub    %ebx,%eax
}
     be6:	5b                   	pop    %ebx
     be7:	5d                   	pop    %ebp
     be8:	c3                   	ret    
     be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bf0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     bf2:	29 d8                	sub    %ebx,%eax
}
     bf4:	5b                   	pop    %ebx
     bf5:	5d                   	pop    %ebp
     bf6:	c3                   	ret    
     bf7:	89 f6                	mov    %esi,%esi
     bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c00 <strlen>:

uint
strlen(char *s)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     c06:	80 39 00             	cmpb   $0x0,(%ecx)
     c09:	74 15                	je     c20 <strlen+0x20>
     c0b:	31 d2                	xor    %edx,%edx
     c0d:	8d 76 00             	lea    0x0(%esi),%esi
     c10:	83 c2 01             	add    $0x1,%edx
     c13:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     c17:	89 d0                	mov    %edx,%eax
     c19:	75 f5                	jne    c10 <strlen+0x10>
    ;
  return n;
}
     c1b:	5d                   	pop    %ebp
     c1c:	c3                   	ret    
     c1d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
     c20:	31 c0                	xor    %eax,%eax
}
     c22:	5d                   	pop    %ebp
     c23:	c3                   	ret    
     c24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000c30 <memset>:

void*
memset(void *dst, int c, uint n)
{
     c30:	55                   	push   %ebp
     c31:	89 e5                	mov    %esp,%ebp
     c33:	57                   	push   %edi
     c34:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     c37:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c3a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c3d:	89 d7                	mov    %edx,%edi
     c3f:	fc                   	cld    
     c40:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     c42:	89 d0                	mov    %edx,%eax
     c44:	5f                   	pop    %edi
     c45:	5d                   	pop    %ebp
     c46:	c3                   	ret    
     c47:	89 f6                	mov    %esi,%esi
     c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c50 <strchr>:

char*
strchr(const char *s, char c)
{
     c50:	55                   	push   %ebp
     c51:	89 e5                	mov    %esp,%ebp
     c53:	53                   	push   %ebx
     c54:	8b 45 08             	mov    0x8(%ebp),%eax
     c57:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     c5a:	0f b6 10             	movzbl (%eax),%edx
     c5d:	84 d2                	test   %dl,%dl
     c5f:	74 1d                	je     c7e <strchr+0x2e>
    if(*s == c)
     c61:	38 d3                	cmp    %dl,%bl
     c63:	89 d9                	mov    %ebx,%ecx
     c65:	75 0d                	jne    c74 <strchr+0x24>
     c67:	eb 17                	jmp    c80 <strchr+0x30>
     c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c70:	38 ca                	cmp    %cl,%dl
     c72:	74 0c                	je     c80 <strchr+0x30>
  for(; *s; s++)
     c74:	83 c0 01             	add    $0x1,%eax
     c77:	0f b6 10             	movzbl (%eax),%edx
     c7a:	84 d2                	test   %dl,%dl
     c7c:	75 f2                	jne    c70 <strchr+0x20>
      return (char*)s;
  return 0;
     c7e:	31 c0                	xor    %eax,%eax
}
     c80:	5b                   	pop    %ebx
     c81:	5d                   	pop    %ebp
     c82:	c3                   	ret    
     c83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c90 <gets>:

char*
gets(char *buf, int max)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	57                   	push   %edi
     c94:	56                   	push   %esi
     c95:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c96:	31 f6                	xor    %esi,%esi
     c98:	89 f3                	mov    %esi,%ebx
{
     c9a:	83 ec 1c             	sub    $0x1c,%esp
     c9d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
     ca0:	eb 2f                	jmp    cd1 <gets+0x41>
     ca2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
     ca8:	8d 45 e7             	lea    -0x19(%ebp),%eax
     cab:	83 ec 04             	sub    $0x4,%esp
     cae:	6a 01                	push   $0x1
     cb0:	50                   	push   %eax
     cb1:	6a 00                	push   $0x0
     cb3:	e8 32 01 00 00       	call   dea <read>
    if(cc < 1)
     cb8:	83 c4 10             	add    $0x10,%esp
     cbb:	85 c0                	test   %eax,%eax
     cbd:	7e 1c                	jle    cdb <gets+0x4b>
      break;
    buf[i++] = c;
     cbf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     cc3:	83 c7 01             	add    $0x1,%edi
     cc6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
     cc9:	3c 0a                	cmp    $0xa,%al
     ccb:	74 23                	je     cf0 <gets+0x60>
     ccd:	3c 0d                	cmp    $0xd,%al
     ccf:	74 1f                	je     cf0 <gets+0x60>
  for(i=0; i+1 < max; ){
     cd1:	83 c3 01             	add    $0x1,%ebx
     cd4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     cd7:	89 fe                	mov    %edi,%esi
     cd9:	7c cd                	jl     ca8 <gets+0x18>
     cdb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
     cdd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     ce0:	c6 03 00             	movb   $0x0,(%ebx)
}
     ce3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ce6:	5b                   	pop    %ebx
     ce7:	5e                   	pop    %esi
     ce8:	5f                   	pop    %edi
     ce9:	5d                   	pop    %ebp
     cea:	c3                   	ret    
     ceb:	90                   	nop
     cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cf0:	8b 75 08             	mov    0x8(%ebp),%esi
     cf3:	8b 45 08             	mov    0x8(%ebp),%eax
     cf6:	01 de                	add    %ebx,%esi
     cf8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
     cfa:	c6 03 00             	movb   $0x0,(%ebx)
}
     cfd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d00:	5b                   	pop    %ebx
     d01:	5e                   	pop    %esi
     d02:	5f                   	pop    %edi
     d03:	5d                   	pop    %ebp
     d04:	c3                   	ret    
     d05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d10 <stat>:

int
stat(char *n, struct stat *st)
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	56                   	push   %esi
     d14:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d15:	83 ec 08             	sub    $0x8,%esp
     d18:	6a 00                	push   $0x0
     d1a:	ff 75 08             	pushl  0x8(%ebp)
     d1d:	e8 f0 00 00 00       	call   e12 <open>
  if(fd < 0)
     d22:	83 c4 10             	add    $0x10,%esp
     d25:	85 c0                	test   %eax,%eax
     d27:	78 27                	js     d50 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     d29:	83 ec 08             	sub    $0x8,%esp
     d2c:	ff 75 0c             	pushl  0xc(%ebp)
     d2f:	89 c3                	mov    %eax,%ebx
     d31:	50                   	push   %eax
     d32:	e8 f3 00 00 00       	call   e2a <fstat>
  close(fd);
     d37:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     d3a:	89 c6                	mov    %eax,%esi
  close(fd);
     d3c:	e8 b9 00 00 00       	call   dfa <close>
  return r;
     d41:	83 c4 10             	add    $0x10,%esp
}
     d44:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d47:	89 f0                	mov    %esi,%eax
     d49:	5b                   	pop    %ebx
     d4a:	5e                   	pop    %esi
     d4b:	5d                   	pop    %ebp
     d4c:	c3                   	ret    
     d4d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     d50:	be ff ff ff ff       	mov    $0xffffffff,%esi
     d55:	eb ed                	jmp    d44 <stat+0x34>
     d57:	89 f6                	mov    %esi,%esi
     d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d60 <atoi>:

int
atoi(const char *s)
{
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	53                   	push   %ebx
     d64:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d67:	0f be 11             	movsbl (%ecx),%edx
     d6a:	8d 42 d0             	lea    -0x30(%edx),%eax
     d6d:	3c 09                	cmp    $0x9,%al
  n = 0;
     d6f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     d74:	77 1f                	ja     d95 <atoi+0x35>
     d76:	8d 76 00             	lea    0x0(%esi),%esi
     d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     d80:	8d 04 80             	lea    (%eax,%eax,4),%eax
     d83:	83 c1 01             	add    $0x1,%ecx
     d86:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     d8a:	0f be 11             	movsbl (%ecx),%edx
     d8d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     d90:	80 fb 09             	cmp    $0x9,%bl
     d93:	76 eb                	jbe    d80 <atoi+0x20>
  return n;
}
     d95:	5b                   	pop    %ebx
     d96:	5d                   	pop    %ebp
     d97:	c3                   	ret    
     d98:	90                   	nop
     d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000da0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	56                   	push   %esi
     da4:	53                   	push   %ebx
     da5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     da8:	8b 45 08             	mov    0x8(%ebp),%eax
     dab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     dae:	85 db                	test   %ebx,%ebx
     db0:	7e 14                	jle    dc6 <memmove+0x26>
     db2:	31 d2                	xor    %edx,%edx
     db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     db8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     dbc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     dbf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
     dc2:	39 d3                	cmp    %edx,%ebx
     dc4:	75 f2                	jne    db8 <memmove+0x18>
  return vdst;
}
     dc6:	5b                   	pop    %ebx
     dc7:	5e                   	pop    %esi
     dc8:	5d                   	pop    %ebp
     dc9:	c3                   	ret    

00000dca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     dca:	b8 01 00 00 00       	mov    $0x1,%eax
     dcf:	cd 40                	int    $0x40
     dd1:	c3                   	ret    

00000dd2 <exit>:
SYSCALL(exit)
     dd2:	b8 02 00 00 00       	mov    $0x2,%eax
     dd7:	cd 40                	int    $0x40
     dd9:	c3                   	ret    

00000dda <wait>:
SYSCALL(wait)
     dda:	b8 03 00 00 00       	mov    $0x3,%eax
     ddf:	cd 40                	int    $0x40
     de1:	c3                   	ret    

00000de2 <pipe>:
SYSCALL(pipe)
     de2:	b8 04 00 00 00       	mov    $0x4,%eax
     de7:	cd 40                	int    $0x40
     de9:	c3                   	ret    

00000dea <read>:
SYSCALL(read)
     dea:	b8 05 00 00 00       	mov    $0x5,%eax
     def:	cd 40                	int    $0x40
     df1:	c3                   	ret    

00000df2 <write>:
SYSCALL(write)
     df2:	b8 10 00 00 00       	mov    $0x10,%eax
     df7:	cd 40                	int    $0x40
     df9:	c3                   	ret    

00000dfa <close>:
SYSCALL(close)
     dfa:	b8 15 00 00 00       	mov    $0x15,%eax
     dff:	cd 40                	int    $0x40
     e01:	c3                   	ret    

00000e02 <kill>:
SYSCALL(kill)
     e02:	b8 06 00 00 00       	mov    $0x6,%eax
     e07:	cd 40                	int    $0x40
     e09:	c3                   	ret    

00000e0a <exec>:
SYSCALL(exec)
     e0a:	b8 07 00 00 00       	mov    $0x7,%eax
     e0f:	cd 40                	int    $0x40
     e11:	c3                   	ret    

00000e12 <open>:
SYSCALL(open)
     e12:	b8 0f 00 00 00       	mov    $0xf,%eax
     e17:	cd 40                	int    $0x40
     e19:	c3                   	ret    

00000e1a <mknod>:
SYSCALL(mknod)
     e1a:	b8 11 00 00 00       	mov    $0x11,%eax
     e1f:	cd 40                	int    $0x40
     e21:	c3                   	ret    

00000e22 <unlink>:
SYSCALL(unlink)
     e22:	b8 12 00 00 00       	mov    $0x12,%eax
     e27:	cd 40                	int    $0x40
     e29:	c3                   	ret    

00000e2a <fstat>:
SYSCALL(fstat)
     e2a:	b8 08 00 00 00       	mov    $0x8,%eax
     e2f:	cd 40                	int    $0x40
     e31:	c3                   	ret    

00000e32 <link>:
SYSCALL(link)
     e32:	b8 13 00 00 00       	mov    $0x13,%eax
     e37:	cd 40                	int    $0x40
     e39:	c3                   	ret    

00000e3a <mkdir>:
SYSCALL(mkdir)
     e3a:	b8 14 00 00 00       	mov    $0x14,%eax
     e3f:	cd 40                	int    $0x40
     e41:	c3                   	ret    

00000e42 <chdir>:
SYSCALL(chdir)
     e42:	b8 09 00 00 00       	mov    $0x9,%eax
     e47:	cd 40                	int    $0x40
     e49:	c3                   	ret    

00000e4a <dup>:
SYSCALL(dup)
     e4a:	b8 0a 00 00 00       	mov    $0xa,%eax
     e4f:	cd 40                	int    $0x40
     e51:	c3                   	ret    

00000e52 <getpid>:
SYSCALL(getpid)
     e52:	b8 0b 00 00 00       	mov    $0xb,%eax
     e57:	cd 40                	int    $0x40
     e59:	c3                   	ret    

00000e5a <sbrk>:
SYSCALL(sbrk)
     e5a:	b8 0c 00 00 00       	mov    $0xc,%eax
     e5f:	cd 40                	int    $0x40
     e61:	c3                   	ret    

00000e62 <sleep>:
SYSCALL(sleep)
     e62:	b8 0d 00 00 00       	mov    $0xd,%eax
     e67:	cd 40                	int    $0x40
     e69:	c3                   	ret    

00000e6a <uptime>:
SYSCALL(uptime)
     e6a:	b8 0e 00 00 00       	mov    $0xe,%eax
     e6f:	cd 40                	int    $0x40
     e71:	c3                   	ret    

00000e72 <countTraps>:
# system call count trap
SYSCALL(countTraps)
     e72:	b8 16 00 00 00       	mov    $0x16,%eax
     e77:	cd 40                	int    $0x40
     e79:	c3                   	ret    
     e7a:	66 90                	xchg   %ax,%ax
     e7c:	66 90                	xchg   %ax,%ax
     e7e:	66 90                	xchg   %ax,%ax

00000e80 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     e80:	55                   	push   %ebp
     e81:	89 e5                	mov    %esp,%ebp
     e83:	57                   	push   %edi
     e84:	56                   	push   %esi
     e85:	53                   	push   %ebx
     e86:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     e89:	85 d2                	test   %edx,%edx
{
     e8b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
     e8e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
     e90:	79 76                	jns    f08 <printint+0x88>
     e92:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     e96:	74 70                	je     f08 <printint+0x88>
    x = -xx;
     e98:	f7 d8                	neg    %eax
    neg = 1;
     e9a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     ea1:	31 f6                	xor    %esi,%esi
     ea3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     ea6:	eb 0a                	jmp    eb2 <printint+0x32>
     ea8:	90                   	nop
     ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
     eb0:	89 fe                	mov    %edi,%esi
     eb2:	31 d2                	xor    %edx,%edx
     eb4:	8d 7e 01             	lea    0x1(%esi),%edi
     eb7:	f7 f1                	div    %ecx
     eb9:	0f b6 92 74 13 00 00 	movzbl 0x1374(%edx),%edx
  }while((x /= base) != 0);
     ec0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
     ec2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
     ec5:	75 e9                	jne    eb0 <printint+0x30>
  if(neg)
     ec7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     eca:	85 c0                	test   %eax,%eax
     ecc:	74 08                	je     ed6 <printint+0x56>
    buf[i++] = '-';
     ece:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
     ed3:	8d 7e 02             	lea    0x2(%esi),%edi
     ed6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
     eda:	8b 7d c0             	mov    -0x40(%ebp),%edi
     edd:	8d 76 00             	lea    0x0(%esi),%esi
     ee0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
     ee3:	83 ec 04             	sub    $0x4,%esp
     ee6:	83 ee 01             	sub    $0x1,%esi
     ee9:	6a 01                	push   $0x1
     eeb:	53                   	push   %ebx
     eec:	57                   	push   %edi
     eed:	88 45 d7             	mov    %al,-0x29(%ebp)
     ef0:	e8 fd fe ff ff       	call   df2 <write>

  while(--i >= 0)
     ef5:	83 c4 10             	add    $0x10,%esp
     ef8:	39 de                	cmp    %ebx,%esi
     efa:	75 e4                	jne    ee0 <printint+0x60>
    putc(fd, buf[i]);
}
     efc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     eff:	5b                   	pop    %ebx
     f00:	5e                   	pop    %esi
     f01:	5f                   	pop    %edi
     f02:	5d                   	pop    %ebp
     f03:	c3                   	ret    
     f04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     f08:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     f0f:	eb 90                	jmp    ea1 <printint+0x21>
     f11:	eb 0d                	jmp    f20 <printf>
     f13:	90                   	nop
     f14:	90                   	nop
     f15:	90                   	nop
     f16:	90                   	nop
     f17:	90                   	nop
     f18:	90                   	nop
     f19:	90                   	nop
     f1a:	90                   	nop
     f1b:	90                   	nop
     f1c:	90                   	nop
     f1d:	90                   	nop
     f1e:	90                   	nop
     f1f:	90                   	nop

00000f20 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     f20:	55                   	push   %ebp
     f21:	89 e5                	mov    %esp,%ebp
     f23:	57                   	push   %edi
     f24:	56                   	push   %esi
     f25:	53                   	push   %ebx
     f26:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f29:	8b 75 0c             	mov    0xc(%ebp),%esi
     f2c:	0f b6 1e             	movzbl (%esi),%ebx
     f2f:	84 db                	test   %bl,%bl
     f31:	0f 84 b3 00 00 00    	je     fea <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
     f37:	8d 45 10             	lea    0x10(%ebp),%eax
     f3a:	83 c6 01             	add    $0x1,%esi
  state = 0;
     f3d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
     f3f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     f42:	eb 2f                	jmp    f73 <printf+0x53>
     f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     f48:	83 f8 25             	cmp    $0x25,%eax
     f4b:	0f 84 a7 00 00 00    	je     ff8 <printf+0xd8>
  write(fd, &c, 1);
     f51:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     f54:	83 ec 04             	sub    $0x4,%esp
     f57:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     f5a:	6a 01                	push   $0x1
     f5c:	50                   	push   %eax
     f5d:	ff 75 08             	pushl  0x8(%ebp)
     f60:	e8 8d fe ff ff       	call   df2 <write>
     f65:	83 c4 10             	add    $0x10,%esp
     f68:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
     f6b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     f6f:	84 db                	test   %bl,%bl
     f71:	74 77                	je     fea <printf+0xca>
    if(state == 0){
     f73:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
     f75:	0f be cb             	movsbl %bl,%ecx
     f78:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     f7b:	74 cb                	je     f48 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     f7d:	83 ff 25             	cmp    $0x25,%edi
     f80:	75 e6                	jne    f68 <printf+0x48>
      if(c == 'd'){
     f82:	83 f8 64             	cmp    $0x64,%eax
     f85:	0f 84 05 01 00 00    	je     1090 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     f8b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     f91:	83 f9 70             	cmp    $0x70,%ecx
     f94:	74 72                	je     1008 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     f96:	83 f8 73             	cmp    $0x73,%eax
     f99:	0f 84 99 00 00 00    	je     1038 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     f9f:	83 f8 63             	cmp    $0x63,%eax
     fa2:	0f 84 08 01 00 00    	je     10b0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     fa8:	83 f8 25             	cmp    $0x25,%eax
     fab:	0f 84 ef 00 00 00    	je     10a0 <printf+0x180>
  write(fd, &c, 1);
     fb1:	8d 45 e7             	lea    -0x19(%ebp),%eax
     fb4:	83 ec 04             	sub    $0x4,%esp
     fb7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     fbb:	6a 01                	push   $0x1
     fbd:	50                   	push   %eax
     fbe:	ff 75 08             	pushl  0x8(%ebp)
     fc1:	e8 2c fe ff ff       	call   df2 <write>
     fc6:	83 c4 0c             	add    $0xc,%esp
     fc9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     fcc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     fcf:	6a 01                	push   $0x1
     fd1:	50                   	push   %eax
     fd2:	ff 75 08             	pushl  0x8(%ebp)
     fd5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     fd8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
     fda:	e8 13 fe ff ff       	call   df2 <write>
  for(i = 0; fmt[i]; i++){
     fdf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
     fe3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     fe6:	84 db                	test   %bl,%bl
     fe8:	75 89                	jne    f73 <printf+0x53>
    }
  }
}
     fea:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fed:	5b                   	pop    %ebx
     fee:	5e                   	pop    %esi
     fef:	5f                   	pop    %edi
     ff0:	5d                   	pop    %ebp
     ff1:	c3                   	ret    
     ff2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
     ff8:	bf 25 00 00 00       	mov    $0x25,%edi
     ffd:	e9 66 ff ff ff       	jmp    f68 <printf+0x48>
    1002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    1008:	83 ec 0c             	sub    $0xc,%esp
    100b:	b9 10 00 00 00       	mov    $0x10,%ecx
    1010:	6a 00                	push   $0x0
    1012:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    1015:	8b 45 08             	mov    0x8(%ebp),%eax
    1018:	8b 17                	mov    (%edi),%edx
    101a:	e8 61 fe ff ff       	call   e80 <printint>
        ap++;
    101f:	89 f8                	mov    %edi,%eax
    1021:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1024:	31 ff                	xor    %edi,%edi
        ap++;
    1026:	83 c0 04             	add    $0x4,%eax
    1029:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    102c:	e9 37 ff ff ff       	jmp    f68 <printf+0x48>
    1031:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1038:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    103b:	8b 08                	mov    (%eax),%ecx
        ap++;
    103d:	83 c0 04             	add    $0x4,%eax
    1040:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
    1043:	85 c9                	test   %ecx,%ecx
    1045:	0f 84 8e 00 00 00    	je     10d9 <printf+0x1b9>
        while(*s != 0){
    104b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    104e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
    1050:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    1052:	84 c0                	test   %al,%al
    1054:	0f 84 0e ff ff ff    	je     f68 <printf+0x48>
    105a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    105d:	89 de                	mov    %ebx,%esi
    105f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1062:	8d 7d e3             	lea    -0x1d(%ebp),%edi
    1065:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1068:	83 ec 04             	sub    $0x4,%esp
          s++;
    106b:	83 c6 01             	add    $0x1,%esi
    106e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1071:	6a 01                	push   $0x1
    1073:	57                   	push   %edi
    1074:	53                   	push   %ebx
    1075:	e8 78 fd ff ff       	call   df2 <write>
        while(*s != 0){
    107a:	0f b6 06             	movzbl (%esi),%eax
    107d:	83 c4 10             	add    $0x10,%esp
    1080:	84 c0                	test   %al,%al
    1082:	75 e4                	jne    1068 <printf+0x148>
    1084:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
    1087:	31 ff                	xor    %edi,%edi
    1089:	e9 da fe ff ff       	jmp    f68 <printf+0x48>
    108e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
    1090:	83 ec 0c             	sub    $0xc,%esp
    1093:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1098:	6a 01                	push   $0x1
    109a:	e9 73 ff ff ff       	jmp    1012 <printf+0xf2>
    109f:	90                   	nop
  write(fd, &c, 1);
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    10a6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    10a9:	6a 01                	push   $0x1
    10ab:	e9 21 ff ff ff       	jmp    fd1 <printf+0xb1>
        putc(fd, *ap);
    10b0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
    10b3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    10b6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    10b8:	6a 01                	push   $0x1
        ap++;
    10ba:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    10bd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    10c0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    10c3:	50                   	push   %eax
    10c4:	ff 75 08             	pushl  0x8(%ebp)
    10c7:	e8 26 fd ff ff       	call   df2 <write>
        ap++;
    10cc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    10cf:	83 c4 10             	add    $0x10,%esp
      state = 0;
    10d2:	31 ff                	xor    %edi,%edi
    10d4:	e9 8f fe ff ff       	jmp    f68 <printf+0x48>
          s = "(null)";
    10d9:	bb 6c 13 00 00       	mov    $0x136c,%ebx
        while(*s != 0){
    10de:	b8 28 00 00 00       	mov    $0x28,%eax
    10e3:	e9 72 ff ff ff       	jmp    105a <printf+0x13a>
    10e8:	66 90                	xchg   %ax,%ax
    10ea:	66 90                	xchg   %ax,%ax
    10ec:	66 90                	xchg   %ax,%ax
    10ee:	66 90                	xchg   %ax,%ax

000010f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    10f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10f1:	a1 e4 19 00 00       	mov    0x19e4,%eax
{
    10f6:	89 e5                	mov    %esp,%ebp
    10f8:	57                   	push   %edi
    10f9:	56                   	push   %esi
    10fa:	53                   	push   %ebx
    10fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    10fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1108:	39 c8                	cmp    %ecx,%eax
    110a:	8b 10                	mov    (%eax),%edx
    110c:	73 32                	jae    1140 <free+0x50>
    110e:	39 d1                	cmp    %edx,%ecx
    1110:	72 04                	jb     1116 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1112:	39 d0                	cmp    %edx,%eax
    1114:	72 32                	jb     1148 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1116:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1119:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    111c:	39 fa                	cmp    %edi,%edx
    111e:	74 30                	je     1150 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1120:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1123:	8b 50 04             	mov    0x4(%eax),%edx
    1126:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1129:	39 f1                	cmp    %esi,%ecx
    112b:	74 3a                	je     1167 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    112d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    112f:	a3 e4 19 00 00       	mov    %eax,0x19e4
}
    1134:	5b                   	pop    %ebx
    1135:	5e                   	pop    %esi
    1136:	5f                   	pop    %edi
    1137:	5d                   	pop    %ebp
    1138:	c3                   	ret    
    1139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1140:	39 d0                	cmp    %edx,%eax
    1142:	72 04                	jb     1148 <free+0x58>
    1144:	39 d1                	cmp    %edx,%ecx
    1146:	72 ce                	jb     1116 <free+0x26>
{
    1148:	89 d0                	mov    %edx,%eax
    114a:	eb bc                	jmp    1108 <free+0x18>
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1150:	03 72 04             	add    0x4(%edx),%esi
    1153:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1156:	8b 10                	mov    (%eax),%edx
    1158:	8b 12                	mov    (%edx),%edx
    115a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    115d:	8b 50 04             	mov    0x4(%eax),%edx
    1160:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1163:	39 f1                	cmp    %esi,%ecx
    1165:	75 c6                	jne    112d <free+0x3d>
    p->s.size += bp->s.size;
    1167:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    116a:	a3 e4 19 00 00       	mov    %eax,0x19e4
    p->s.size += bp->s.size;
    116f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1172:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1175:	89 10                	mov    %edx,(%eax)
}
    1177:	5b                   	pop    %ebx
    1178:	5e                   	pop    %esi
    1179:	5f                   	pop    %edi
    117a:	5d                   	pop    %ebp
    117b:	c3                   	ret    
    117c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001180 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	56                   	push   %esi
    1185:	53                   	push   %ebx
    1186:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1189:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    118c:	8b 15 e4 19 00 00    	mov    0x19e4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1192:	8d 78 07             	lea    0x7(%eax),%edi
    1195:	c1 ef 03             	shr    $0x3,%edi
    1198:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    119b:	85 d2                	test   %edx,%edx
    119d:	0f 84 9d 00 00 00    	je     1240 <malloc+0xc0>
    11a3:	8b 02                	mov    (%edx),%eax
    11a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    11a8:	39 cf                	cmp    %ecx,%edi
    11aa:	76 6c                	jbe    1218 <malloc+0x98>
    11ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    11b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    11b7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    11ba:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    11c1:	eb 0e                	jmp    11d1 <malloc+0x51>
    11c3:	90                   	nop
    11c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    11ca:	8b 48 04             	mov    0x4(%eax),%ecx
    11cd:	39 f9                	cmp    %edi,%ecx
    11cf:	73 47                	jae    1218 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    11d1:	39 05 e4 19 00 00    	cmp    %eax,0x19e4
    11d7:	89 c2                	mov    %eax,%edx
    11d9:	75 ed                	jne    11c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    11db:	83 ec 0c             	sub    $0xc,%esp
    11de:	56                   	push   %esi
    11df:	e8 76 fc ff ff       	call   e5a <sbrk>
  if(p == (char*)-1)
    11e4:	83 c4 10             	add    $0x10,%esp
    11e7:	83 f8 ff             	cmp    $0xffffffff,%eax
    11ea:	74 1c                	je     1208 <malloc+0x88>
  hp->s.size = nu;
    11ec:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    11ef:	83 ec 0c             	sub    $0xc,%esp
    11f2:	83 c0 08             	add    $0x8,%eax
    11f5:	50                   	push   %eax
    11f6:	e8 f5 fe ff ff       	call   10f0 <free>
  return freep;
    11fb:	8b 15 e4 19 00 00    	mov    0x19e4,%edx
      if((p = morecore(nunits)) == 0)
    1201:	83 c4 10             	add    $0x10,%esp
    1204:	85 d2                	test   %edx,%edx
    1206:	75 c0                	jne    11c8 <malloc+0x48>
        return 0;
  }
}
    1208:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    120b:	31 c0                	xor    %eax,%eax
}
    120d:	5b                   	pop    %ebx
    120e:	5e                   	pop    %esi
    120f:	5f                   	pop    %edi
    1210:	5d                   	pop    %ebp
    1211:	c3                   	ret    
    1212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1218:	39 cf                	cmp    %ecx,%edi
    121a:	74 54                	je     1270 <malloc+0xf0>
        p->s.size -= nunits;
    121c:	29 f9                	sub    %edi,%ecx
    121e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1221:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1224:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1227:	89 15 e4 19 00 00    	mov    %edx,0x19e4
}
    122d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1230:	83 c0 08             	add    $0x8,%eax
}
    1233:	5b                   	pop    %ebx
    1234:	5e                   	pop    %esi
    1235:	5f                   	pop    %edi
    1236:	5d                   	pop    %ebp
    1237:	c3                   	ret    
    1238:	90                   	nop
    1239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1240:	c7 05 e4 19 00 00 e8 	movl   $0x19e8,0x19e4
    1247:	19 00 00 
    124a:	c7 05 e8 19 00 00 e8 	movl   $0x19e8,0x19e8
    1251:	19 00 00 
    base.s.size = 0;
    1254:	b8 e8 19 00 00       	mov    $0x19e8,%eax
    1259:	c7 05 ec 19 00 00 00 	movl   $0x0,0x19ec
    1260:	00 00 00 
    1263:	e9 44 ff ff ff       	jmp    11ac <malloc+0x2c>
    1268:	90                   	nop
    1269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1270:	8b 08                	mov    (%eax),%ecx
    1272:	89 0a                	mov    %ecx,(%edx)
    1274:	eb b1                	jmp    1227 <malloc+0xa7>

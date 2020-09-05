	.file	"client.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"clear"
	.align 8
.LC1:
	.string	"\t\t\t***********1.\346\263\250\345\206\214**********\n\t\t\t***********2.\347\231\273\345\275\225**********\n\t\t\t***********3.\351\200\200\345\207\272**********\n"
.LC2:
	.string	"\033[33m%s\033[0m"
.LC3:
	.string	"%d"
	.text
	.globl	menu
	.type	menu, @function
menu:
.LFB2:
	.file 1 "client.c"
	.loc 1 6 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 6 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 9 0
	movl	$.LC0, %edi
	call	system
.L6:
	.loc 1 13 0
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	.loc 1 15 0
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 16 0
	movl	-12(%rbp), %eax
	cmpl	$2, %eax
	je	.L3
	cmpl	$3, %eax
	je	.L4
	cmpl	$1, %eax
	jne	.L2
	.loc 1 19 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	write_msg
	.loc 1 20 0
	jmp	.L2
.L3:
	.loc 1 22 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	log_in
	.loc 1 23 0
	jmp	.L2
.L4:
	.loc 1 25 0
	movl	$0, %edi
	call	exit
.L2:
	.loc 1 28 0
	jmp	.L6
	.cfi_endproc
.LFE2:
	.size	menu, .-menu
	.globl	flag
	.bss
	.align 4
	.type	flag, @object
	.size	flag, 4
flag:
	.zero	4
	.section	.rodata
	.align 8
.LC4:
	.string	"\t\t\t**********1.\346\237\245\347\234\213\346\211\200\346\234\211\345\234\250\347\272\277\347\224\250\346\210\267*********\n\t\t\t**********2.\346\237\245\347\234\213\346\211\200\346\234\211\347\224\250\346\210\267\346\223\215\344\275\234\350\256\260\345\275\225*****\n\t\t\t**********3.\346\237\245\347\234\213\346\211\200\346\234\211\347\224\250\346\210\267\345\270\220\345\217\267\344\277\241\346\201\257*****\n\t\t\t**********4.\351\200\200\345\207\272*********************\n"
.LC5:
	.string	"\350\257\267\350\276\223\345\205\245\351\200\211\346\213\251:"
	.text
	.globl	menu3
	.type	menu3, @function
menu3:
.LFB3:
	.loc 1 38 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 38 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L15:
	.loc 1 44 0
	movl	$.LC4, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	.loc 1 46 0
	movl	$.LC5, %edi
	call	puts
	.loc 1 48 0
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 50 0
	movl	-12(%rbp), %eax
	cmpl	$2, %eax
	je	.L10
	cmpl	$2, %eax
	jg	.L11
	cmpl	$1, %eax
	je	.L12
	jmp	.L9
.L11:
	cmpl	$3, %eax
	je	.L13
	cmpl	$4, %eax
	je	.L14
	jmp	.L9
.L12:
	.loc 1 54 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	choose
	.loc 1 55 0
	jmp	.L9
.L10:
	.loc 1 59 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	record_mysql
	.loc 1 60 0
	jmp	.L9
.L13:
	.loc 1 64 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	show_mysql
	.loc 1 65 0
	jmp	.L9
.L14:
	.loc 1 69 0
	movl	$0, %edi
	call	exit
.L9:
	.loc 1 72 0
	jmp	.L15
	.cfi_endproc
.LFE3:
	.size	menu3, .-menu3
	.section	.rodata
.LC6:
	.string	"\350\257\267\350\276\223\345\205\245\345\257\206\347\240\201:"
.LC7:
	.string	"\n\345\257\206\347\240\201\346\255\243\347\241\256"
.LC8:
	.string	"\n\345\257\206\347\240\201\351\224\231\350\257\257"
	.text
	.globl	get_right
	.type	get_right, @function
get_right:
.LFB4:
	.loc 1 75 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	.loc 1 75 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 78 0
	movabsq	$474215179361, %rax
	movq	%rax, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	.loc 1 80 0
	nop
.L18:
	.loc 1 80 0 is_stmt 0 discriminator 1
	call	getchar
	cmpl	$10, %eax
	jne	.L18
	.loc 1 82 0 is_stmt 1
	movl	$.LC6, %edi
	call	puts
	.loc 1 84 0
	leaq	-80(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	getpasswd
	.loc 1 88 0
	leaq	-48(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L19
	.loc 1 90 0
	movl	$.LC7, %edi
	call	puts
	.loc 1 91 0
	movl	-84(%rbp), %eax
	movl	%eax, %edi
	call	menu3
	.loc 1 100 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L20
	jmp	.L21
.L19:
	.loc 1 96 0
	movl	$.LC8, %edi
	call	puts
	.loc 1 97 0
	movl	$0, %edi
	call	exit
.L21:
	.loc 1 100 0
	call	__stack_chk_fail
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	get_right, .-get_right
	.section	.rodata
.LC9:
	.string	"\346\230\257\345\220\246\346\237\245\347\234\213\347\224\250\346\210\267\346\223\215\344\275\234"
.LC10:
	.string	"%c"
.LC11:
	.string	"write"
.LC12:
	.string	"read"
.LC13:
	.string	"\346\227\266\351\227\264"
.LC14:
	.string	"\346\223\215\344\275\234"
.LC15:
	.string	"%s\t"
	.text
	.globl	record_mysql
	.type	record_mysql, @function
record_mysql:
.LFB5:
	.loc 1 104 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1152, %rsp
	movl	%edi, -1140(%rbp)
	.loc 1 104 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 111 0
	movq	$0, -1112(%rbp)
	.loc 1 117 0
	movl	$9, %edi
	call	malloc
	movq	%rax, -1112(%rbp)
	.loc 1 119 0
	movq	-1112(%rbp), %rax
	movl	$1, 4(%rax)
	.loc 1 121 0
	movq	-1112(%rbp), %rax
	movl	$81, (%rax)
	.loc 1 123 0
	movq	-1112(%rbp), %rax
	movl	(%rax), %eax
	xorb	$-122, %al
	movl	%eax, %edx
	movq	-1112(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 127 0
	nop
.L23:
	.loc 1 127 0 is_stmt 0 discriminator 1
	call	getchar
	cmpl	$10, %eax
	jne	.L23
	.loc 1 129 0 is_stmt 1
	movl	$.LC9, %edi
	call	puts
	.loc 1 131 0
	leaq	-1129(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 133 0
	movzbl	-1129(%rbp), %eax
	cmpb	$121, %al
	jne	.L24
.LBB2:
	.loc 1 136 0
	movq	-1112(%rbp), %rax
	leaq	8(%rax), %rdx
	movzbl	-1129(%rbp), %eax
	movb	%al, (%rdx)
	.loc 1 138 0
	movq	-1112(%rbp), %rcx
	movl	-1140(%rbp), %eax
	movl	$9, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -1124(%rbp)
	.loc 1 140 0
	cmpl	$0, -1124(%rbp)
	jns	.L25
	.loc 1 142 0
	movl	$.LC11, %edi
	call	perror
.L25:
	.loc 1 147 0
	movl	$1, -1128(%rbp)
.L35:
	.loc 1 154 0
	leaq	-1104(%rbp), %rcx
	movl	-1140(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -1124(%rbp)
	.loc 1 156 0
	cmpl	$0, -1124(%rbp)
	jns	.L26
	.loc 1 158 0
	movl	$.LC12, %edi
	call	perror
.L26:
	.loc 1 161 0
	movl	-1104(%rbp), %eax
	cmpl	$84, %eax
	jne	.L27
	.loc 1 165 0
	movl	-1100(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-48(%rbp), %rcx
	movl	-1140(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	.loc 1 167 0
	leaq	-48(%rbp), %rax
	movl	$.LC13, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L28
	.loc 1 169 0
	movl	$9, %edi
	call	putchar
	jmp	.L29
.L28:
	.loc 1 171 0
	leaq	-48(%rbp), %rax
	movl	$.LC14, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L29
	.loc 1 173 0
	movl	$9, %edi
	call	putchar
.L29:
	.loc 1 175 0
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
	jmp	.L35
.L27:
	.loc 1 178 0
	movl	-1104(%rbp), %eax
	cmpl	$85, %eax
	jne	.L31
	.loc 1 181 0
	leaq	-1120(%rbp), %rcx
	movl	-1140(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -1124(%rbp)
	.loc 1 183 0
	movl	$10, %edi
	call	putchar
	jmp	.L35
.L31:
	.loc 1 185 0
	movl	-1104(%rbp), %eax
	cmpl	$86, %eax
	jne	.L32
	.loc 1 188 0
	leaq	-1088(%rbp), %rcx
	movl	-1140(%rbp), %eax
	movl	$1028, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -1124(%rbp)
	.loc 1 190 0
	leaq	-1088(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
	.loc 1 192 0
	movl	-1116(%rbp), %ecx
	movl	-1128(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L33
	.loc 1 194 0
	movl	$10, %edi
	call	putchar
.L33:
	.loc 1 197 0
	addl	$1, -1128(%rbp)
	jmp	.L35
.L32:
	.loc 1 199 0
	movl	-1104(%rbp), %eax
	cmpl	$87, %eax
	je	.L38
	.loc 1 203 0
	jmp	.L35
.L38:
	.loc 1 201 0
	nop
.L24:
.LBE2:
	.loc 1 205 0
	movl	$0, %eax
	.loc 1 206 0
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L37
	call	__stack_chk_fail
.L37:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	record_mysql, .-record_mysql
	.section	.rodata
.LC16:
	.string	"\346\230\257\345\220\246\346\237\245\347\234\213\347\224\250\346\210\267\346\225\260\346\215\256"
	.text
	.globl	show_mysql
	.type	show_mysql, @function
show_mysql:
.LFB6:
	.loc 1 213 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1152, %rsp
	movl	%edi, -1140(%rbp)
	.loc 1 213 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 220 0
	movq	$0, -1112(%rbp)
	.loc 1 226 0
	movl	$9, %edi
	call	malloc
	movq	%rax, -1112(%rbp)
	.loc 1 228 0
	movq	-1112(%rbp), %rax
	movl	$1, 4(%rax)
	.loc 1 230 0
	movq	-1112(%rbp), %rax
	movl	$71, (%rax)
	.loc 1 232 0
	movq	-1112(%rbp), %rax
	movl	(%rax), %eax
	xorb	$-122, %al
	movl	%eax, %edx
	movq	-1112(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 236 0
	nop
.L40:
	.loc 1 236 0 is_stmt 0 discriminator 1
	call	getchar
	cmpl	$10, %eax
	jne	.L40
	.loc 1 238 0 is_stmt 1
	movl	$.LC16, %edi
	call	puts
	.loc 1 240 0
	leaq	-1129(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 242 0
	movzbl	-1129(%rbp), %eax
	cmpb	$121, %al
	jne	.L41
.LBB3:
	.loc 1 244 0
	movq	-1112(%rbp), %rax
	leaq	8(%rax), %rdx
	movzbl	-1129(%rbp), %eax
	movb	%al, (%rdx)
	.loc 1 246 0
	movq	-1112(%rbp), %rcx
	movl	-1140(%rbp), %eax
	movl	$9, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -1124(%rbp)
	.loc 1 249 0
	cmpl	$0, -1124(%rbp)
	jns	.L42
	.loc 1 251 0
	movl	$.LC11, %edi
	call	perror
.L42:
	.loc 1 256 0
	movl	$1, -1128(%rbp)
.L50:
	.loc 1 262 0
	leaq	-1104(%rbp), %rcx
	movl	-1140(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -1124(%rbp)
	.loc 1 264 0
	cmpl	$0, -1124(%rbp)
	jns	.L43
	.loc 1 266 0
	movl	$.LC12, %edi
	call	perror
.L43:
	.loc 1 270 0
	movl	-1104(%rbp), %eax
	cmpl	$74, %eax
	jne	.L44
	.loc 1 273 0
	movl	-1100(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-48(%rbp), %rcx
	movl	-1140(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	.loc 1 275 0
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
	jmp	.L50
.L44:
	.loc 1 277 0
	movl	-1104(%rbp), %eax
	cmpl	$75, %eax
	jne	.L46
	.loc 1 279 0
	leaq	-1120(%rbp), %rcx
	movl	-1140(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -1124(%rbp)
	.loc 1 281 0
	movl	$10, %edi
	call	putchar
	jmp	.L50
.L46:
	.loc 1 283 0
	movl	-1104(%rbp), %eax
	cmpl	$76, %eax
	jne	.L47
	.loc 1 286 0
	leaq	-1088(%rbp), %rcx
	movl	-1140(%rbp), %eax
	movl	$1028, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -1124(%rbp)
	.loc 1 288 0
	leaq	-1088(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
	.loc 1 290 0
	movl	-1116(%rbp), %ecx
	movl	-1128(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L48
	.loc 1 292 0
	movl	$10, %edi
	call	putchar
.L48:
	.loc 1 295 0
	addl	$1, -1128(%rbp)
	jmp	.L50
.L47:
	.loc 1 297 0
	movl	-1104(%rbp), %eax
	cmpl	$77, %eax
	je	.L53
	.loc 1 301 0
	jmp	.L50
.L53:
	.loc 1 299 0
	nop
.L41:
.LBE3:
	.loc 1 303 0
	movl	$0, %eax
	.loc 1 304 0
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L52
	call	__stack_chk_fail
.L52:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	show_mysql, .-show_mysql
	.section	.rodata
.LC17:
	.string	"\346\230\257\345\220\246\346\263\250\351\224\200\347\224\250\346\210\267"
.LC18:
	.string	"\346\263\250\351\224\200\346\210\220\345\212\237!"
.LC19:
	.string	"\346\263\250\351\224\200\345\244\261\350\264\245!"
	.text
	.globl	exit_msg
	.type	exit_msg, @function
exit_msg:
.LFB7:
	.loc 1 309 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	.loc 1 309 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 314 0
	movq	$0, -16(%rbp)
	.loc 1 318 0
	movl	$9, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	.loc 1 320 0
	movq	-16(%rbp), %rax
	movl	$1, 4(%rax)
	.loc 1 322 0
	movq	-16(%rbp), %rax
	movl	$51, (%rax)
	.loc 1 325 0
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	xorb	$-122, %al
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 329 0
	nop
.L55:
	.loc 1 329 0 is_stmt 0 discriminator 1
	call	getchar
	cmpl	$10, %eax
	jne	.L55
	.loc 1 331 0 is_stmt 1
	movl	$.LC17, %edi
	call	puts
	.loc 1 333 0
	leaq	-25(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 335 0
	movzbl	-25(%rbp), %eax
	cmpb	$121, %al
	jne	.L56
	.loc 1 337 0
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movzbl	-25(%rbp), %eax
	movb	%al, (%rdx)
	.loc 1 339 0
	movq	-16(%rbp), %rcx
	movl	-36(%rbp), %eax
	movl	$9, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -20(%rbp)
	.loc 1 342 0
	cmpl	$0, -20(%rbp)
	jns	.L57
	.loc 1 344 0
	movl	$.LC11, %edi
	call	perror
.L57:
	.loc 1 347 0
	leaq	-24(%rbp), %rcx
	movl	-36(%rbp), %eax
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -20(%rbp)
	.loc 1 349 0
	cmpl	$0, -20(%rbp)
	jns	.L58
	.loc 1 351 0
	movl	$.LC12, %edi
	call	perror
	jmp	.L61
.L58:
	.loc 1 355 0
	movl	-24(%rbp), %eax
	cmpl	$52, %eax
	jne	.L60
	.loc 1 357 0
	movl	$.LC18, %edi
	call	puts
	.loc 1 358 0
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	menu
	jmp	.L61
.L60:
	.loc 1 362 0
	movl	$.LC19, %edi
	call	puts
	jmp	.L61
.L56:
	.loc 1 367 0
	movl	$0, %eax
	jmp	.L63
.L61:
	.loc 1 370 0
	movl	$0, %eax
.L63:
	.loc 1 371 0 discriminator 1
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L64
	.loc 1 371 0 is_stmt 0
	call	__stack_chk_fail
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	exit_msg, .-exit_msg
	.section	.rodata
.LC20:
	.string	"tcp broken"
.LC21:
	.string	"id:%d\t\347\253\257\345\217\243:%d\tip:%s\tcfd:%d\n"
	.text
	.globl	show_cli
	.type	show_cli, @function
show_cli:
.LFB8:
	.loc 1 375 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 377 0
	movq	$0, -24(%rbp)
	.loc 1 377 0
	movq	$0, -8(%rbp)
	.loc 1 377 0
	movq	$0, -16(%rbp)
.L70:
	.loc 1 383 0
	movl	$120, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	.loc 1 385 0
	movq	-8(%rbp), %rcx
	movl	-36(%rbp), %eax
	movl	$120, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -28(%rbp)
	.loc 1 387 0
	cmpl	$0, -28(%rbp)
	jns	.L66
	.loc 1 389 0
	movl	$.LC12, %edi
	call	perror
	.loc 1 390 0
	jmp	.L67
.L66:
	.loc 1 391 0
	cmpl	$0, -28(%rbp)
	jne	.L68
	.loc 1 393 0
	movl	$.LC20, %edi
	call	puts
	.loc 1 394 0
	jmp	.L67
.L68:
	.loc 1 397 0
	movq	-8(%rbp), %rax
	movq	112(%rax), %rax
	testq	%rax, %rax
	jne	.L69
	.loc 1 400 0
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 112(%rax)
	.loc 1 402 0
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 404 0
	jmp	.L67
.L69:
	.loc 1 407 0
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 112(%rax)
	.loc 1 409 0
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 411 0
	jmp	.L70
.L67:
	.loc 1 412 0
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 413 0
	jmp	.L71
.L72:
	.loc 1 415 0
	movq	-24(%rbp), %rax
	movl	36(%rax), %esi
	movq	-24(%rbp), %rax
	leaq	44(%rax), %rcx
	movq	-24(%rbp), %rax
	movl	40(%rax), %edx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%esi, %r8d
	movl	%eax, %esi
	movl	$.LC21, %edi
	movl	$0, %eax
	call	printf
	.loc 1 416 0
	movq	-24(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, -24(%rbp)
.L71:
	.loc 1 413 0
	cmpq	$0, -24(%rbp)
	jne	.L72
	.loc 1 418 0
	movl	$0, %eax
	.loc 1 419 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	show_cli, .-show_cli
	.globl	choose
	.type	choose, @function
choose:
.LFB9:
	.loc 1 422 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 427 0
	movq	$0, -8(%rbp)
	.loc 1 429 0
	movl	$8, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	.loc 1 431 0
	movq	-8(%rbp), %rax
	movl	$61, (%rax)
	.loc 1 433 0
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	xorb	$-122, %al
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 437 0
	movq	-8(%rbp), %rcx
	movl	-20(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -12(%rbp)
	.loc 1 439 0
	cmpl	$0, -12(%rbp)
	jns	.L75
	.loc 1 441 0
	movl	$.LC11, %edi
	call	perror
	.loc 1 442 0
	movl	$-1, %eax
	jmp	.L76
.L75:
	.loc 1 445 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	rec_link
	.loc 1 447 0
	movl	$0, %eax
.L76:
	.loc 1 448 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	choose, .-choose
	.section	.rodata
.LC22:
	.string	"\346\226\255\345\274\200\346\210\220\345\212\237!"
	.text
	.globl	rec_link
	.type	rec_link, @function
rec_link:
.LFB10:
	.loc 1 452 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	.loc 1 452 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 459 0
	leaq	-16(%rbp), %rcx
	movl	-36(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -20(%rbp)
	.loc 1 461 0
	cmpl	$0, -20(%rbp)
	jns	.L78
	.loc 1 463 0
	movl	$.LC12, %edi
	call	perror
	.loc 1 464 0
	jmp	.L79
.L78:
	.loc 1 466 0
	cmpl	$0, -20(%rbp)
	jne	.L80
	.loc 1 469 0
	movl	$.LC22, %edi
	call	puts
	.loc 1 471 0
	jmp	.L79
.L80:
	.loc 1 473 0
	movl	-16(%rbp), %eax
	cmpl	$100, %eax
	jne	.L83
	.loc 1 475 0
	movq	-16(%rbp), %rdx
	movl	-36(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	show_cli
.L83:
	.loc 1 477 0
	nop
.L79:
	.loc 1 480 0 discriminator 1
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L82
	.loc 1 480 0 is_stmt 0
	call	__stack_chk_fail
.L82:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	rec_link, .-rec_link
	.section	.rodata
	.align 8
.LC23:
	.string	"\t\t\t**********1.\347\273\210\347\253\257\345\221\275\344\273\244*******\n\t\t\t**********2.\344\270\212\344\274\240\346\226\207\344\273\266*******\n\t\t\t**********3.\344\270\213\350\275\275\346\226\207\344\273\266*******\n\t\t\t**********4.\346\263\250\351\224\200    *******\n\t\t\t**********5.\351\200\200\345\207\272    *******\n\t\t\t**********6.\350\216\267\345\217\226\346\233\264\345\244\232\346\235\203\351\231\220***\n"
	.text
	.globl	menu2
	.type	menu2, @function
menu2:
.LFB11:
	.loc 1 489 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 489 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L94:
	.loc 1 494 0
	movl	$.LC23, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	.loc 1 495 0
	movl	$.LC5, %edi
	call	puts
	.loc 1 496 0
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 498 0
	movl	-12(%rbp), %eax
	cmpl	$6, %eax
	ja	.L96
	movl	%eax, %eax
	movq	.L87(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L87:
	.quad	.L96
	.quad	.L86
	.quad	.L88
	.quad	.L89
	.quad	.L90
	.quad	.L91
	.quad	.L92
	.text
.L86:
	.loc 1 502 0
	movl	$.LC0, %edi
	call	system
	.loc 1 504 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	order
	.loc 1 506 0
	jmp	.L93
.L88:
	.loc 1 509 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	send_order
	.loc 1 511 0
	jmp	.L93
.L89:
	.loc 1 514 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	rec_order
	.loc 1 516 0
	jmp	.L93
.L90:
	.loc 1 518 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	exit_msg
	.loc 1 520 0
	jmp	.L93
.L91:
	.loc 1 523 0
	movl	$0, %edi
	call	exit
.L92:
	.loc 1 528 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	get_right
	.loc 1 530 0
	jmp	.L93
.L96:
	.loc 1 533 0
	nop
.L93:
	.loc 1 535 0 discriminator 1
	jmp	.L94
	.cfi_endproc
.LFE11:
	.size	menu2, .-menu2
	.section	.rodata
.LC24:
	.string	"\350\257\267\350\276\223\345\205\245\345\270\220\345\217\267\357\274\232"
.LC25:
	.string	"\350\257\267\350\276\223\345\205\245\345\257\206\347\240\201\357\274\232"
.LC26:
	.string	"\n\347\231\273\345\275\225\346\210\220\345\212\237!"
.LC27:
	.string	"\n\347\231\273\345\275\225\345\244\261\350\264\245!"
	.text
	.globl	log_in
	.type	log_in, @function
log_in:
.LFB12:
	.loc 1 541 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movl	%edi, -164(%rbp)
	.loc 1 541 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 546 0
	movq	$0, -136(%rbp)
	.loc 1 552 0
	movb	$121, -145(%rbp)
	.loc 1 554 0
	cmpb	$121, -145(%rbp)
	jne	.L98
	.loc 1 557 0
	movl	$76, %edi
	call	malloc
	movq	%rax, -136(%rbp)
	.loc 1 559 0
	movq	-136(%rbp), %rax
	movl	$68, 4(%rax)
	.loc 1 561 0
	movq	-136(%rbp), %rax
	movl	$41, (%rax)
	.loc 1 563 0
	movq	-136(%rbp), %rax
	movl	(%rax), %eax
	xorb	$-122, %al
	movl	%eax, %edx
	movq	-136(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 568 0
	movl	$.LC24, %edi
	call	puts
	.loc 1 570 0
	leaq	-128(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 572 0
	nop
.L99:
	.loc 1 572 0 is_stmt 0 discriminator 1
	call	getchar
	cmpl	$10, %eax
	jne	.L99
	.loc 1 574 0 is_stmt 1
	movl	$.LC25, %edi
	call	puts
	.loc 1 576 0
	leaq	-48(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	getpasswd
	.loc 1 578 0
	leaq	-48(%rbp), %rax
	leaq	-128(%rbp), %rdx
	addq	$36, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy
	.loc 1 581 0
	movq	-136(%rbp), %rax
	addq	$8, %rax
	movq	-128(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-120(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-112(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-104(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-96(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-88(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-80(%rbp), %rdx
	movq	%rdx, 48(%rax)
	movq	-72(%rbp), %rdx
	movq	%rdx, 56(%rax)
	movl	-64(%rbp), %edx
	movl	%edx, 64(%rax)
	.loc 1 583 0
	movq	-136(%rbp), %rcx
	movl	-164(%rbp), %eax
	movl	$76, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -140(%rbp)
	.loc 1 585 0
	cmpl	$0, -140(%rbp)
	jns	.L100
	.loc 1 587 0
	movl	$.LC11, %edi
	call	perror
	.loc 1 588 0
	jmp	.L98
.L100:
	.loc 1 590 0
	leaq	-144(%rbp), %rcx
	movl	-164(%rbp), %eax
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -140(%rbp)
	.loc 1 591 0
	cmpl	$0, -140(%rbp)
	jns	.L101
	.loc 1 593 0
	movl	$.LC12, %edi
	call	perror
	.loc 1 594 0
	jmp	.L98
.L101:
	.loc 1 597 0
	movl	-144(%rbp), %eax
	cmpl	$42, %eax
	jne	.L102
	.loc 1 599 0
	movl	$.LC26, %edi
	call	puts
	.loc 1 600 0
	movl	-164(%rbp), %eax
	movl	%eax, %edi
	call	menu2
	.loc 1 601 0
	jmp	.L98
.L102:
	.loc 1 605 0
	movl	$.LC27, %edi
	call	puts
	.loc 1 606 0
	nop
.L98:
	.loc 1 610 0
	nop
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L103
	call	__stack_chk_fail
.L103:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	log_in, .-log_in
	.section	.rodata
	.align 8
.LC28:
	.string	"\350\276\223\345\205\245\351\234\200\350\246\201\344\270\213\350\275\275\347\232\204\346\226\207\344\273\266\357\274\232"
.LC29:
	.string	"%s"
.LC30:
	.string	"write error%d\n"
.LC31:
	.string	"open"
.LC32:
	.string	"TCP  broken"
.LC33:
	.string	"\344\270\213\350\275\275\345\256\214\346\257\225\357\274\201"
	.text
	.globl	rec_order
	.type	rec_order, @function
rec_order:
.LFB13:
	.loc 1 615 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2128, %rsp
	movl	%edi, -2116(%rbp)
	.loc 1 615 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 616 0
	movq	$0, -2088(%rbp)
	.loc 1 626 0
	movl	$0, -2112(%rbp)
	.loc 1 634 0
	movl	$.LC28, %edi
	call	puts
	.loc 1 636 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC29, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 638 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	addq	$8, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -2088(%rbp)
	.loc 1 640 0
	movq	-2088(%rbp), %rax
	movl	$31, (%rax)
	.loc 1 643 0
	movq	-2088(%rbp), %rax
	movl	(%rax), %eax
	xorb	$-122, %al
	movl	%eax, %edx
	movq	-2088(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 647 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	-2088(%rbp), %rax
	leaq	8(%rax), %rcx
	leaq	-2064(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy
	.loc 1 649 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, %edx
	movq	-2088(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 1 651 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	leaq	8(%rax), %rdx
	movq	-2088(%rbp), %rcx
	movl	-2116(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2108(%rbp)
	.loc 1 653 0
	cmpl	$0, -2108(%rbp)
	jns	.L105
	.loc 1 655 0
	movl	$655, %esi
	movl	$.LC30, %edi
	movl	$0, %eax
	call	printf
	.loc 1 656 0
	movl	$-1, %eax
	jmp	.L116
.L105:
	.loc 1 659 0
	leaq	-2064(%rbp), %rax
	movl	$420, %edx
	movl	$577, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open
	movl	%eax, -2104(%rbp)
	.loc 1 660 0
	cmpl	$-1, -2104(%rbp)
	jne	.L107
	.loc 1 662 0
	movl	$.LC31, %edi
	call	perror
	.loc 1 663 0
	movl	$-1, %eax
	jmp	.L116
.L107:
	.loc 1 666 0
	leaq	-2080(%rbp), %rcx
	movl	-2116(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2108(%rbp)
	.loc 1 667 0
	cmpl	$0, -2108(%rbp)
	jns	.L108
	.loc 1 669 0
	movl	$.LC12, %edi
	call	perror
	.loc 1 670 0
	movl	$-1, %eax
	jmp	.L116
.L108:
	.loc 1 671 0
	cmpl	$0, -2108(%rbp)
	jne	.L109
	.loc 1 673 0
	movl	$.LC32, %edi
	call	puts
	.loc 1 674 0
	movl	$-1, %eax
	jmp	.L116
.L109:
	.loc 1 677 0
	movl	-2080(%rbp), %eax
	cmpl	$34, %eax
	jne	.L110
	.loc 1 679 0
	movl	-2076(%rbp), %eax
	movl	%eax, -2100(%rbp)
.L115:
	.loc 1 684 0
	leaq	-1040(%rbp), %rcx
	movl	-2116(%rbp), %eax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2096(%rbp)
	.loc 1 690 0
	cmpl	$0, -2096(%rbp)
	jle	.L115
	.loc 1 692 0
	movl	-2096(%rbp), %eax
	addl	%eax, -2112(%rbp)
	.loc 1 694 0
	cmpl	$1023, -2100(%rbp)
	jg	.L112
	.loc 1 697 0
	movl	-2096(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-1040(%rbp), %rcx
	movl	-2104(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2092(%rbp)
	.loc 1 698 0
	jmp	.L110
.L112:
	.loc 1 700 0
	movl	-2096(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-1040(%rbp), %rcx
	movl	-2104(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2092(%rbp)
	.loc 1 701 0
	cmpl	$-1, -2092(%rbp)
	jne	.L113
	.loc 1 703 0
	movl	$.LC11, %edi
	call	perror
	.loc 1 704 0
	movl	$-1, %eax
	jmp	.L116
.L113:
	.loc 1 705 0
	cmpl	$0, -2092(%rbp)
	je	.L118
	.loc 1 710 0
	movl	-2112(%rbp), %eax
	cmpl	-2100(%rbp), %eax
	jge	.L119
	.loc 1 717 0
	jmp	.L115
.L118:
	.loc 1 707 0
	nop
	jmp	.L110
.L119:
	.loc 1 712 0
	nop
.L110:
	.loc 1 719 0
	movl	$.LC33, %edi
	call	puts
	.loc 1 720 0
	movl	$0, %eax
.L116:
	.loc 1 721 0 discriminator 1
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L117
	.loc 1 721 0 is_stmt 0
	call	__stack_chk_fail
.L117:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	rec_order, .-rec_order
	.section	.rodata
	.align 8
.LC34:
	.string	"\350\276\223\345\205\245\351\234\200\350\246\201\344\270\212\344\274\240\347\232\204\346\226\207\344\273\266\357\274\232"
.LC35:
	.string	"rb"
.LC36:
	.string	"file not found!"
	.align 8
.LC37:
	.string	"\350\257\245\346\226\207\344\273\266\347\232\204\351\225\277\345\272\246\344\270\272%ld\345\255\227\350\212\202\n"
.LC38:
	.string	"read error"
.LC39:
	.string	"read over"
.LC40:
	.string	"\344\270\212\344\274\240\345\256\214\346\257\225\357\274\201"
	.text
	.globl	send_order
	.type	send_order, @function
send_order:
.LFB14:
	.loc 1 725 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2144, %rsp
	movl	%edi, -2132(%rbp)
	.loc 1 725 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 726 0
	movq	$0, -2096(%rbp)
	.loc 1 734 0
	movl	$.LC34, %edi
	call	puts
	.loc 1 736 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC29, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 738 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	addq	$8, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -2096(%rbp)
	.loc 1 740 0
	movq	-2096(%rbp), %rax
	movl	$21, (%rax)
	.loc 1 742 0
	movq	-2096(%rbp), %rax
	movl	(%rax), %eax
	xorb	$-122, %al
	movl	%eax, %edx
	movq	-2096(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 747 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	-2096(%rbp), %rax
	leaq	8(%rax), %rcx
	leaq	-2064(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy
	.loc 1 749 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, %edx
	movq	-2096(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 1 751 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	leaq	8(%rax), %rdx
	movq	-2096(%rbp), %rcx
	movl	-2132(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2116(%rbp)
	.loc 1 753 0
	cmpl	$0, -2116(%rbp)
	jns	.L121
	.loc 1 756 0
	movl	$756, %esi
	movl	$.LC30, %edi
	movl	$0, %eax
	call	printf
	.loc 1 758 0
	movl	$-1, %eax
	jmp	.L134
.L121:
	.loc 1 763 0
	movq	$0, -2088(%rbp)
	.loc 1 768 0
	leaq	-2064(%rbp), %rax
	movl	$.LC35, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -2088(%rbp)
	.loc 1 770 0
	cmpq	$0, -2088(%rbp)
	jne	.L123
	.loc 1 772 0
	movl	$.LC36, %edi
	call	puts
	jmp	.L124
.L123:
	.loc 1 776 0
	movq	-2088(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek
	.loc 1 779 0
	movq	-2088(%rbp), %rax
	movq	%rax, %rdi
	call	ftell
	movq	%rax, -2104(%rbp)
	.loc 1 781 0
	movq	-2104(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC37, %edi
	movl	$0, %eax
	call	printf
	.loc 1 783 0
	movq	-2088(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L124:
	.loc 1 788 0
	leaq	-2064(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open
	movl	%eax, -2112(%rbp)
	.loc 1 790 0
	cmpl	$0, -2116(%rbp)
	jns	.L125
	.loc 1 792 0
	movl	$.LC31, %edi
	call	perror
	.loc 1 794 0
	movl	$-1, %eax
	jmp	.L134
.L125:
	.loc 1 800 0
	movl	$24, -2080(%rbp)
	.loc 1 802 0
	movq	-2104(%rbp), %rax
	movl	%eax, -2076(%rbp)
	.loc 1 804 0
	leaq	-2080(%rbp), %rcx
	movl	-2132(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2116(%rbp)
	.loc 1 806 0
	cmpl	$0, -2116(%rbp)
	jg	.L127
	.loc 1 808 0
	movl	$.LC11, %edi
	call	perror
	.loc 1 809 0
	movl	$-1, %eax
	jmp	.L134
.L133:
	.loc 1 815 0
	leaq	-1040(%rbp), %rcx
	movl	-2112(%rbp), %eax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2116(%rbp)
	.loc 1 819 0
	cmpl	$0, -2116(%rbp)
	jns	.L128
	.loc 1 822 0
	movl	$.LC38, %edi
	call	puts
	.loc 1 823 0
	movl	$-1, %eax
	jmp	.L134
.L128:
	.loc 1 826 0
	cmpl	$0, -2116(%rbp)
	jne	.L129
	.loc 1 829 0
	movl	$.LC39, %edi
	call	puts
	.loc 1 830 0
	jmp	.L130
.L129:
	.loc 1 833 0
	cmpl	$1024, -2116(%rbp)
	jne	.L131
	.loc 1 836 0
	movl	-2116(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-1040(%rbp), %rcx
	movl	-2132(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2108(%rbp)
	jmp	.L132
.L131:
	.loc 1 840 0
	movl	-2116(%rbp), %eax
	cltq
	cmpq	-2104(%rbp), %rax
	jne	.L132
	.loc 1 843 0
	movl	-2116(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-1040(%rbp), %rcx
	movl	-2132(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2108(%rbp)
.L132:
	.loc 1 848 0
	movl	-2116(%rbp), %eax
	cltq
	subq	%rax, -2104(%rbp)
.L127:
	.loc 1 812 0
	cmpq	$0, -2104(%rbp)
	jg	.L133
.L130:
	.loc 1 852 0
	movl	$.LC40, %edi
	call	puts
	.loc 1 854 0
	movl	$0, %eax
.L134:
	.loc 1 855 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L135
	.loc 1 855 0 is_stmt 0
	call	__stack_chk_fail
.L135:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	send_order, .-send_order
	.section	.rodata
.LC41:
	.string	"\350\257\267\350\276\223\345\205\245\347\273\210\347\253\257\345\221\275\344\273\244:"
.LC42:
	.string	"%[^%\n]"
.LC43:
	.string	"\n\346\230\276\347\244\272\347\273\223\346\236\234\357\274\232"
.LC44:
	.string	"TCP Broken%d\n"
.LC45:
	.string	"read error%d\n"
.LC46:
	.string	"TCP broken"
.LC47:
	.string	"\346\211\247\350\241\214\346\210\220\345\212\237\357\274\201 "
	.text
	.globl	order
	.type	order, @function
order:
.LFB15:
	.loc 1 860 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2112, %rsp
	movl	%edi, -2100(%rbp)
	.loc 1 860 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 866 0
	movq	$0, -2088(%rbp)
	.loc 1 870 0
	movl	$.LC41, %edi
	call	puts
	.loc 1 872 0
	nop
.L137:
	.loc 1 872 0 is_stmt 0 discriminator 1
	call	getchar
	cmpl	$10, %eax
	jne	.L137
	.loc 1 874 0 is_stmt 1
	leaq	-1040(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC42, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 884 0
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	addq	$8, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -2088(%rbp)
	.loc 1 886 0
	movq	-2088(%rbp), %rax
	movl	$10, (%rax)
	.loc 1 888 0
	movq	-2088(%rbp), %rax
	movl	(%rax), %eax
	xorb	$-122, %al
	movl	%eax, %edx
	movq	-2088(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 894 0
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	-2088(%rbp), %rax
	leaq	8(%rax), %rcx
	leaq	-1040(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy
	.loc 1 896 0
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, %edx
	movq	-2088(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 1 898 0
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	leaq	8(%rax), %rdx
	movq	-2088(%rbp), %rcx
	movl	-2100(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2096(%rbp)
	.loc 1 901 0
	cmpl	$0, -2096(%rbp)
	jns	.L138
	.loc 1 903 0
	movl	$.LC31, %edi
	call	perror
	.loc 1 904 0
	movl	$-1, %eax
	jmp	.L149
.L138:
	.loc 1 907 0
	movl	$.LC43, %edi
	call	puts
.L148:
	.loc 1 912 0
	leaq	-2080(%rbp), %rcx
	movl	-2100(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2092(%rbp)
	.loc 1 914 0
	cmpl	$0, -2092(%rbp)
	jne	.L140
	.loc 1 916 0
	movl	$916, %esi
	movl	$.LC44, %edi
	movl	$0, %eax
	call	printf
	.loc 1 917 0
	movl	$-1, %eax
	jmp	.L149
.L140:
	.loc 1 918 0
	cmpl	$0, -2092(%rbp)
	jns	.L141
	.loc 1 920 0
	movl	$920, %esi
	movl	$.LC45, %edi
	movl	$0, %eax
	call	printf
	.loc 1 921 0
	movl	$-1, %eax
	jmp	.L149
.L141:
	.loc 1 923 0
	movl	-2080(%rbp), %eax
	cmpl	$20, %eax
	jne	.L142
	.loc 1 925 0
	movl	-2076(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-2064(%rbp), %rcx
	movl	-2100(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2092(%rbp)
	.loc 1 927 0
	cmpl	$0, -2092(%rbp)
	jns	.L143
	.loc 1 930 0
	movl	$.LC38, %edi
	call	puts
	.loc 1 931 0
	movl	$-1, %eax
	jmp	.L149
.L143:
	.loc 1 933 0
	cmpl	$0, -2092(%rbp)
	jne	.L144
	.loc 1 936 0
	movl	$.LC46, %edi
	call	puts
	.loc 1 937 0
	movl	$-1, %eax
	jmp	.L149
.L144:
	.loc 1 939 0
	cmpl	$0, -2092(%rbp)
	jle	.L148
	.loc 1 943 0
	movl	-2092(%rbp), %eax
	cltq
	movb	$0, -2064(%rbp,%rax)
	.loc 1 945 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rdi
	call	puts
	jmp	.L148
.L142:
	.loc 1 949 0
	movl	-2080(%rbp), %eax
	cmpl	$30, %eax
	jne	.L148
	.loc 1 952 0
	movl	$.LC47, %edi
	call	puts
	.loc 1 954 0
	nop
	.loc 1 958 0
	movl	$0, %eax
.L149:
	.loc 1 959 0 discriminator 2
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L150
	.loc 1 959 0 is_stmt 0
	call	__stack_chk_fail
.L150:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	order, .-order
	.section	.rodata
.LC48:
	.string	"r"
.LC49:
	.string	"./server.conf"
.LC50:
	.string	"fopen failed."
.LC51:
	.string	"port"
.LC52:
	.string	"ip"
.LC53:
	.string	"socket"
.LC54:
	.string	"connect "
.LC55:
	.string	"connect"
	.text
	.globl	socket_init
	.type	socket_init, @function
socket_init:
.LFB16:
	.loc 1 963 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$328, %rsp
	.cfi_offset 3, -24
	.loc 1 963 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 968 0
	movl	$16, -324(%rbp)
	.loc 1 976 0
	movq	$0, -312(%rbp)
	.loc 1 980 0
	movl	$.LC48, %esi
	movl	$.LC49, %edi
	call	fopen
	movq	%rax, -312(%rbp)
	.loc 1 982 0
	cmpq	$0, -312(%rbp)
	jne	.L154
	.loc 1 984 0
	movl	$.LC50, %edi
	call	puts
	.loc 1 985 0
	movl	$-1, %eax
	jmp	.L167
.L164:
	.loc 1 993 0
	leaq	-160(%rbp), %rax
	movl	$4, %edx
	movl	$.LC51, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L155
	.loc 1 996 0
	movl	$0, -332(%rbp)
	jmp	.L156
.L159:
	.loc 1 999 0
	movl	-332(%rbp), %eax
	cltq
	movzbl	-160(%rbp,%rax), %eax
	cmpb	$47, %al
	jle	.L157
	.loc 1 999 0 is_stmt 0 discriminator 1
	movl	-332(%rbp), %eax
	cltq
	movzbl	-160(%rbp,%rax), %eax
	cmpb	$57, %al
	jle	.L169
.L157:
	.loc 1 996 0 is_stmt 1 discriminator 2
	addl	$1, -332(%rbp)
.L156:
	.loc 1 996 0 is_stmt 0 discriminator 1
	movl	-332(%rbp), %eax
	movslq	%eax, %rbx
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	%rax, %rbx
	jb	.L159
	jmp	.L158
.L169:
	.loc 1 1000 0 is_stmt 1
	nop
.L158:
	.loc 1 1003 0
	leaq	-160(%rbp), %rdx
	movl	-332(%rbp), %eax
	cltq
	addq	%rax, %rdx
	leaq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	.loc 1 1005 0
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	subq	$1, %rax
	movb	$0, -160(%rbp,%rax)
	.loc 1 1007 0
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -336(%rbp)
	jmp	.L154
.L155:
	.loc 1 1009 0
	leaq	-160(%rbp), %rax
	movl	$2, %edx
	movl	$.LC52, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L154
.LBB4:
	.loc 1 1012 0
	movl	$0, -328(%rbp)
	jmp	.L160
.L163:
	.loc 1 1014 0
	movl	-328(%rbp), %eax
	cltq
	movzbl	-160(%rbp,%rax), %eax
	cmpb	$47, %al
	jle	.L161
	.loc 1 1014 0 is_stmt 0 discriminator 1
	movl	-328(%rbp), %eax
	cltq
	movzbl	-160(%rbp,%rax), %eax
	cmpb	$57, %al
	jle	.L170
.L161:
	.loc 1 1012 0 is_stmt 1 discriminator 2
	addl	$1, -328(%rbp)
.L160:
	.loc 1 1012 0 is_stmt 0 discriminator 1
	movl	-328(%rbp), %eax
	movslq	%eax, %rbx
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	%rax, %rbx
	jb	.L163
	jmp	.L162
.L170:
	.loc 1 1016 0 is_stmt 1
	nop
.L162:
.LBE4:
	.loc 1 1019 0
	leaq	-160(%rbp), %rdx
	movl	-332(%rbp), %eax
	cltq
	addq	%rax, %rdx
	leaq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	.loc 1 1021 0
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	subq	$1, %rax
	movb	$0, -160(%rbp,%rax)
	.loc 1 1023 0
	leaq	-160(%rbp), %rdx
	leaq	-288(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
.L154:
	.loc 1 990 0
	movq	-312(%rbp), %rdx
	leaq	-160(%rbp), %rax
	movl	$128, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	jne	.L164
	.loc 1 1029 0
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket
	movl	%eax, -320(%rbp)
	cmpl	$0, -320(%rbp)
	jns	.L165
	.loc 1 1031 0
	movl	$.LC53, %edi
	call	perror
	.loc 1 1032 0
	movl	$-1, %eax
	jmp	.L167
.L165:
	.loc 1 1035 0
	movw	$2, -304(%rbp)
	.loc 1 1037 0
	movl	-336(%rbp), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	htons
	movw	%ax, -302(%rbp)
	.loc 1 1039 0
	leaq	-304(%rbp), %rax
	leaq	4(%rax), %rdx
	leaq	-288(%rbp), %rax
	movq	%rax, %rsi
	movl	$2, %edi
	call	inet_pton
	.loc 1 1041 0
	leaq	-304(%rbp), %rcx
	movl	-320(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	connect
	movl	%eax, -316(%rbp)
	.loc 1 1043 0
	movl	$.LC54, %edi
	call	puts
	.loc 1 1045 0
	cmpl	$0, -316(%rbp)
	jns	.L166
	.loc 1 1047 0
	movl	$.LC55, %edi
	call	perror
	.loc 1 1048 0
	movl	$-1, %eax
	jmp	.L167
.L166:
	.loc 1 1051 0
	movl	-320(%rbp), %eax
.L167:
	.loc 1 1052 0 discriminator 1
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L168
	.loc 1 1052 0 is_stmt 0
	call	__stack_chk_fail
.L168:
	addq	$328, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	socket_init, .-socket_init
	.section	.rodata
.LC56:
	.string	"\345\217\221\351\200\201\345\277\203\350\267\263\345\214\205 ret = %d \n"
	.text
	.globl	send_heart
	.type	send_heart, @function
send_heart:
.LFB17:
	.loc 1 1055 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	.loc 1 1055 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1059 0
	movq	-104(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -96(%rbp)
	.loc 1 1060 0
	movq	$0, -88(%rbp)
.L172:
.LBB5:
	.loc 1 1067 0 discriminator 1
	movl	$76, %edi
	call	malloc
	movq	%rax, -88(%rbp)
	.loc 1 1068 0 discriminator 1
	movq	-88(%rbp), %rax
	movl	$68, 4(%rax)
	.loc 1 1069 0 discriminator 1
	movq	-88(%rbp), %rax
	movl	$91, (%rax)
	.loc 1 1070 0 discriminator 1
	movq	-88(%rbp), %rax
	movl	(%rax), %eax
	xorb	$-122, %al
	movl	%eax, %edx
	movq	-88(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1071 0 discriminator 1
	movq	-88(%rbp), %rax
	addq	$8, %rax
	movq	-80(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-72(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-64(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-56(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-48(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-40(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-32(%rbp), %rdx
	movq	%rdx, 48(%rax)
	movq	-24(%rbp), %rdx
	movq	%rdx, 56(%rax)
	movl	-16(%rbp), %edx
	movl	%edx, 64(%rax)
	.loc 1 1072 0 discriminator 1
	movq	-88(%rbp), %rcx
	movl	-96(%rbp), %eax
	movl	$76, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -92(%rbp)
	.loc 1 1073 0 discriminator 1
	movl	-92(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC56, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1074 0 discriminator 1
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 1075 0 discriminator 1
	movq	$0, -88(%rbp)
	.loc 1 1076 0 discriminator 1
	movl	$3, %edi
	call	sleep
.LBE5:
	.loc 1 1078 0 discriminator 1
	jmp	.L172
	.cfi_endproc
.LFE17:
	.size	send_heart, .-send_heart
	.globl	main
	.type	main, @function
main:
.LFB18:
	.loc 1 1086 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 1086 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1092 0
	movl	$0, %eax
	call	socket_init
	movl	%eax, -20(%rbp)
	.loc 1 1094 0
	leaq	-20(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$send_heart, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create
	.loc 1 1095 0
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	pthread_detach
	.loc 1 1097 0
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	menu
	movl	$0, %eax
	.loc 1 1098 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L176
	call	__stack_chk_fail
.L176:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	main, .-main
	.globl	mygetch
	.type	mygetch, @function
mygetch:
.LFB19:
	.loc 1 1103 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	.loc 1 1103 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1109 0
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	tcgetattr
	.loc 1 1111 0
	movq	-144(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, -32(%rbp)
	movl	-88(%rbp), %eax
	movl	%eax, -24(%rbp)
	.loc 1 1113 0
	movl	-68(%rbp), %eax
	andl	$-11, %eax
	movl	%eax, -68(%rbp)
	.loc 1 1115 0
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	tcsetattr
	.loc 1 1117 0
	call	getchar
	movl	%eax, -148(%rbp)
	.loc 1 1119 0
	leaq	-144(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	tcsetattr
	.loc 1 1121 0
	movl	-148(%rbp), %eax
	.loc 1 1122 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L179
	call	__stack_chk_fail
.L179:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	mygetch, .-mygetch
	.section	.rodata
.LC57:
	.string	"\b \b"
	.text
	.globl	getpasswd
	.type	getpasswd, @function
getpasswd:
.LFB20:
	.loc 1 1125 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	.loc 1 1126 0
	movl	$0, -8(%rbp)
.L184:
	.loc 1 1129 0
	movl	$0, %eax
	call	mygetch
	movl	%eax, -4(%rbp)
	.loc 1 1131 0
	cmpl	$10, -4(%rbp)
	je	.L181
	.loc 1 1131 0 is_stmt 0 discriminator 1
	cmpl	$114, -4(%rbp)
	je	.L181
	.loc 1 1131 0 discriminator 2
	cmpl	$127, -4(%rbp)
	je	.L181
	.loc 1 1133 0 is_stmt 1
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movb	%dl, (%rax)
	.loc 1 1135 0
	movl	$42, %edi
	call	putchar
	.loc 1 1137 0
	addl	$1, -8(%rbp)
	jmp	.L182
.L181:
	.loc 1 1139 0
	cmpl	$10, -4(%rbp)
	setne	%dl
	cmpl	$13, -4(%rbp)
	setne	%al
	orl	%edx, %eax
	testb	%al, %al
	je	.L182
	.loc 1 1139 0 is_stmt 0 discriminator 1
	cmpl	$127, -4(%rbp)
	jne	.L182
	.loc 1 1141 0 is_stmt 1
	cmpl	$0, -8(%rbp)
	jle	.L182
	.loc 1 1143 0
	subl	$1, -8(%rbp)
	.loc 1 1144 0
	movl	$.LC57, %edi
	movl	$0, %eax
	call	printf
.L182:
	.loc 1 1147 0
	cmpl	$10, -4(%rbp)
	je	.L183
	.loc 1 1147 0 is_stmt 0 discriminator 1
	cmpl	$13, -4(%rbp)
	je	.L183
	.loc 1 1147 0 discriminator 2
	movl	-28(%rbp), %eax
	subl	$1, %eax
	cmpl	-8(%rbp), %eax
	jg	.L184
.L183:
	.loc 1 1149 0 is_stmt 1
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	.loc 1 1151 0
	movl	-8(%rbp), %eax
	.loc 1 1152 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	getpasswd, .-getpasswd
	.section	.rodata
.LC58:
	.string	"\350\257\267\350\276\223\345\205\245\345\247\223\345\220\215\357\274\232"
.LC59:
	.string	"\n\346\263\250\345\206\214\346\210\220\345\212\237!"
.LC60:
	.string	"\n\346\263\250\345\206\214\345\244\261\350\264\245!"
	.text
	.globl	write_msg
	.type	write_msg, @function
write_msg:
.LFB21:
	.loc 1 1156 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movl	%edi, -164(%rbp)
	.loc 1 1156 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1162 0
	movq	$0, -136(%rbp)
	.loc 1 1168 0
	movb	$121, -145(%rbp)
	.loc 1 1170 0
	cmpb	$121, -145(%rbp)
	jne	.L187
	.loc 1 1172 0
	movl	$76, %edi
	call	malloc
	movq	%rax, -136(%rbp)
	.loc 1 1173 0
	movq	-136(%rbp), %rax
	movl	$68, 4(%rax)
	.loc 1 1174 0
	movq	-136(%rbp), %rax
	movl	$11, (%rax)
	.loc 1 1175 0
	movq	-136(%rbp), %rax
	movl	(%rax), %eax
	xorb	$-122, %al
	movl	%eax, %edx
	movq	-136(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 1179 0
	movl	$.LC24, %edi
	call	puts
	.loc 1 1181 0
	leaq	-128(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 1183 0
	nop
.L188:
	.loc 1 1183 0 is_stmt 0 discriminator 1
	call	getchar
	cmpl	$10, %eax
	jne	.L188
	.loc 1 1185 0 is_stmt 1
	movl	$.LC58, %edi
	call	puts
	.loc 1 1187 0
	leaq	-128(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC29, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	.loc 1 1189 0
	nop
.L189:
	.loc 1 1189 0 is_stmt 0 discriminator 1
	call	getchar
	cmpl	$10, %eax
	jne	.L189
	.loc 1 1191 0 is_stmt 1
	movl	$.LC25, %edi
	call	puts
	.loc 1 1193 0
	leaq	-48(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	getpasswd
	.loc 1 1195 0
	leaq	-48(%rbp), %rax
	leaq	-128(%rbp), %rdx
	addq	$36, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy
	.loc 1 1199 0
	movq	-136(%rbp), %rax
	addq	$8, %rax
	movq	-128(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-120(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-112(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-104(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-96(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-88(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-80(%rbp), %rdx
	movq	%rdx, 48(%rax)
	movq	-72(%rbp), %rdx
	movq	%rdx, 56(%rax)
	movl	-64(%rbp), %edx
	movl	%edx, 64(%rax)
	.loc 1 1201 0
	movq	-136(%rbp), %rcx
	movl	-164(%rbp), %eax
	movl	$76, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -140(%rbp)
	.loc 1 1203 0
	cmpl	$0, -140(%rbp)
	jns	.L190
	.loc 1 1205 0
	movl	$.LC11, %edi
	call	perror
	.loc 1 1206 0
	jmp	.L187
.L190:
	.loc 1 1209 0
	leaq	-144(%rbp), %rcx
	movl	-164(%rbp), %eax
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -140(%rbp)
	.loc 1 1211 0
	cmpl	$0, -140(%rbp)
	jns	.L191
	.loc 1 1213 0
	movl	$.LC12, %edi
	call	perror
	.loc 1 1214 0
	jmp	.L187
.L191:
	.loc 1 1219 0
	movl	-144(%rbp), %eax
	cmpl	$12, %eax
	jne	.L192
	.loc 1 1221 0
	movl	$.LC59, %edi
	call	puts
	.loc 1 1222 0
	jmp	.L187
.L192:
	.loc 1 1226 0
	movl	$.LC60, %edi
	call	puts
	.loc 1 1227 0
	nop
.L187:
	.loc 1 1231 0
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 1232 0
	movq	$0, -136(%rbp)
	.loc 1 1233 0
	movl	$0, %eax
	.loc 1 1234 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L194
	call	__stack_chk_fail
.L194:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	write_msg, .-write_msg
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 9 "/usr/include/stdint.h"
	.file 10 "/usr/include/netinet/in.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/termios.h"
	.file 12 "client/client.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xf6c
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF137
	.byte	0xc
	.long	.LASF138
	.long	.LASF139
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF9
	.byte	0x2
	.byte	0xd8
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x83
	.long	0x77
	.uleb128 0x2
	.long	.LASF11
	.byte	0x3
	.byte	0x84
	.long	0x77
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x54
	.uleb128 0x2
	.long	.LASF12
	.byte	0x4
	.byte	0x30
	.long	0xa7
	.uleb128 0x7
	.long	.LASF42
	.byte	0xd8
	.byte	0x5
	.byte	0xf1
	.long	0x224
	.uleb128 0x8
	.long	.LASF13
	.byte	0x5
	.byte	0xf2
	.long	0x4d
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x5
	.byte	0xf7
	.long	0x96
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x5
	.byte	0xf8
	.long	0x96
	.byte	0x10
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.byte	0xf9
	.long	0x96
	.byte	0x18
	.uleb128 0x8
	.long	.LASF17
	.byte	0x5
	.byte	0xfa
	.long	0x96
	.byte	0x20
	.uleb128 0x8
	.long	.LASF18
	.byte	0x5
	.byte	0xfb
	.long	0x96
	.byte	0x28
	.uleb128 0x8
	.long	.LASF19
	.byte	0x5
	.byte	0xfc
	.long	0x96
	.byte	0x30
	.uleb128 0x8
	.long	.LASF20
	.byte	0x5
	.byte	0xfd
	.long	0x96
	.byte	0x38
	.uleb128 0x8
	.long	.LASF21
	.byte	0x5
	.byte	0xfe
	.long	0x96
	.byte	0x40
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.value	0x100
	.long	0x96
	.byte	0x48
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.value	0x101
	.long	0x96
	.byte	0x50
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.value	0x102
	.long	0x96
	.byte	0x58
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.value	0x104
	.long	0x25c
	.byte	0x60
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.value	0x106
	.long	0x262
	.byte	0x68
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.value	0x108
	.long	0x4d
	.byte	0x70
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x10c
	.long	0x4d
	.byte	0x74
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.value	0x10e
	.long	0x7e
	.byte	0x78
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.value	0x112
	.long	0x46
	.byte	0x80
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.value	0x113
	.long	0x69
	.byte	0x82
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.value	0x114
	.long	0x268
	.byte	0x83
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.value	0x118
	.long	0x278
	.byte	0x88
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.value	0x121
	.long	0x89
	.byte	0x90
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.value	0x129
	.long	0x94
	.byte	0x98
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.value	0x12a
	.long	0x94
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.value	0x12b
	.long	0x94
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.value	0x12c
	.long	0x94
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.value	0x12e
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.value	0x12f
	.long	0x4d
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x5
	.value	0x131
	.long	0x27e
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF140
	.byte	0x5
	.byte	0x96
	.uleb128 0x7
	.long	.LASF43
	.byte	0x18
	.byte	0x5
	.byte	0x9c
	.long	0x25c
	.uleb128 0x8
	.long	.LASF44
	.byte	0x5
	.byte	0x9d
	.long	0x25c
	.byte	0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x5
	.byte	0x9e
	.long	0x262
	.byte	0x8
	.uleb128 0x8
	.long	.LASF46
	.byte	0x5
	.byte	0xa2
	.long	0x4d
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22b
	.uleb128 0x6
	.byte	0x8
	.long	0xa7
	.uleb128 0xb
	.long	0x54
	.long	0x278
	.uleb128 0xc
	.long	0x3f
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x224
	.uleb128 0xb
	.long	0x54
	.long	0x28e
	.uleb128 0xc
	.long	0x3f
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0x2
	.long	.LASF48
	.byte	0x6
	.byte	0x3c
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF49
	.uleb128 0xb
	.long	0x54
	.long	0x2b7
	.uleb128 0xc
	.long	0x3f
	.byte	0x1f
	.byte	0
	.uleb128 0xd
	.long	.LASF141
	.byte	0x4
	.long	0x62
	.byte	0xd
	.byte	0x18
	.long	0x302
	.uleb128 0xe
	.long	.LASF50
	.byte	0x1
	.uleb128 0xe
	.long	.LASF51
	.byte	0x2
	.uleb128 0xe
	.long	.LASF52
	.byte	0x3
	.uleb128 0xe
	.long	.LASF53
	.byte	0x4
	.uleb128 0xe
	.long	.LASF54
	.byte	0x5
	.uleb128 0xe
	.long	.LASF55
	.byte	0x6
	.uleb128 0xe
	.long	.LASF56
	.byte	0xa
	.uleb128 0xf
	.long	.LASF57
	.long	0x80000
	.uleb128 0x10
	.long	.LASF58
	.value	0x800
	.byte	0
	.uleb128 0x2
	.long	.LASF59
	.byte	0x7
	.byte	0x1c
	.long	0x46
	.uleb128 0x7
	.long	.LASF60
	.byte	0x10
	.byte	0x8
	.byte	0x99
	.long	0x332
	.uleb128 0x8
	.long	.LASF61
	.byte	0x8
	.byte	0x9b
	.long	0x302
	.byte	0
	.uleb128 0x8
	.long	.LASF62
	.byte	0x8
	.byte	0x9c
	.long	0x332
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.long	0x54
	.long	0x342
	.uleb128 0xc
	.long	0x3f
	.byte	0xd
	.byte	0
	.uleb128 0x2
	.long	.LASF63
	.byte	0x9
	.byte	0x31
	.long	0x46
	.uleb128 0x2
	.long	.LASF64
	.byte	0x9
	.byte	0x33
	.long	0x62
	.uleb128 0x2
	.long	.LASF65
	.byte	0xa
	.byte	0x1e
	.long	0x34d
	.uleb128 0x7
	.long	.LASF66
	.byte	0x4
	.byte	0xa
	.byte	0x1f
	.long	0x37c
	.uleb128 0x8
	.long	.LASF67
	.byte	0xa
	.byte	0x21
	.long	0x358
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF68
	.byte	0xa
	.byte	0x77
	.long	0x342
	.uleb128 0x7
	.long	.LASF69
	.byte	0x10
	.byte	0xa
	.byte	0xef
	.long	0x3c4
	.uleb128 0x8
	.long	.LASF70
	.byte	0xa
	.byte	0xf1
	.long	0x302
	.byte	0
	.uleb128 0x8
	.long	.LASF71
	.byte	0xa
	.byte	0xf2
	.long	0x37c
	.byte	0x2
	.uleb128 0x8
	.long	.LASF72
	.byte	0xa
	.byte	0xf3
	.long	0x363
	.byte	0x4
	.uleb128 0x8
	.long	.LASF73
	.byte	0xa
	.byte	0xf6
	.long	0x3c4
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.long	0x5b
	.long	0x3d4
	.uleb128 0xc
	.long	0x3f
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.long	.LASF74
	.byte	0xb
	.byte	0x17
	.long	0x5b
	.uleb128 0x2
	.long	.LASF75
	.byte	0xb
	.byte	0x18
	.long	0x62
	.uleb128 0x2
	.long	.LASF76
	.byte	0xb
	.byte	0x19
	.long	0x62
	.uleb128 0x7
	.long	.LASF77
	.byte	0x3c
	.byte	0xb
	.byte	0x1c
	.long	0x462
	.uleb128 0x8
	.long	.LASF78
	.byte	0xb
	.byte	0x1e
	.long	0x3ea
	.byte	0
	.uleb128 0x8
	.long	.LASF79
	.byte	0xb
	.byte	0x1f
	.long	0x3ea
	.byte	0x4
	.uleb128 0x8
	.long	.LASF80
	.byte	0xb
	.byte	0x20
	.long	0x3ea
	.byte	0x8
	.uleb128 0x8
	.long	.LASF81
	.byte	0xb
	.byte	0x21
	.long	0x3ea
	.byte	0xc
	.uleb128 0x8
	.long	.LASF82
	.byte	0xb
	.byte	0x22
	.long	0x3d4
	.byte	0x10
	.uleb128 0x8
	.long	.LASF83
	.byte	0xb
	.byte	0x23
	.long	0x462
	.byte	0x11
	.uleb128 0x8
	.long	.LASF84
	.byte	0xb
	.byte	0x24
	.long	0x3df
	.byte	0x34
	.uleb128 0x8
	.long	.LASF85
	.byte	0xb
	.byte	0x25
	.long	0x3df
	.byte	0x38
	.byte	0
	.uleb128 0xb
	.long	0x3d4
	.long	0x472
	.uleb128 0xc
	.long	0x3f
	.byte	0x1f
	.byte	0
	.uleb128 0x7
	.long	.LASF86
	.byte	0x78
	.byte	0xc
	.byte	0x64
	.long	0x4c6
	.uleb128 0x11
	.string	"num"
	.byte	0xc
	.byte	0x66
	.long	0x4d
	.byte	0
	.uleb128 0x8
	.long	.LASF87
	.byte	0xc
	.byte	0x67
	.long	0x2a7
	.byte	0x4
	.uleb128 0x11
	.string	"cfd"
	.byte	0xc
	.byte	0x68
	.long	0x4d
	.byte	0x24
	.uleb128 0x8
	.long	.LASF88
	.byte	0xc
	.byte	0x69
	.long	0x4d
	.byte	0x28
	.uleb128 0x11
	.string	"ip"
	.byte	0xc
	.byte	0x6a
	.long	0x4c6
	.byte	0x2c
	.uleb128 0x8
	.long	.LASF89
	.byte	0xc
	.byte	0x6b
	.long	0x4d6
	.byte	0x70
	.byte	0
	.uleb128 0xb
	.long	0x54
	.long	0x4d6
	.uleb128 0xc
	.long	0x3f
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x472
	.uleb128 0x7
	.long	.LASF90
	.byte	0x8
	.byte	0xc
	.byte	0x6f
	.long	0x50d
	.uleb128 0x8
	.long	.LASF91
	.byte	0xc
	.byte	0x71
	.long	0x4d
	.byte	0
	.uleb128 0x8
	.long	.LASF92
	.byte	0xc
	.byte	0x72
	.long	0x4d
	.byte	0x4
	.uleb128 0x8
	.long	.LASF93
	.byte	0xc
	.byte	0x73
	.long	0x50d
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.long	0x54
	.long	0x51c
	.uleb128 0x12
	.long	0x3f
	.byte	0
	.uleb128 0x13
	.string	"msg"
	.byte	0x44
	.byte	0xc
	.byte	0x76
	.long	0x54d
	.uleb128 0x8
	.long	.LASF94
	.byte	0xc
	.byte	0x78
	.long	0x2a7
	.byte	0
	.uleb128 0x11
	.string	"num"
	.byte	0xc
	.byte	0x79
	.long	0x4d
	.byte	0x20
	.uleb128 0x8
	.long	.LASF87
	.byte	0xc
	.byte	0x7a
	.long	0x2a7
	.byte	0x24
	.byte	0
	.uleb128 0x14
	.long	.LASF95
	.value	0x404
	.byte	0xc
	.byte	0x7d
	.long	0x573
	.uleb128 0x8
	.long	.LASF92
	.byte	0xc
	.byte	0x7f
	.long	0x4d
	.byte	0
	.uleb128 0x8
	.long	.LASF96
	.byte	0xc
	.byte	0x80
	.long	0x573
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.long	0x54
	.long	0x584
	.uleb128 0x15
	.long	0x3f
	.value	0x3ff
	.byte	0
	.uleb128 0x7
	.long	.LASF97
	.byte	0x8
	.byte	0xc
	.byte	0x83
	.long	0x5a9
	.uleb128 0x11
	.string	"row"
	.byte	0xc
	.byte	0x85
	.long	0x4d
	.byte	0
	.uleb128 0x8
	.long	.LASF98
	.byte	0xc
	.byte	0x86
	.long	0x4d
	.byte	0x4
	.byte	0
	.uleb128 0x16
	.long	.LASF99
	.byte	0x1
	.byte	0x5
	.long	0x4d
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x5e5
	.uleb128 0x17
	.long	.LASF101
	.byte	0x1
	.byte	0x5
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.string	"i"
	.byte	0x1
	.byte	0x7
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x16
	.long	.LASF100
	.byte	0x1
	.byte	0x25
	.long	0x4d
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x621
	.uleb128 0x17
	.long	.LASF101
	.byte	0x1
	.byte	0x25
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.string	"i"
	.byte	0x1
	.byte	0x27
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x16
	.long	.LASF102
	.byte	0x1
	.byte	0x4a
	.long	0x4d
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x66f
	.uleb128 0x17
	.long	.LASF101
	.byte	0x1
	.byte	0x4a
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x19
	.long	.LASF103
	.byte	0x1
	.byte	0x4c
	.long	0x2a7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x19
	.long	.LASF87
	.byte	0x1
	.byte	0x4e
	.long	0x2a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x16
	.long	.LASF104
	.byte	0x1
	.byte	0x67
	.long	0x4d
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x72e
	.uleb128 0x17
	.long	.LASF101
	.byte	0x1
	.byte	0x67
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1156
	.uleb128 0x18
	.string	"ret"
	.byte	0x1
	.byte	0x69
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1140
	.uleb128 0x1a
	.long	.LASF96
	.byte	0x1
	.byte	0x6b
	.long	0x4d
	.uleb128 0x19
	.long	.LASF94
	.byte	0x1
	.byte	0x6d
	.long	0x2a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.string	"pa"
	.byte	0x1
	.byte	0x6f
	.long	0x72e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1128
	.uleb128 0x18
	.string	"a"
	.byte	0x1
	.byte	0x71
	.long	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1145
	.uleb128 0x18
	.string	"pag"
	.byte	0x1
	.byte	0x73
	.long	0x4dc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1120
	.uleb128 0x1b
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x18
	.string	"my"
	.byte	0x1
	.byte	0x91
	.long	0x584
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1136
	.uleb128 0x18
	.string	"i"
	.byte	0x1
	.byte	0x93
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1144
	.uleb128 0x19
	.long	.LASF105
	.byte	0x1
	.byte	0x95
	.long	0x54d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1104
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4dc
	.uleb128 0x16
	.long	.LASF106
	.byte	0x1
	.byte	0xd4
	.long	0x4d
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x7f5
	.uleb128 0x17
	.long	.LASF101
	.byte	0x1
	.byte	0xd4
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1156
	.uleb128 0x18
	.string	"ret"
	.byte	0x1
	.byte	0xd6
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1140
	.uleb128 0x1a
	.long	.LASF96
	.byte	0x1
	.byte	0xd8
	.long	0x4d
	.uleb128 0x19
	.long	.LASF94
	.byte	0x1
	.byte	0xda
	.long	0x2a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.string	"pa"
	.byte	0x1
	.byte	0xdc
	.long	0x72e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1128
	.uleb128 0x18
	.string	"a"
	.byte	0x1
	.byte	0xde
	.long	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1145
	.uleb128 0x18
	.string	"pag"
	.byte	0x1
	.byte	0xe0
	.long	0x4dc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1120
	.uleb128 0x1b
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x18
	.string	"my"
	.byte	0x1
	.byte	0xfe
	.long	0x584
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1136
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x100
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1144
	.uleb128 0x1d
	.long	.LASF105
	.byte	0x1
	.value	0x102
	.long	0x54d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1104
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF107
	.byte	0x1
	.value	0x134
	.long	0x4d
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x860
	.uleb128 0x1f
	.long	.LASF101
	.byte	0x1
	.value	0x134
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.value	0x136
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1d
	.long	.LASF96
	.byte	0x1
	.value	0x138
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.string	"pa"
	.byte	0x1
	.value	0x13a
	.long	0x72e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.string	"a"
	.byte	0x1
	.value	0x13c
	.long	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -41
	.byte	0
	.uleb128 0x1e
	.long	.LASF108
	.byte	0x1
	.value	0x176
	.long	0x4d
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x8d8
	.uleb128 0x1f
	.long	.LASF101
	.byte	0x1
	.value	0x176
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.string	"pa"
	.byte	0x1
	.value	0x176
	.long	0x4dc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1c
	.string	"q"
	.byte	0x1
	.value	0x179
	.long	0x4d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.string	"p"
	.byte	0x1
	.value	0x179
	.long	0x4d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.long	.LASF109
	.byte	0x1
	.value	0x179
	.long	0x4d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.value	0x17b
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x1e
	.long	.LASF110
	.byte	0x1
	.value	0x1a5
	.long	0x4d
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x933
	.uleb128 0x1f
	.long	.LASF101
	.byte	0x1
	.value	0x1a5
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.value	0x1a7
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x21
	.long	.LASF96
	.byte	0x1
	.value	0x1a9
	.long	0x4d
	.uleb128 0x1c
	.string	"pa"
	.byte	0x1
	.value	0x1ab
	.long	0x72e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x22
	.long	.LASF122
	.byte	0x1
	.value	0x1c3
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x97e
	.uleb128 0x20
	.string	"cfd"
	.byte	0x1
	.value	0x1c3
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.value	0x1c5
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.string	"pa"
	.byte	0x1
	.value	0x1c7
	.long	0x4dc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1e
	.long	.LASF111
	.byte	0x1
	.value	0x1e8
	.long	0x4d
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x9bd
	.uleb128 0x1f
	.long	.LASF101
	.byte	0x1
	.value	0x1e8
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x1ea
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1e
	.long	.LASF112
	.byte	0x1
	.value	0x21c
	.long	0x4d
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0xa4c
	.uleb128 0x1f
	.long	.LASF101
	.byte	0x1
	.value	0x21c
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.value	0x21e
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x1d
	.long	.LASF96
	.byte	0x1
	.value	0x220
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1c
	.string	"pa"
	.byte	0x1
	.value	0x222
	.long	0x72e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1c
	.string	"ma"
	.byte	0x1
	.value	0x224
	.long	0x51c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x1d
	.long	.LASF103
	.byte	0x1
	.value	0x226
	.long	0x2a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1c
	.string	"ch"
	.byte	0x1
	.value	0x228
	.long	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -161
	.byte	0
	.uleb128 0x1e
	.long	.LASF113
	.byte	0x1
	.value	0x266
	.long	0x4d
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0xb28
	.uleb128 0x1f
	.long	.LASF101
	.byte	0x1
	.value	0x266
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2132
	.uleb128 0x1c
	.string	"p"
	.byte	0x1
	.value	0x268
	.long	0x72e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2104
	.uleb128 0x1c
	.string	"pa"
	.byte	0x1
	.value	0x26a
	.long	0x4dc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2096
	.uleb128 0x1d
	.long	.LASF96
	.byte	0x1
	.value	0x26c
	.long	0x573
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2080
	.uleb128 0x1d
	.long	.LASF114
	.byte	0x1
	.value	0x26e
	.long	0x573
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0x1d
	.long	.LASF115
	.byte	0x1
	.value	0x270
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2116
	.uleb128 0x1c
	.string	"sum"
	.byte	0x1
	.value	0x272
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2128
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.value	0x274
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2124
	.uleb128 0x21
	.long	.LASF116
	.byte	0x1
	.value	0x274
	.long	0x4d
	.uleb128 0x1d
	.long	.LASF117
	.byte	0x1
	.value	0x276
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2120
	.uleb128 0x1d
	.long	.LASF118
	.byte	0x1
	.value	0x278
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2108
	.uleb128 0x1d
	.long	.LASF119
	.byte	0x1
	.value	0x278
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2112
	.byte	0
	.uleb128 0x1e
	.long	.LASF120
	.byte	0x1
	.value	0x2d4
	.long	0x4d
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0xbe6
	.uleb128 0x1f
	.long	.LASF101
	.byte	0x1
	.value	0x2d4
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2148
	.uleb128 0x1c
	.string	"p"
	.byte	0x1
	.value	0x2d6
	.long	0x72e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2112
	.uleb128 0x1d
	.long	.LASF96
	.byte	0x1
	.value	0x2d8
	.long	0x573
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2080
	.uleb128 0x1d
	.long	.LASF114
	.byte	0x1
	.value	0x2da
	.long	0x573
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.value	0x2dc
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2132
	.uleb128 0x1d
	.long	.LASF116
	.byte	0x1
	.value	0x2dc
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2124
	.uleb128 0x1c
	.string	"fp"
	.byte	0x1
	.value	0x2fb
	.long	0xbe6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2104
	.uleb128 0x1d
	.long	.LASF115
	.byte	0x1
	.value	0x2fd
	.long	0x77
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2120
	.uleb128 0x1c
	.string	"fd"
	.byte	0x1
	.value	0x314
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2128
	.uleb128 0x1c
	.string	"pa"
	.byte	0x1
	.value	0x31e
	.long	0x4dc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2096
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0x1e
	.long	.LASF121
	.byte	0x1
	.value	0x35b
	.long	0x4d
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0xc7b
	.uleb128 0x1f
	.long	.LASF101
	.byte	0x1
	.value	0x35b
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2116
	.uleb128 0x1d
	.long	.LASF96
	.byte	0x1
	.value	0x35e
	.long	0x573
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2080
	.uleb128 0x1c
	.string	"ptr"
	.byte	0x1
	.value	0x360
	.long	0x573
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0x1c
	.string	"p"
	.byte	0x1
	.value	0x362
	.long	0x72e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2104
	.uleb128 0x1c
	.string	"pa"
	.byte	0x1
	.value	0x364
	.long	0x4dc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2096
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.value	0x37c
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2108
	.uleb128 0x1c
	.string	"fd"
	.byte	0x1
	.value	0x37c
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2112
	.byte	0
	.uleb128 0x23
	.long	.LASF123
	.byte	0x1
	.value	0x3c2
	.long	0x4d
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0xd4a
	.uleb128 0x1d
	.long	.LASF101
	.byte	0x1
	.value	0x3c4
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.value	0x3c4
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -332
	.uleb128 0x1d
	.long	.LASF124
	.byte	0x1
	.value	0x3c6
	.long	0x387
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x1d
	.long	.LASF125
	.byte	0x1
	.value	0x3c8
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -340
	.uleb128 0x1d
	.long	.LASF88
	.byte	0x1
	.value	0x3ca
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x1c
	.string	"ip"
	.byte	0x1
	.value	0x3cc
	.long	0xd4a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x1d
	.long	.LASF126
	.byte	0x1
	.value	0x3ce
	.long	0xd4a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1c
	.string	"fp"
	.byte	0x1
	.value	0x3d0
	.long	0xbe6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x3dc
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -348
	.uleb128 0x1b
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x1c
	.string	"i"
	.byte	0x1
	.value	0x3f4
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -344
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	0x54
	.long	0xd5a
	.uleb128 0xc
	.long	0x3f
	.byte	0x7f
	.byte	0
	.uleb128 0x1e
	.long	.LASF127
	.byte	0x1
	.value	0x41e
	.long	0x94
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0xddd
	.uleb128 0x1f
	.long	.LASF128
	.byte	0x1
	.value	0x41e
	.long	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x1d
	.long	.LASF129
	.byte	0x1
	.value	0x423
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1c
	.string	"pa"
	.byte	0x1
	.value	0x424
	.long	0x72e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1c
	.string	"ma"
	.byte	0x1
	.value	0x428
	.long	0x51c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1b
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.value	0x430
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.LASF130
	.byte	0x1
	.value	0x43d
	.long	0x4d
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xe1e
	.uleb128 0x1d
	.long	.LASF101
	.byte	0x1
	.value	0x440
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.string	"pid"
	.byte	0x1
	.value	0x442
	.long	0x295
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x23
	.long	.LASF131
	.byte	0x1
	.value	0x44e
	.long	0x4d
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xe70
	.uleb128 0x1d
	.long	.LASF132
	.byte	0x1
	.value	0x451
	.long	0x3f5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1d
	.long	.LASF133
	.byte	0x1
	.value	0x451
	.long	0x3f5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1c
	.string	"ch"
	.byte	0x1
	.value	0x453
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -164
	.byte	0
	.uleb128 0x1e
	.long	.LASF134
	.byte	0x1
	.value	0x464
	.long	0x4d
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xecb
	.uleb128 0x1f
	.long	.LASF87
	.byte	0x1
	.value	0x464
	.long	0x96
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.long	.LASF135
	.byte	0x1
	.value	0x464
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.string	"c"
	.byte	0x1
	.value	0x466
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.string	"n"
	.byte	0x1
	.value	0x466
	.long	0x4d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1e
	.long	.LASF136
	.byte	0x1
	.value	0x483
	.long	0x4d
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xf5a
	.uleb128 0x1f
	.long	.LASF101
	.byte	0x1
	.value	0x483
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -180
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.value	0x486
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x1d
	.long	.LASF96
	.byte	0x1
	.value	0x488
	.long	0x4d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1c
	.string	"pa"
	.byte	0x1
	.value	0x48a
	.long	0x72e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1c
	.string	"ma"
	.byte	0x1
	.value	0x48c
	.long	0x51c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x1d
	.long	.LASF103
	.byte	0x1
	.value	0x48e
	.long	0x2a7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1c
	.string	"ch"
	.byte	0x1
	.value	0x490
	.long	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -161
	.byte	0
	.uleb128 0x24
	.long	.LASF142
	.byte	0x1
	.byte	0x23
	.long	0x4d
	.uleb128 0x9
	.byte	0x3
	.quad	flag
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF10:
	.string	"__off_t"
.LASF14:
	.string	"_IO_read_ptr"
.LASF26:
	.string	"_chain"
.LASF32:
	.string	"_shortbuf"
.LASF9:
	.string	"size_t"
.LASF82:
	.string	"c_line"
.LASF91:
	.string	"type"
.LASF134:
	.string	"getpasswd"
.LASF58:
	.string	"SOCK_NONBLOCK"
.LASF49:
	.string	"long long unsigned int"
.LASF65:
	.string	"in_addr_t"
.LASF128:
	.string	"addr"
.LASF93:
	.string	"data"
.LASF121:
	.string	"order"
.LASF81:
	.string	"c_lflag"
.LASF84:
	.string	"c_ispeed"
.LASF132:
	.string	"oldt"
.LASF97:
	.string	"mysql_msg"
.LASF89:
	.string	"next"
.LASF77:
	.string	"termios"
.LASF56:
	.string	"SOCK_PACKET"
.LASF101:
	.string	"sockfd"
.LASF47:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF131:
	.string	"mygetch"
.LASF96:
	.string	"buff"
.LASF27:
	.string	"_fileno"
.LASF15:
	.string	"_IO_read_end"
.LASF8:
	.string	"long int"
.LASF13:
	.string	"_flags"
.LASF119:
	.string	"bytes_read"
.LASF79:
	.string	"c_oflag"
.LASF21:
	.string	"_IO_buf_end"
.LASF30:
	.string	"_cur_column"
.LASF50:
	.string	"SOCK_STREAM"
.LASF7:
	.string	"short int"
.LASF63:
	.string	"uint16_t"
.LASF114:
	.string	"buff1"
.LASF136:
	.string	"write_msg"
.LASF34:
	.string	"_offset"
.LASF127:
	.string	"send_heart"
.LASF122:
	.string	"rec_link"
.LASF129:
	.string	"sock"
.LASF37:
	.string	"__pad3"
.LASF137:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF73:
	.string	"sin_zero"
.LASF88:
	.string	"port"
.LASF126:
	.string	"temp"
.LASF43:
	.string	"_IO_marker"
.LASF53:
	.string	"SOCK_RDM"
.LASF111:
	.string	"menu2"
.LASF5:
	.string	"unsigned int"
.LASF116:
	.string	"ret1"
.LASF0:
	.string	"long unsigned int"
.LASF18:
	.string	"_IO_write_ptr"
.LASF113:
	.string	"rec_order"
.LASF75:
	.string	"speed_t"
.LASF94:
	.string	"name"
.LASF45:
	.string	"_sbuf"
.LASF139:
	.string	"/home/ubuntu/Mygraduation/remote"
.LASF135:
	.string	"size"
.LASF2:
	.string	"short unsigned int"
.LASF72:
	.string	"sin_addr"
.LASF76:
	.string	"tcflag_t"
.LASF125:
	.string	"addrlen"
.LASF74:
	.string	"cc_t"
.LASF22:
	.string	"_IO_save_base"
.LASF33:
	.string	"_lock"
.LASF78:
	.string	"c_iflag"
.LASF28:
	.string	"_flags2"
.LASF85:
	.string	"c_ospeed"
.LASF100:
	.string	"menu3"
.LASF95:
	.string	"buff_msg"
.LASF62:
	.string	"sa_data"
.LASF70:
	.string	"sin_family"
.LASF1:
	.string	"sizetype"
.LASF102:
	.string	"get_right"
.LASF123:
	.string	"socket_init"
.LASF120:
	.string	"send_order"
.LASF19:
	.string	"_IO_write_end"
.LASF140:
	.string	"_IO_lock_t"
.LASF42:
	.string	"_IO_FILE"
.LASF138:
	.string	"client.c"
.LASF55:
	.string	"SOCK_DCCP"
.LASF106:
	.string	"show_mysql"
.LASF40:
	.string	"_mode"
.LASF103:
	.string	"passWord"
.LASF71:
	.string	"sin_port"
.LASF61:
	.string	"sa_family"
.LASF25:
	.string	"_markers"
.LASF141:
	.string	"__socket_type"
.LASF83:
	.string	"c_cc"
.LASF4:
	.string	"unsigned char"
.LASF124:
	.string	"cliaddr"
.LASF104:
	.string	"record_mysql"
.LASF105:
	.string	"my_buff"
.LASF80:
	.string	"c_cflag"
.LASF142:
	.string	"flag"
.LASF31:
	.string	"_vtable_offset"
.LASF87:
	.string	"passwd"
.LASF12:
	.string	"FILE"
.LASF118:
	.string	"bytes_write"
.LASF117:
	.string	"fd_write"
.LASF109:
	.string	"head"
.LASF64:
	.string	"uint32_t"
.LASF115:
	.string	"length"
.LASF3:
	.string	"char"
.LASF133:
	.string	"newt"
.LASF48:
	.string	"pthread_t"
.LASF60:
	.string	"sockaddr"
.LASF92:
	.string	"lenth"
.LASF44:
	.string	"_next"
.LASF11:
	.string	"__off64_t"
.LASF16:
	.string	"_IO_read_base"
.LASF24:
	.string	"_IO_save_end"
.LASF112:
	.string	"log_in"
.LASF108:
	.string	"show_cli"
.LASF86:
	.string	"cli_info"
.LASF35:
	.string	"__pad1"
.LASF36:
	.string	"__pad2"
.LASF90:
	.string	"pack"
.LASF38:
	.string	"__pad4"
.LASF39:
	.string	"__pad5"
.LASF59:
	.string	"sa_family_t"
.LASF41:
	.string	"_unused2"
.LASF67:
	.string	"s_addr"
.LASF57:
	.string	"SOCK_CLOEXEC"
.LASF107:
	.string	"exit_msg"
.LASF51:
	.string	"SOCK_DGRAM"
.LASF69:
	.string	"sockaddr_in"
.LASF23:
	.string	"_IO_backup_base"
.LASF99:
	.string	"menu"
.LASF98:
	.string	"fields"
.LASF52:
	.string	"SOCK_RAW"
.LASF110:
	.string	"choose"
.LASF29:
	.string	"_old_offset"
.LASF54:
	.string	"SOCK_SEQPACKET"
.LASF130:
	.string	"main"
.LASF17:
	.string	"_IO_write_base"
.LASF20:
	.string	"_IO_buf_base"
.LASF68:
	.string	"in_port_t"
.LASF46:
	.string	"_pos"
.LASF66:
	.string	"in_addr"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits

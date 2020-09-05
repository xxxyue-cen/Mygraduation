	.file	"server.c"
	.text
.Ltext0:
	.comm	mysql,1304,32
	.globl	make_daemon
	.type	make_daemon, @function
make_daemon:
.LFB2:
	.file 1 "server.c"
	.loc 1 8 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 11 0
	call	fork
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	je	.L2
	.loc 1 13 0
	movl	$0, %edi
	call	exit
.L2:
	.loc 1 16 0
	call	setsid
	.loc 1 20 0
	call	fork
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	je	.L3
	.loc 1 21 0
	movl	$0, %edi
	call	exit
.L3:
	.loc 1 23 0
	movl	$1, -4(%rbp)
	.loc 1 26 0
	movl	$0, %edi
	call	umask
	.loc 1 31 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	make_daemon, .-make_daemon
	.section	.rodata
.LC0:
	.string	"show_mysql"
.LC1:
	.string	"\345\210\235\345\247\213\345\214\226\345\244\261\350\264\245\357\274\201"
.LC2:
	.string	"message"
.LC3:
	.string	"123456"
.LC4:
	.string	"root"
.LC5:
	.string	"localhost"
.LC6:
	.string	"\350\277\236\346\216\245\346\210\220\345\212\237\357\274\201"
.LC7:
	.string	"utf8"
.LC8:
	.string	"select * from record"
.LC9:
	.string	"\346\237\245\350\257\242\351\224\231\350\257\257,error info:%s"
.LC10:
	.string	"\346\262\241\346\234\211\347\273\223\346\236\234"
.LC11:
	.string	"\345\205\261\346\234\211%d\345\210\227 %d\350\241\214\n"
.LC12:
	.string	"a:%c\n"
.LC13:
	.string	"malloc error"
.LC14:
	.string	"write"
.LC15:
	.string	"name:%s\t"
.LC16:
	.string	"ret :%d\tline:%d\n"
.LC17:
	.string	"row:%d\tnum_fields:%d\n"
.LC18:
	.string	"buff:%s "
	.text
	.globl	record_mysql
	.type	record_mysql, @function
record_mysql:
.LFB3:
	.loc 1 39 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2208, %rsp
	movl	%edi, -2196(%rbp)
	movq	%rsi, -2208(%rbp)
	.loc 1 39 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 41 0
	movl	$.LC0, %edi
	call	puts
	.loc 1 45 0
	movq	$0, -2152(%rbp)
	.loc 1 49 0
	movl	$mysql, %edi
	call	mysql_init
	.loc 1 49 0
	testq	%rax, %rax
	jne	.L5
	.loc 1 51 0
	movl	$.LC1, %edi
	call	puts
	.loc 1 52 0
	movl	$0, %eax
	jmp	.L4
.L5:
	.loc 1 55 0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$.LC2, %r8d
	movl	$.LC3, %ecx
	movl	$.LC4, %edx
	movl	$.LC5, %esi
	movl	$mysql, %edi
	call	mysql_real_connect
	addq	$16, %rsp
	.loc 1 55 0
	testq	%rax, %rax
	jne	.L7
	.loc 1 57 0
	movl	$mysql, %edi
	call	mysql_error
	movq	%rax, %rdi
	call	puts
	.loc 1 58 0
	movl	$0, %eax
	jmp	.L4
.L7:
	.loc 1 61 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 63 0
	movl	$.LC7, %esi
	movl	$mysql, %edi
	call	mysql_set_character_set
	.loc 1 65 0
	movq	$.LC8, -2144(%rbp)
	.loc 1 67 0
	movq	-2144(%rbp), %rax
	movq	%rax, %rsi
	movl	$mysql, %edi
	call	mysql_query
	movl	%eax, -2176(%rbp)
	.loc 1 70 0
	cmpl	$0, -2176(%rbp)
	je	.L8
	.loc 1 72 0
	movl	$mysql, %edi
	call	mysql_error
	movq	%rax, %rsi
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	.loc 1 73 0
	movl	$-1, %eax
	jmp	.L4
.L8:
	.loc 1 76 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 80 0
	movl	$mysql, %edi
	call	mysql_store_result
	movq	%rax, -2136(%rbp)
	.loc 1 83 0
	cmpq	$0, -2136(%rbp)
	jne	.L9
	.loc 1 85 0
	movl	$.LC10, %edi
	call	puts
	.loc 1 86 0
	movl	$0, %eax
	jmp	.L4
.L9:
	.loc 1 90 0
	movq	-2136(%rbp), %rax
	movq	%rax, %rdi
	call	mysql_num_fields
	movl	%eax, -2172(%rbp)
	.loc 1 94 0
	movq	-2136(%rbp), %rax
	movq	%rax, %rdi
	call	mysql_num_rows
	movl	%eax, -2168(%rbp)
	.loc 1 96 0
	movl	-2168(%rbp), %edx
	movl	-2172(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	.loc 1 101 0
	movl	-2204(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-2181(%rbp), %rcx
	movl	-2196(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2164(%rbp)
	.loc 1 103 0
	movzbl	-2181(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC12, %edi
	movl	$0, %eax
	call	printf
	.loc 1 104 0
	movzbl	-2181(%rbp), %eax
	cmpb	$121, %al
	jne	.L10
.LBB2:
	.loc 1 105 0
	jmp	.L11
.L15:
	.loc 1 108 0
	movl	$9, %edi
	call	malloc
	movq	%rax, -2152(%rbp)
	.loc 1 110 0
	cmpq	$0, -2152(%rbp)
	jne	.L12
	.loc 1 112 0
	movl	$.LC13, %edi
	call	puts
	.loc 1 113 0
	movl	$-1, %eax
	jmp	.L4
.L12:
	.loc 1 116 0
	movq	-2152(%rbp), %rax
	movl	$84, (%rax)
	.loc 1 118 0
	movq	-2128(%rbp), %rax
	movq	(%rax), %rdx
	leaq	-1072(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	.loc 1 120 0
	leaq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, %edx
	movq	-2152(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 1 122 0
	leaq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	-2152(%rbp), %rax
	leaq	8(%rax), %rcx
	leaq	-1072(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy
	.loc 1 124 0
	leaq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	leaq	8(%rax), %rdx
	movq	-2152(%rbp), %rcx
	movl	-2196(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2164(%rbp)
	.loc 1 126 0
	cmpl	$0, -2164(%rbp)
	jg	.L14
	.loc 1 128 0
	movl	$.LC14, %edi
	call	perror
	.loc 1 129 0
	movl	$-1, %eax
	jmp	.L4
.L14:
	.loc 1 131 0
	movq	-2128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
	.loc 1 133 0
	movq	-2152(%rbp), %rax
	movq	%rax, %rdi
	call	free
.L11:
	.loc 1 105 0
	movq	-2136(%rbp), %rax
	movq	%rax, %rdi
	call	mysql_fetch_field
	movq	%rax, -2128(%rbp)
	cmpq	$0, -2128(%rbp)
	jne	.L15
	.loc 1 136 0
	movl	$10, %edi
	call	putchar
	.loc 1 144 0
	movl	$16, %edi
	call	malloc
	movq	%rax, -2152(%rbp)
	.loc 1 146 0
	cmpq	$0, -2152(%rbp)
	jne	.L16
	.loc 1 148 0
	movl	$.LC13, %edi
	call	puts
	.loc 1 149 0
	movl	$-1, %eax
	jmp	.L4
.L16:
	.loc 1 152 0
	movq	-2152(%rbp), %rax
	movl	$85, (%rax)
	.loc 1 158 0
	movl	-2168(%rbp), %eax
	movl	%eax, -2160(%rbp)
	.loc 1 160 0
	movl	-2172(%rbp), %eax
	movl	%eax, -2156(%rbp)
	.loc 1 162 0
	movl	-2168(%rbp), %edx
	movl	-2172(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	.loc 1 164 0
	movq	-2152(%rbp), %rax
	movl	$8, 4(%rax)
	.loc 1 166 0
	movq	-2152(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-2160(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 168 0
	movq	-2152(%rbp), %rcx
	movl	-2196(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2164(%rbp)
	.loc 1 170 0
	movl	-2164(%rbp), %eax
	movl	$170, %edx
	movl	%eax, %esi
	movl	$.LC16, %edi
	movl	$0, %eax
	call	printf
	.loc 1 172 0
	movq	-2152(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 174 0
	jmp	.L17
.L21:
	.loc 1 176 0
	movl	-2172(%rbp), %edx
	movl	-2168(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC17, %edi
	movl	$0, %eax
	call	printf
	.loc 1 178 0
	movl	$0, -2180(%rbp)
	jmp	.L18
.L20:
	.loc 1 180 0
	movl	$1036, %edi
	call	malloc
	movq	%rax, -2152(%rbp)
	.loc 1 182 0
	cmpq	$0, -2152(%rbp)
	jne	.L19
	.loc 1 184 0
	movl	$.LC13, %edi
	call	puts
	.loc 1 185 0
	movl	$-1, %eax
	jmp	.L4
.L19:
	.loc 1 188 0 discriminator 2
	movq	-2152(%rbp), %rax
	movl	$86, (%rax)
	.loc 1 190 0 discriminator 2
	movl	-2180(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-2120(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	-2112(%rbp), %rdx
	addq	$4, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy
	.loc 1 192 0 discriminator 2
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -2112(%rbp)
	.loc 1 194 0 discriminator 2
	movq	-2152(%rbp), %rax
	movl	$1028, 4(%rax)
	.loc 1 196 0 discriminator 2
	movq	-2152(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	leaq	-2112(%rbp), %rax
	movl	$1028, %ecx
	movq	(%rax), %rsi
	movq	%rsi, (%rdx)
	movl	%ecx, %esi
	addq	%rdx, %rsi
	leaq	8(%rsi), %rdi
	movl	%ecx, %esi
	addq	%rax, %rsi
	addq	$8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rdx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%edx, %ecx
	andl	$-8, %ecx
	shrl	$3, %ecx
	movl	%ecx, %edx
	movl	%edx, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	.loc 1 198 0 discriminator 2
	movq	-2152(%rbp), %rcx
	movl	-2196(%rbp), %eax
	movl	$1036, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2164(%rbp)
	.loc 1 200 0 discriminator 2
	movl	-2164(%rbp), %eax
	movl	$200, %edx
	movl	%eax, %esi
	movl	$.LC16, %edi
	movl	$0, %eax
	call	printf
	.loc 1 202 0 discriminator 2
	leaq	-2112(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	movl	$.LC18, %edi
	movl	$0, %eax
	call	printf
	.loc 1 204 0 discriminator 2
	movq	-2152(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 178 0 discriminator 2
	addl	$1, -2180(%rbp)
.L18:
	.loc 1 178 0 is_stmt 0 discriminator 1
	movl	-2180(%rbp), %eax
	cmpl	-2172(%rbp), %eax
	jl	.L20
	.loc 1 207 0 is_stmt 1
	movl	$10, %edi
	call	putchar
.L17:
	.loc 1 174 0
	movq	-2136(%rbp), %rax
	movq	%rax, %rdi
	call	mysql_fetch_row
	movq	%rax, -2120(%rbp)
	cmpq	$0, -2120(%rbp)
	jne	.L21
.L10:
.LBE2:
	.loc 1 211 0
	movl	$8, %edi
	call	malloc
	movq	%rax, -2152(%rbp)
	.loc 1 213 0
	cmpq	$0, -2152(%rbp)
	jne	.L22
	.loc 1 215 0
	movl	$.LC13, %edi
	call	puts
	.loc 1 216 0
	movl	$-1, %eax
	jmp	.L4
.L22:
	.loc 1 219 0
	movq	-2152(%rbp), %rax
	movl	$87, (%rax)
	.loc 1 221 0
	movq	-2152(%rbp), %rcx
	movl	-2196(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2164(%rbp)
	.loc 1 223 0
	movq	-2152(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 225 0
	movq	-2136(%rbp), %rax
	movq	%rax, %rdi
	call	mysql_free_result
	.loc 1 228 0
	movl	$mysql, %edi
	call	mysql_close
.L4:
	.loc 1 229 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L24
	call	__stack_chk_fail
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	record_mysql, .-record_mysql
	.section	.rodata
.LC19:
	.string	"%04d-%02d-%02d\n"
.LC20:
	.string	"%02d:%02d:%02d\n"
.LC21:
	.string	"%s %s"
	.align 8
.LC22:
	.string	"insert into record  values (%d,'%s','%s','%s','%s');"
.LC23:
	.string	"%s,%d\n"
	.text
	.globl	mysql_record
	.type	mysql_record, @function
mysql_record:
.LFB4:
	.loc 1 233 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2256, %rsp
	movl	%edi, -2228(%rbp)
	movq	%rsi, -2240(%rbp)
	movq	%rdx, -2248(%rbp)
	.loc 1 233 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 246 0
	movl	$mysql, %edi
	call	mysql_init
	.loc 1 246 0
	testq	%rax, %rax
	jne	.L26
	.loc 1 248 0
	movl	$.LC1, %edi
	call	puts
	.loc 1 249 0
	movl	$0, %eax
	jmp	.L34
.L26:
	.loc 1 252 0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$.LC2, %r8d
	movl	$.LC3, %ecx
	movl	$.LC4, %edx
	movl	$.LC5, %esi
	movl	$mysql, %edi
	call	mysql_real_connect
	addq	$16, %rsp
	.loc 1 252 0
	testq	%rax, %rax
	jne	.L28
	.loc 1 254 0
	movl	$mysql, %edi
	call	mysql_error
	movq	%rax, %rdi
	call	puts
	.loc 1 255 0
	movl	$0, %eax
	jmp	.L34
.L28:
	.loc 1 258 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 260 0
	movq	$0, -2208(%rbp)
	.loc 1 262 0
	movq	-2248(%rbp), %rax
	movq	%rax, -2208(%rbp)
	.loc 1 264 0
	jmp	.L29
.L32:
	.loc 1 266 0
	movq	-2208(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	-2228(%rbp), %eax
	je	.L36
	.loc 1 268 0
	movq	-2208(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, -2208(%rbp)
.L29:
	.loc 1 264 0
	cmpq	$0, -2208(%rbp)
	jne	.L32
	jmp	.L31
.L36:
	.loc 1 267 0
	nop
.L31:
	.loc 1 276 0
	leaq	-2216(%rbp), %rax
	movq	%rax, %rdi
	call	time
	.loc 1 278 0
	leaq	-2216(%rbp), %rax
	movq	%rax, %rdi
	call	localtime
	movq	%rax, -2200(%rbp)
	.loc 1 280 0
	movq	-2200(%rbp), %rax
	movl	12(%rax), %esi
	movq	-2200(%rbp), %rax
	movl	16(%rax), %eax
	leal	1(%rax), %ecx
	movq	-2200(%rbp), %rax
	movl	20(%rax), %eax
	leal	1900(%rax), %edx
	leaq	-2064(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC19, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 282 0
	movq	-2200(%rbp), %rax
	movl	(%rax), %esi
	movq	-2200(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-2200(%rbp), %rax
	movl	8(%rax), %edx
	leaq	-1040(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC20, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 284 0
	leaq	-1040(%rbp), %rdx
	leaq	-2064(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC21, %edi
	movl	$0, %eax
	call	printf
	.loc 1 286 0
	movq	-2208(%rbp), %rax
	leaq	4(%rax), %rcx
	movq	-2208(%rbp), %rax
	movl	(%rax), %edx
	leaq	-1040(%rbp), %rdi
	leaq	-2064(%rbp), %rsi
	leaq	-2192(%rbp), %rax
	subq	$8, %rsp
	pushq	-2240(%rbp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$.LC22, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	addq	$16, %rsp
	.loc 1 288 0
	leaq	-2192(%rbp), %rax
	movq	%rax, %rsi
	movl	$mysql, %edi
	call	mysql_query
	testl	%eax, %eax
	je	.L33
	.loc 1 290 0
	movl	$mysql, %edi
	call	mysql_error
	movl	$290, %edx
	movq	%rax, %rsi
	movl	$.LC23, %edi
	movl	$0, %eax
	call	printf
	.loc 1 291 0
	movl	$-1, %eax
	jmp	.L34
.L33:
	.loc 1 294 0
	movl	$mysql, %edi
	call	mysql_close
	.loc 1 296 0
	movl	$0, %eax
.L34:
	.loc 1 297 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L35
	.loc 1 297 0 is_stmt 0
	call	__stack_chk_fail
.L35:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	mysql_record, .-mysql_record
	.section	.rodata
.LC24:
	.string	"select num,passwd  from msg"
	.text
	.globl	show_mysql
	.type	show_mysql, @function
show_mysql:
.LFB5:
	.loc 1 305 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2208, %rsp
	movl	%edi, -2196(%rbp)
	movq	%rsi, -2208(%rbp)
	.loc 1 305 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 307 0
	movl	$.LC0, %edi
	call	puts
	.loc 1 311 0
	movq	$0, -2152(%rbp)
	.loc 1 315 0
	movl	$mysql, %edi
	call	mysql_init
	.loc 1 315 0
	testq	%rax, %rax
	jne	.L38
	.loc 1 317 0
	movl	$.LC1, %edi
	call	puts
	.loc 1 318 0
	movl	$0, %eax
	jmp	.L37
.L38:
	.loc 1 321 0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$.LC2, %r8d
	movl	$.LC3, %ecx
	movl	$.LC4, %edx
	movl	$.LC5, %esi
	movl	$mysql, %edi
	call	mysql_real_connect
	addq	$16, %rsp
	.loc 1 321 0
	testq	%rax, %rax
	jne	.L40
	.loc 1 323 0
	movl	$mysql, %edi
	call	mysql_error
	movq	%rax, %rdi
	call	puts
	.loc 1 324 0
	movl	$0, %eax
	jmp	.L37
.L40:
	.loc 1 327 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 329 0
	movl	$.LC7, %esi
	movl	$mysql, %edi
	call	mysql_set_character_set
	.loc 1 331 0
	movq	$.LC24, -2144(%rbp)
	.loc 1 333 0
	movq	-2144(%rbp), %rax
	movq	%rax, %rsi
	movl	$mysql, %edi
	call	mysql_query
	movl	%eax, -2176(%rbp)
	.loc 1 336 0
	cmpl	$0, -2176(%rbp)
	je	.L41
	.loc 1 338 0
	movl	$mysql, %edi
	call	mysql_error
	movq	%rax, %rsi
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	.loc 1 339 0
	movl	$-1, %eax
	jmp	.L37
.L41:
	.loc 1 341 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 345 0
	movl	$mysql, %edi
	call	mysql_store_result
	movq	%rax, -2136(%rbp)
	.loc 1 348 0
	cmpq	$0, -2136(%rbp)
	jne	.L42
	.loc 1 350 0
	movl	$.LC10, %edi
	call	puts
	.loc 1 351 0
	movl	$0, %eax
	jmp	.L37
.L42:
	.loc 1 355 0
	movq	-2136(%rbp), %rax
	movq	%rax, %rdi
	call	mysql_num_fields
	movl	%eax, -2172(%rbp)
	.loc 1 360 0
	movq	-2136(%rbp), %rax
	movq	%rax, %rdi
	call	mysql_num_rows
	movl	%eax, -2168(%rbp)
	.loc 1 362 0
	movl	-2168(%rbp), %edx
	movl	-2172(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	.loc 1 369 0
	movl	-2204(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-2181(%rbp), %rcx
	movl	-2196(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2164(%rbp)
	.loc 1 371 0
	movzbl	-2181(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC12, %edi
	movl	$0, %eax
	call	printf
	.loc 1 373 0
	movzbl	-2181(%rbp), %eax
	cmpb	$121, %al
	jne	.L43
.LBB3:
	.loc 1 374 0
	jmp	.L44
.L48:
	.loc 1 376 0
	movl	$9, %edi
	call	malloc
	movq	%rax, -2152(%rbp)
	.loc 1 377 0
	cmpq	$0, -2152(%rbp)
	jne	.L45
	.loc 1 379 0
	movl	$.LC13, %edi
	call	puts
	.loc 1 380 0
	movl	$-1, %eax
	jmp	.L37
.L45:
	.loc 1 383 0
	movq	-2152(%rbp), %rax
	movl	$74, (%rax)
	.loc 1 385 0
	movq	-2128(%rbp), %rax
	movq	(%rax), %rdx
	leaq	-1072(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	.loc 1 387 0
	leaq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, %edx
	movq	-2152(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 1 389 0
	leaq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movq	-2152(%rbp), %rax
	leaq	8(%rax), %rcx
	leaq	-1072(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy
	.loc 1 391 0
	leaq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	leaq	8(%rax), %rdx
	movq	-2152(%rbp), %rcx
	movl	-2196(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2164(%rbp)
	.loc 1 393 0
	cmpl	$0, -2164(%rbp)
	jg	.L47
	.loc 1 395 0
	movl	$.LC14, %edi
	call	perror
	.loc 1 396 0
	movl	$-1, %eax
	jmp	.L37
.L47:
	.loc 1 398 0
	movq	-2128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
	.loc 1 400 0
	movq	-2152(%rbp), %rax
	movq	%rax, %rdi
	call	free
.L44:
	.loc 1 374 0
	movq	-2136(%rbp), %rax
	movq	%rax, %rdi
	call	mysql_fetch_field
	movq	%rax, -2128(%rbp)
	cmpq	$0, -2128(%rbp)
	jne	.L48
	.loc 1 403 0
	movl	$10, %edi
	call	putchar
	.loc 1 412 0
	movl	$16, %edi
	call	malloc
	movq	%rax, -2152(%rbp)
	.loc 1 414 0
	cmpq	$0, -2152(%rbp)
	jne	.L49
	.loc 1 416 0
	movl	$.LC13, %edi
	call	puts
	.loc 1 417 0
	movl	$-1, %eax
	jmp	.L37
.L49:
	.loc 1 420 0
	movq	-2152(%rbp), %rax
	movl	$75, (%rax)
	.loc 1 426 0
	movl	-2168(%rbp), %eax
	movl	%eax, -2160(%rbp)
	.loc 1 428 0
	movl	-2172(%rbp), %eax
	movl	%eax, -2156(%rbp)
	.loc 1 430 0
	movl	-2168(%rbp), %edx
	movl	-2172(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	.loc 1 432 0
	movq	-2152(%rbp), %rax
	movl	$8, 4(%rax)
	.loc 1 434 0
	movq	-2152(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-2160(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 1 436 0
	movq	-2152(%rbp), %rcx
	movl	-2196(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2164(%rbp)
	.loc 1 438 0
	movl	-2164(%rbp), %eax
	movl	$438, %edx
	movl	%eax, %esi
	movl	$.LC16, %edi
	movl	$0, %eax
	call	printf
	.loc 1 440 0
	movq	-2152(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 442 0
	jmp	.L50
.L54:
	.loc 1 445 0
	movl	-2172(%rbp), %edx
	movl	-2168(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC17, %edi
	movl	$0, %eax
	call	printf
	.loc 1 447 0
	movl	$0, -2180(%rbp)
	jmp	.L51
.L53:
	.loc 1 450 0
	movl	$1036, %edi
	call	malloc
	movq	%rax, -2152(%rbp)
	.loc 1 452 0
	cmpq	$0, -2152(%rbp)
	jne	.L52
	.loc 1 454 0
	movl	$.LC13, %edi
	call	puts
	.loc 1 455 0
	movl	$-1, %eax
	jmp	.L37
.L52:
	.loc 1 458 0 discriminator 2
	movq	-2152(%rbp), %rax
	movl	$76, (%rax)
	.loc 1 460 0 discriminator 2
	movl	-2180(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-2120(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	-2112(%rbp), %rdx
	addq	$4, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy
	.loc 1 462 0 discriminator 2
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -2112(%rbp)
	.loc 1 464 0 discriminator 2
	movq	-2152(%rbp), %rax
	movl	$1028, 4(%rax)
	.loc 1 466 0 discriminator 2
	movq	-2152(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	leaq	-2112(%rbp), %rax
	movl	$1028, %ecx
	movq	(%rax), %rsi
	movq	%rsi, (%rdx)
	movl	%ecx, %esi
	addq	%rdx, %rsi
	leaq	8(%rsi), %rdi
	movl	%ecx, %esi
	addq	%rax, %rsi
	addq	$8, %rsi
	movq	-16(%rsi), %rsi
	movq	%rsi, -16(%rdi)
	leaq	8(%rdx), %rdi
	andq	$-8, %rdi
	subq	%rdi, %rdx
	subq	%rdx, %rax
	addl	%edx, %ecx
	andl	$-8, %ecx
	shrl	$3, %ecx
	movl	%ecx, %edx
	movl	%edx, %edx
	movq	%rax, %rsi
	movq	%rdx, %rcx
	rep movsq
	.loc 1 468 0 discriminator 2
	movq	-2152(%rbp), %rcx
	movl	-2196(%rbp), %eax
	movl	$1036, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2164(%rbp)
	.loc 1 470 0 discriminator 2
	movl	-2164(%rbp), %eax
	movl	$470, %edx
	movl	%eax, %esi
	movl	$.LC16, %edi
	movl	$0, %eax
	call	printf
	.loc 1 472 0 discriminator 2
	leaq	-2112(%rbp), %rax
	addq	$4, %rax
	movq	%rax, %rsi
	movl	$.LC18, %edi
	movl	$0, %eax
	call	printf
	.loc 1 474 0 discriminator 2
	movq	-2152(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 447 0 discriminator 2
	addl	$1, -2180(%rbp)
.L51:
	.loc 1 447 0 is_stmt 0 discriminator 1
	movl	-2180(%rbp), %eax
	cmpl	-2172(%rbp), %eax
	jl	.L53
	.loc 1 477 0 is_stmt 1
	movl	$10, %edi
	call	putchar
.L50:
	.loc 1 442 0
	movq	-2136(%rbp), %rax
	movq	%rax, %rdi
	call	mysql_fetch_row
	movq	%rax, -2120(%rbp)
	cmpq	$0, -2120(%rbp)
	jne	.L54
.L43:
.LBE3:
	.loc 1 482 0
	movl	$8, %edi
	call	malloc
	movq	%rax, -2152(%rbp)
	.loc 1 484 0
	cmpq	$0, -2152(%rbp)
	jne	.L55
	.loc 1 486 0
	movl	$.LC13, %edi
	call	puts
	.loc 1 487 0
	movl	$-1, %eax
	jmp	.L37
.L55:
	.loc 1 490 0
	movq	-2152(%rbp), %rax
	movl	$77, (%rax)
	.loc 1 492 0
	movq	-2152(%rbp), %rcx
	movl	-2196(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2164(%rbp)
	.loc 1 494 0
	movq	-2152(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 497 0
	movq	-2136(%rbp), %rax
	movq	%rax, %rdi
	call	mysql_free_result
	.loc 1 499 0
	movl	$mysql, %edi
	call	mysql_close
.L37:
	.loc 1 500 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L57
	call	__stack_chk_fail
.L57:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	show_mysql, .-show_mysql
	.section	.rodata
.LC25:
	.string	"write sucess"
	.text
	.globl	send_link
	.type	send_link, @function
send_link:
.LFB6:
	.loc 1 504 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	.loc 1 504 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 508 0
	movq	$0, -32(%rbp)
	.loc 1 510 0
	movq	-56(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 1 512 0
	movq	$0, -24(%rbp)
	.loc 1 514 0
	movl	$8, %edi
	call	malloc
	movq	%rax, -24(%rbp)
	.loc 1 516 0
	movq	-24(%rbp), %rax
	movl	$100, (%rax)
	.loc 1 518 0
	movq	-24(%rbp), %rcx
	movl	-60(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -36(%rbp)
	.loc 1 520 0
	jmp	.L59
.L62:
	.loc 1 523 0
	movq	-32(%rbp), %rcx
	movl	-60(%rbp), %eax
	movl	$120, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -36(%rbp)
	.loc 1 525 0
	cmpl	$0, -36(%rbp)
	jns	.L60
	.loc 1 527 0
	movl	$.LC14, %edi
	call	perror
	.loc 1 528 0
	jmp	.L61
.L60:
	.loc 1 532 0
	movl	$.LC25, %edi
	call	puts
	.loc 1 535 0
	movq	-32(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, -32(%rbp)
.L59:
	.loc 1 520 0
	cmpq	$0, -32(%rbp)
	jne	.L62
.L61:
	.loc 1 541 0
	movl	$62, -16(%rbp)
	.loc 1 543 0
	leaq	-16(%rbp), %rcx
	movl	-60(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	.loc 1 545 0
	movl	$0, %eax
	.loc 1 546 0
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L64
	call	__stack_chk_fail
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	send_link, .-send_link
	.section	.rodata
.LC26:
	.string	"%d\t%s\t%d\t%s\t%d\n"
	.text
	.globl	show
	.type	show, @function
show:
.LFB7:
	.loc 1 552 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 554 0
	movq	$0, -8(%rbp)
	.loc 1 556 0
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 558 0
	jmp	.L66
.L67:
	.loc 1 561 0
	movq	-8(%rbp), %rax
	movl	36(%rax), %ecx
	movq	-8(%rbp), %rax
	leaq	44(%rax), %rdi
	movq	-8(%rbp), %rax
	movl	40(%rax), %edx
	movq	-8(%rbp), %rax
	leaq	4(%rax), %rsi
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%ecx, %r9d
	movq	%rdi, %r8
	movl	%edx, %ecx
	movq	%rsi, %rdx
	movl	%eax, %esi
	movl	$.LC26, %edi
	movl	$0, %eax
	call	printf
	.loc 1 563 0
	movq	-8(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, -8(%rbp)
.L66:
	.loc 1 558 0
	cmpq	$0, -8(%rbp)
	jne	.L67
	.loc 1 565 0
	movl	$0, %eax
	.loc 1 566 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	show, .-show
	.section	.rodata
.LC27:
	.string	"./log"
.LC28:
	.string	"open"
.LC29:
	.string	"buf:%s"
.LC30:
	.string	"open sucess"
	.align 8
.LC31:
	.string	"\346\227\266\351\227\264:%02d-%02d-%04d %02d:%02d:%02d\tid:%d\tip:%s\tport:%d\t\346\226\255\345\274\200\n"
	.text
	.globl	close_file
	.type	close_file, @function
close_file:
.LFB8:
	.loc 1 570 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1352, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -1352(%rbp)
	movl	%esi, -1356(%rbp)
	.loc 1 570 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 574 0
	movq	$0, -1328(%rbp)
	.loc 1 576 0
	movq	-1352(%rbp), %rax
	movq	%rax, -1328(%rbp)
	.loc 1 578 0
	jmp	.L70
.L73:
	.loc 1 580 0
	movq	-1328(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	-1356(%rbp), %eax
	je	.L77
	.loc 1 583 0
	movq	-1328(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, -1328(%rbp)
.L70:
	.loc 1 578 0
	cmpq	$0, -1328(%rbp)
	jne	.L73
	jmp	.L72
.L77:
	.loc 1 581 0
	nop
.L72:
	.loc 1 590 0
	leaq	-1336(%rbp), %rax
	movq	%rax, %rdi
	call	time
	.loc 1 592 0
	leaq	-1336(%rbp), %rax
	movq	%rax, %rdi
	call	localtime
	movq	%rax, -1320(%rbp)
	.loc 1 596 0
	movl	$1025, %esi
	movl	$.LC27, %edi
	movl	$0, %eax
	call	open
	movl	%eax, -1340(%rbp)
	.loc 1 598 0
	cmpl	$0, -1340(%rbp)
	jns	.L74
	.loc 1 600 0
	movl	$.LC28, %edi
	call	perror
	.loc 1 601 0
	movl	$-1, %eax
	jmp	.L69
.L74:
	.loc 1 606 0
	leaq	-1312(%rbp), %rax
	movl	$1634038370, (%rax)
	movw	$107, 4(%rax)
	.loc 1 608 0
	movq	-1352(%rbp), %rdx
	leaq	-1312(%rbp), %rcx
	movl	-1356(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	mysql_record
	.loc 1 610 0
	leaq	-1312(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC29, %edi
	movl	$0, %eax
	call	printf
	.loc 1 612 0
	movl	$.LC30, %edi
	call	puts
	.loc 1 616 0
	movq	-1328(%rbp), %rax
	movl	40(%rax), %r8d
	movq	-1328(%rbp), %rax
	leaq	44(%rax), %r11
	movq	-1328(%rbp), %rax
	movl	(%rax), %edi
	movq	-1320(%rbp), %rax
	movl	(%rax), %esi
	movq	-1320(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-1320(%rbp), %rax
	movl	8(%rax), %r9d
	movq	-1320(%rbp), %rax
	movl	20(%rax), %eax
	leal	1900(%rax), %ebx
	movq	-1320(%rbp), %rax
	movl	12(%rax), %edx
	movq	-1320(%rbp), %rax
	movl	16(%rax), %eax
	leal	1(%rax), %r10d
	leaq	-1056(%rbp), %rax
	subq	$8, %rsp
	pushq	%r8
	pushq	%r11
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	movl	%ebx, %r8d
	movl	%edx, %ecx
	movl	%r10d, %edx
	movl	$.LC31, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	addq	$48, %rsp
	.loc 1 618 0
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	-1056(%rbp), %rcx
	movl	-1340(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	.loc 1 620 0
	movl	-1340(%rbp), %eax
	movl	%eax, %edi
	call	close
.L69:
	.loc 1 621 0
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L76
	call	__stack_chk_fail
.L76:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	close_file, .-close_file
	.section	.rodata
	.align 8
.LC32:
	.string	"\346\227\266\351\227\264:%02d-%02d-%04d %02d:%02d:%02d\tid:%d\tip:%s\tport:%d\t\347\231\273\345\275\225\n"
	.text
	.globl	open_file
	.type	open_file, @function
open_file:
.LFB9:
	.loc 1 626 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1352, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -1352(%rbp)
	.loc 1 626 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 633 0
	leaq	-1328(%rbp), %rax
	movq	%rax, %rdi
	call	time
	.loc 1 635 0
	leaq	-1328(%rbp), %rax
	movq	%rax, %rdi
	call	localtime
	movq	%rax, -1320(%rbp)
	.loc 1 639 0
	movl	$1025, %esi
	movl	$.LC27, %edi
	movl	$0, %eax
	call	open
	movl	%eax, -1336(%rbp)
	.loc 1 641 0
	cmpl	$0, -1336(%rbp)
	jns	.L79
	.loc 1 643 0
	movl	$.LC28, %edi
	call	perror
	.loc 1 644 0
	movl	$-1, %eax
	jmp	.L78
.L79:
	.loc 1 649 0
	movq	-1352(%rbp), %rax
	movl	36(%rax), %eax
	movl	%eax, -1332(%rbp)
	.loc 1 651 0
	leaq	-1312(%rbp), %rax
	movabsq	$32760384594014051, %rbx
	movq	%rbx, (%rax)
	.loc 1 653 0
	movq	-1352(%rbp), %rdx
	leaq	-1312(%rbp), %rcx
	movl	-1332(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	mysql_record
	.loc 1 655 0
	movl	$.LC30, %edi
	call	puts
	.loc 1 659 0
	movq	-1352(%rbp), %rax
	movl	40(%rax), %r8d
	movq	-1352(%rbp), %rax
	leaq	44(%rax), %r11
	movq	-1352(%rbp), %rax
	movl	(%rax), %edi
	movq	-1320(%rbp), %rax
	movl	(%rax), %esi
	movq	-1320(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-1320(%rbp), %rax
	movl	8(%rax), %r9d
	movq	-1320(%rbp), %rax
	movl	20(%rax), %eax
	leal	1900(%rax), %ebx
	movq	-1320(%rbp), %rax
	movl	12(%rax), %edx
	movq	-1320(%rbp), %rax
	movl	16(%rax), %eax
	leal	1(%rax), %r10d
	leaq	-1056(%rbp), %rax
	subq	$8, %rsp
	pushq	%r8
	pushq	%r11
	pushq	%rdi
	pushq	%rsi
	pushq	%rcx
	movl	%ebx, %r8d
	movl	%edx, %ecx
	movl	%r10d, %edx
	movl	$.LC32, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	addq	$48, %rsp
	.loc 1 661 0
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	-1056(%rbp), %rcx
	movl	-1336(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	.loc 1 663 0
	movl	-1336(%rbp), %eax
	movl	%eax, %edi
	call	close
.L78:
	.loc 1 664 0
	movq	-24(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L81
	call	__stack_chk_fail
.L81:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	open_file, .-open_file
	.section	.rodata
.LC33:
	.string	"tcp broken"
.LC34:
	.string	"%d\t%s\n"
	.align 8
.LC35:
	.string	"select * from msg where num= %d and passwd='%s'"
	.text
	.globl	mysql_read
	.type	mysql_read, @function
mysql_read:
.LFB10:
	.loc 1 669 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$288, %rsp
	movq	%rdi, -264(%rbp)
	movl	%esi, -268(%rbp)
	movq	%rdx, -288(%rbp)
	.loc 1 669 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 677 0
	movq	$0, -248(%rbp)
	.loc 1 677 0
	movq	$0, -240(%rbp)
	.loc 1 679 0
	movq	-264(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -248(%rbp)
	.loc 1 681 0
	movq	-264(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -240(%rbp)
	.loc 1 685 0
	movl	$mysql, %edi
	call	mysql_init
	.loc 1 685 0
	testq	%rax, %rax
	jne	.L83
	.loc 1 687 0
	movl	$.LC1, %edi
	call	puts
	.loc 1 688 0
	movl	$0, %eax
	jmp	.L82
.L83:
	.loc 1 691 0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$.LC2, %r8d
	movl	$.LC3, %ecx
	movl	$.LC4, %edx
	movl	$.LC5, %esi
	movl	$mysql, %edi
	call	mysql_real_connect
	addq	$16, %rsp
	.loc 1 691 0
	testq	%rax, %rax
	jne	.L85
	.loc 1 693 0
	movl	$mysql, %edi
	call	mysql_error
	movq	%rax, %rdi
	call	puts
	.loc 1 694 0
	movl	$0, %eax
	jmp	.L82
.L85:
	.loc 1 697 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 699 0
	movl	-284(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-224(%rbp), %rcx
	movl	-268(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -256(%rbp)
	.loc 1 705 0
	cmpl	$0, -256(%rbp)
	jne	.L86
	.loc 1 707 0
	movl	$.LC33, %edi
	call	puts
	.loc 1 708 0
	movl	$-1, %eax
	jmp	.L82
.L86:
.LBB4:
	.loc 1 712 0
	movl	-192(%rbp), %eax
	leaq	-224(%rbp), %rdx
	addq	$36, %rdx
	movl	%eax, %esi
	movl	$.LC34, %edi
	movl	$0, %eax
	call	printf
	.loc 1 714 0
	movl	-192(%rbp), %edx
	leaq	-224(%rbp), %rax
	leaq	36(%rax), %rcx
	leaq	-144(%rbp), %rax
	movl	$.LC35, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 716 0
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	movl	$mysql, %edi
	call	mysql_query
	testl	%eax, %eax
	je	.L87
	.loc 1 718 0
	movl	$mysql, %edi
	call	mysql_error
	movq	%rax, %rdi
	call	puts
	.loc 1 719 0
	movl	$-1, %eax
	jmp	.L82
.L87:
	.loc 1 722 0
	movq	$0, -232(%rbp)
	.loc 1 724 0
	movl	$0, -252(%rbp)
	.loc 1 726 0
	movl	$mysql, %edi
	call	mysql_store_result
	movq	%rax, -232(%rbp)
	.loc 1 730 0
	cmpq	$0, -232(%rbp)
	je	.L88
	.loc 1 733 0
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	mysql_num_rows
	movl	%eax, -252(%rbp)
	.loc 1 735 0
	cmpl	$1, -252(%rbp)
	jne	.L89
	.loc 1 738 0
	jmp	.L90
.L92:
	.loc 1 740 0
	movq	-248(%rbp), %rax
	movl	(%rax), %edx
	movl	-192(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L91
	.loc 1 742 0
	movl	$2, -252(%rbp)
	.loc 1 743 0
	movl	-252(%rbp), %eax
	jmp	.L82
.L91:
	.loc 1 746 0
	movq	-248(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, -248(%rbp)
.L90:
	.loc 1 738 0
	cmpq	$0, -248(%rbp)
	jne	.L92
	.loc 1 750 0
	jmp	.L93
.L95:
	.loc 1 752 0
	movq	-240(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	-268(%rbp), %eax
	jne	.L94
	.loc 1 754 0
	movl	-192(%rbp), %edx
	movq	-240(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 756 0
	movq	-240(%rbp), %rax
	addq	$4, %rax
	leaq	-224(%rbp), %rdx
	addq	$36, %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	.loc 1 758 0
	movq	-240(%rbp), %rax
	movq	%rax, %rdi
	call	open_file
	.loc 1 760 0
	jmp	.L89
.L94:
	.loc 1 763 0
	movq	-240(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, -240(%rbp)
.L93:
	.loc 1 750 0
	cmpq	$0, -240(%rbp)
	jne	.L95
.L89:
	.loc 1 769 0
	movl	$mysql, %edi
	call	mysql_close
	.loc 1 771 0
	movl	-252(%rbp), %eax
	jmp	.L82
.L88:
.L82:
.LBE4:
	.loc 1 774 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L97
	call	__stack_chk_fail
.L97:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	mysql_read, .-mysql_read
	.globl	log_ok
	.type	log_ok, @function
log_ok:
.LFB11:
	.loc 1 780 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -104(%rbp)
	movl	%esi, -108(%rbp)
	movq	%rdx, -128(%rbp)
	.loc 1 780 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 786 0
	movl	-128(%rbp), %eax
	cmpl	$41, %eax
	jne	.L99
	.loc 1 789 0
	movq	-128(%rbp), %rdx
	movl	-108(%rbp), %ecx
	movq	-104(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	mysql_read
	movl	%eax, -84(%rbp)
	.loc 1 791 0
	cmpl	$1, -84(%rbp)
	jne	.L100
	.loc 1 794 0
	movl	$42, -88(%rbp)
	.loc 1 796 0
	leaq	-88(%rbp), %rcx
	movl	-108(%rbp), %eax
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	.loc 1 798 0
	movl	$0, %eax
	jmp	.L98
.L100:
	.loc 1 802 0
	movl	$43, -88(%rbp)
	.loc 1 804 0
	leaq	-88(%rbp), %rcx
	movl	-108(%rbp), %eax
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	.loc 1 806 0
	movl	$0, %eax
	jmp	.L98
.L99:
.L98:
	.loc 1 809 0
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L103
	call	__stack_chk_fail
.L103:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	log_ok, .-log_ok
	.section	.rodata
	.align 8
.LC36:
	.string	"delete from  msg  where  num=%d and passwd='%s'"
	.text
	.globl	mysql_exit
	.type	mysql_exit, @function
mysql_exit:
.LFB12:
	.loc 1 815 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$528, %rsp
	movl	%edi, -500(%rbp)
	movq	%rsi, -512(%rbp)
	movq	%rdx, -520(%rbp)
	.loc 1 815 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 817 0
	movq	-520(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -488(%rbp)
	.loc 1 823 0
	leaq	-272(%rbp), %rax
	movl	$1869049708, (%rax)
	movw	$29813, 4(%rax)
	movb	$0, 6(%rax)
	.loc 1 825 0
	movq	-488(%rbp), %rdx
	leaq	-272(%rbp), %rcx
	movl	-500(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	mysql_record
	.loc 1 831 0
	jmp	.L105
.L108:
	.loc 1 833 0
	movq	-488(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	-500(%rbp), %eax
	je	.L115
	.loc 1 836 0
	movq	-488(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, -488(%rbp)
.L105:
	.loc 1 831 0
	cmpq	$0, -488(%rbp)
	jne	.L108
	jmp	.L107
.L115:
	.loc 1 834 0
	nop
.L107:
	.loc 1 839 0
	movq	-488(%rbp), %rax
	movl	36(%rax), %ecx
	movq	-488(%rbp), %rax
	leaq	44(%rax), %rdi
	movq	-488(%rbp), %rax
	movl	40(%rax), %edx
	movq	-488(%rbp), %rax
	leaq	4(%rax), %rsi
	movq	-488(%rbp), %rax
	movl	(%rax), %eax
	movl	%ecx, %r9d
	movq	%rdi, %r8
	movl	%edx, %ecx
	movq	%rsi, %rdx
	movl	%eax, %esi
	movl	$.LC26, %edi
	movl	$0, %eax
	call	printf
	.loc 1 841 0
	movl	$mysql, %edi
	call	mysql_init
	.loc 1 841 0
	testq	%rax, %rax
	jne	.L109
	.loc 1 843 0
	movl	$.LC1, %edi
	call	puts
	.loc 1 844 0
	movl	$0, %eax
	jmp	.L104
.L109:
	.loc 1 847 0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$.LC2, %r8d
	movl	$.LC3, %ecx
	movl	$.LC4, %edx
	movl	$.LC5, %esi
	movl	$mysql, %edi
	call	mysql_real_connect
	addq	$16, %rsp
	.loc 1 847 0
	testq	%rax, %rax
	jne	.L111
	.loc 1 849 0
	movl	$mysql, %edi
	call	mysql_error
	movq	%rax, %rdi
	call	puts
	.loc 1 850 0
	movl	$0, %eax
	jmp	.L104
.L111:
	.loc 1 853 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 855 0
	movq	-488(%rbp), %rax
	leaq	4(%rax), %rcx
	movq	-488(%rbp), %rax
	movl	(%rax), %edx
	leaq	-400(%rbp), %rax
	movl	$.LC36, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 856 0
	leaq	-400(%rbp), %rax
	movq	%rax, %rsi
	movl	$mysql, %edi
	call	mysql_query
	testl	%eax, %eax
	je	.L112
	.loc 1 858 0
	movl	$mysql, %edi
	call	mysql_error
	movl	$858, %edx
	movq	%rax, %rsi
	movl	$.LC23, %edi
	movl	$0, %eax
	call	printf
	.loc 1 859 0
	movl	$-1, %eax
	jmp	.L104
.L112:
	.loc 1 863 0
	movl	$mysql, %edi
	call	mysql_close
.L104:
	.loc 1 864 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L114
	call	__stack_chk_fail
.L114:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	mysql_exit, .-mysql_exit
	.section	.rodata
.LC37:
	.string	"exit"
.LC38:
	.string	"ret:%d,a:%c\t,lenth:%d\n"
.LC39:
	.string	"tcp broken %d\n"
.LC40:
	.string	"%d,%d\n"
	.text
	.globl	exit_ok
	.type	exit_ok, @function
exit_ok:
.LFB13:
	.loc 1 867 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	.loc 1 867 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 873 0
	movl	$.LC37, %edi
	call	puts
	.loc 1 875 0
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-17(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -12(%rbp)
	.loc 1 877 0
	movl	-44(%rbp), %ecx
	movzbl	-17(%rbp), %eax
	movsbl	%al, %edx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC38, %edi
	movl	$0, %eax
	call	printf
	.loc 1 883 0
	cmpl	$0, -12(%rbp)
	jne	.L117
	.loc 1 885 0
	movl	$885, %esi
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
	.loc 1 886 0
	movl	$-1, %eax
	jmp	.L121
.L117:
	.loc 1 887 0
	cmpl	$0, -12(%rbp)
	jle	.L119
	.loc 1 889 0
	movzbl	-17(%rbp), %eax
	cmpb	$121, %al
	jne	.L119
	.loc 1 892 0
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	mysql_exit
	movl	%eax, -12(%rbp)
	.loc 1 894 0
	movl	-12(%rbp), %eax
	movl	$894, %edx
	movl	%eax, %esi
	movl	$.LC40, %edi
	movl	$0, %eax
	call	printf
	.loc 1 895 0
	cmpl	$-1, -12(%rbp)
	jne	.L120
	.loc 1 897 0
	movl	$53, -16(%rbp)
	.loc 1 899 0
	leaq	-16(%rbp), %rcx
	movl	-36(%rbp), %eax
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	jmp	.L119
.L120:
	.loc 1 903 0
	movl	$52, -16(%rbp)
	.loc 1 904 0
	leaq	-16(%rbp), %rcx
	movl	-36(%rbp), %eax
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
.L119:
	.loc 1 910 0
	movl	$0, %eax
.L121:
	.loc 1 911 0 discriminator 1
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L122
	.loc 1 911 0 is_stmt 0
	call	__stack_chk_fail
.L122:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	exit_ok, .-exit_ok
	.section	.rodata
.LC41:
	.string	"ret:%d,lenth:%d\n"
	.align 8
.LC42:
	.string	"insert into msg  values (%d,'%s','%s')"
	.text
	.globl	mysql_write
	.type	mysql_write, @function
mysql_write:
.LFB14:
	.loc 1 917 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movl	%edi, -244(%rbp)
	movq	%rsi, -256(%rbp)
	.loc 1 917 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 925 0
	movl	$mysql, %edi
	call	mysql_init
	.loc 1 925 0
	testq	%rax, %rax
	jne	.L124
	.loc 1 927 0
	movl	$.LC1, %edi
	call	puts
	.loc 1 928 0
	movl	$0, %eax
	jmp	.L123
.L124:
	.loc 1 931 0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$.LC2, %r8d
	movl	$.LC3, %ecx
	movl	$.LC4, %edx
	movl	$.LC5, %esi
	movl	$mysql, %edi
	call	mysql_real_connect
	addq	$16, %rsp
	.loc 1 931 0
	testq	%rax, %rax
	jne	.L126
	.loc 1 933 0
	movl	$mysql, %edi
	call	mysql_error
	movq	%rax, %rdi
	call	puts
	.loc 1 934 0
	movl	$0, %eax
	jmp	.L123
.L126:
	.loc 1 937 0
	movl	$.LC6, %edi
	call	puts
	.loc 1 939 0
	movl	-252(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-224(%rbp), %rcx
	movl	-244(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -228(%rbp)
	.loc 1 941 0
	movl	-252(%rbp), %edx
	movl	-228(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC41, %edi
	movl	$0, %eax
	call	printf
	.loc 1 947 0
	cmpl	$0, -228(%rbp)
	jne	.L127
	.loc 1 949 0
	movl	$949, %esi
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
	.loc 1 950 0
	movl	$-1, %eax
	jmp	.L123
.L127:
	.loc 1 954 0
	movl	-192(%rbp), %edx
	leaq	-224(%rbp), %rax
	leaq	36(%rax), %rsi
	leaq	-224(%rbp), %rcx
	leaq	-144(%rbp), %rax
	movq	%rsi, %r8
	movl	$.LC42, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 956 0
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	movl	$mysql, %edi
	call	mysql_query
	testl	%eax, %eax
	je	.L128
	.loc 1 958 0
	movl	$mysql, %edi
	call	mysql_error
	movl	$958, %edx
	movq	%rax, %rsi
	movl	$.LC23, %edi
	movl	$0, %eax
	call	printf
	.loc 1 959 0
	movl	$-1, %eax
	jmp	.L123
.L128:
	.loc 1 963 0
	movl	$mysql, %edi
	call	mysql_close
.L123:
	.loc 1 964 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L130
	call	__stack_chk_fail
.L130:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	mysql_write, .-mysql_write
	.section	.rodata
.LC43:
	.string	"reg"
	.text
	.globl	reg_ok
	.type	reg_ok, @function
reg_ok:
.LFB15:
	.loc 1 967 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 967 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 971 0
	movl	$.LC43, %edi
	call	puts
	.loc 1 973 0
	movq	-32(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	mysql_write
	movl	%eax, -12(%rbp)
	.loc 1 975 0
	movl	-12(%rbp), %eax
	movl	$975, %edx
	movl	%eax, %esi
	movl	$.LC40, %edi
	movl	$0, %eax
	call	printf
	.loc 1 977 0
	cmpl	$-1, -12(%rbp)
	je	.L132
	.loc 1 979 0
	movl	$12, -16(%rbp)
	.loc 1 981 0
	leaq	-16(%rbp), %rcx
	movl	-20(%rbp), %eax
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	jmp	.L133
.L132:
	.loc 1 985 0
	movl	$13, -16(%rbp)
	.loc 1 987 0
	leaq	-16(%rbp), %rcx
	movl	-20(%rbp), %eax
	movl	$4, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
.L133:
	.loc 1 990 0
	movl	$0, %eax
	.loc 1 992 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L135
	call	__stack_chk_fail
.L135:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	reg_ok, .-reg_ok
	.section	.rodata
.LC44:
	.string	"r"
.LC45:
	.string	"./server.conf"
.LC46:
	.string	"fopen failed."
.LC47:
	.string	"port"
.LC48:
	.string	"ip"
.LC49:
	.string	"%d\n"
.LC50:
	.string	"sockfd"
.LC51:
	.string	"bind"
.LC52:
	.string	"listen"
	.text
	.globl	socket_init
	.type	socket_init, @function
socket_init:
.LFB16:
	.loc 1 996 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$328, %rsp
	.cfi_offset 3, -24
	.loc 1 996 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 1008 0
	movq	$0, -312(%rbp)
	.loc 1 1012 0
	movl	$.LC44, %esi
	movl	$.LC45, %edi
	call	fopen
	movq	%rax, -312(%rbp)
	.loc 1 1013 0
	cmpq	$0, -312(%rbp)
	jne	.L139
	.loc 1 1015 0
	movl	$.LC46, %edi
	call	puts
	.loc 1 1016 0
	movl	$-1, %eax
	jmp	.L153
.L149:
	.loc 1 1023 0
	leaq	-160(%rbp), %rax
	movl	$4, %edx
	movl	$.LC47, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L140
	.loc 1 1025 0
	movl	$0, -332(%rbp)
	jmp	.L141
.L144:
	.loc 1 1027 0
	movl	-332(%rbp), %eax
	cltq
	movzbl	-160(%rbp,%rax), %eax
	cmpb	$47, %al
	jle	.L142
	.loc 1 1027 0 is_stmt 0 discriminator 1
	movl	-332(%rbp), %eax
	cltq
	movzbl	-160(%rbp,%rax), %eax
	cmpb	$57, %al
	jle	.L155
.L142:
	.loc 1 1025 0 is_stmt 1 discriminator 2
	addl	$1, -332(%rbp)
.L141:
	.loc 1 1025 0 is_stmt 0 discriminator 1
	movl	-332(%rbp), %eax
	movslq	%eax, %rbx
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	%rax, %rbx
	jb	.L144
	jmp	.L143
.L155:
	.loc 1 1028 0 is_stmt 1
	nop
.L143:
	.loc 1 1031 0
	leaq	-160(%rbp), %rdx
	movl	-332(%rbp), %eax
	cltq
	addq	%rax, %rdx
	leaq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	.loc 1 1033 0
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	subq	$1, %rax
	movb	$0, -160(%rbp,%rax)
	.loc 1 1035 0
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -336(%rbp)
	jmp	.L139
.L140:
	.loc 1 1037 0
	leaq	-160(%rbp), %rax
	movl	$2, %edx
	movl	$.LC48, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	jne	.L139
.LBB5:
	.loc 1 1039 0
	movl	$0, -328(%rbp)
	jmp	.L145
.L148:
	.loc 1 1041 0
	movl	-328(%rbp), %eax
	cltq
	movzbl	-160(%rbp,%rax), %eax
	cmpb	$47, %al
	jle	.L146
	.loc 1 1041 0 is_stmt 0 discriminator 1
	movl	-328(%rbp), %eax
	cltq
	movzbl	-160(%rbp,%rax), %eax
	cmpb	$57, %al
	jle	.L156
.L146:
	.loc 1 1039 0 is_stmt 1 discriminator 2
	addl	$1, -328(%rbp)
.L145:
	.loc 1 1039 0 is_stmt 0 discriminator 1
	movl	-328(%rbp), %eax
	movslq	%eax, %rbx
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	%rax, %rbx
	jb	.L148
	jmp	.L147
.L156:
	.loc 1 1042 0 is_stmt 1
	nop
.L147:
.LBE5:
	.loc 1 1045 0
	leaq	-160(%rbp), %rdx
	movl	-332(%rbp), %eax
	cltq
	addq	%rax, %rdx
	leaq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	.loc 1 1047 0
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	subq	$1, %rax
	movb	$0, -160(%rbp,%rax)
	.loc 1 1049 0
	leaq	-160(%rbp), %rdx
	leaq	-288(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
.L139:
	.loc 1 1021 0
	movq	-312(%rbp), %rdx
	leaq	-160(%rbp), %rax
	movl	$128, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	jne	.L149
	.loc 1 1052 0
	movl	-336(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC49, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1054 0
	leaq	-288(%rbp), %rax
	movq	%rax, %rdi
	call	puts
	.loc 1 1056 0
	movl	$0, %edx
	movl	$1, %esi
	movl	$2, %edi
	call	socket
	movl	%eax, -324(%rbp)
	.loc 1 1058 0
	cmpl	$0, -324(%rbp)
	jne	.L150
	.loc 1 1060 0
	movl	$.LC50, %edi
	call	perror
	.loc 1 1061 0
	movl	$-1, %eax
	jmp	.L153
.L150:
	.loc 1 1063 0
	movl	$16, -320(%rbp)
	.loc 1 1065 0
	movw	$2, -304(%rbp)
	.loc 1 1067 0
	movl	-336(%rbp), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	htons
	movw	%ax, -302(%rbp)
	.loc 1 1069 0
	leaq	-304(%rbp), %rax
	leaq	4(%rax), %rdx
	leaq	-288(%rbp), %rax
	movq	%rax, %rsi
	movl	$2, %edi
	call	inet_pton
	.loc 1 1071 0
	leaq	-304(%rbp), %rcx
	movl	-324(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind
	movl	%eax, -316(%rbp)
	.loc 1 1072 0
	cmpl	$0, -316(%rbp)
	jns	.L151
	.loc 1 1074 0
	movl	$.LC51, %edi
	call	perror
	.loc 1 1075 0
	movl	$-1, %eax
	jmp	.L153
.L151:
	.loc 1 1077 0
	movl	$0, %eax
	call	make_daemon
	.loc 1 1078 0
	movl	-324(%rbp), %eax
	movl	$20, %esi
	movl	%eax, %edi
	call	listen
	movl	%eax, -316(%rbp)
	.loc 1 1079 0
	cmpl	$0, -316(%rbp)
	jns	.L152
	.loc 1 1081 0
	movl	$.LC52, %edi
	call	perror
	.loc 1 1082 0
	movl	$-1, %eax
	jmp	.L153
.L152:
	.loc 1 1085 0
	movl	-324(%rbp), %eax
.L153:
	.loc 1 1087 0 discriminator 1
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L154
	.loc 1 1087 0 is_stmt 0
	call	__stack_chk_fail
.L154:
	addq	$328, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	socket_init, .-socket_init
	.globl	del_link
	.type	del_link, @function
del_link:
.LFB17:
	.loc 1 1091 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	.loc 1 1093 0
	movq	$0, -24(%rbp)
	.loc 1 1095 0
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 1 1097 0
	movq	$0, -8(%rbp)
	.loc 1 1099 0
	movl	$120, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	.loc 1 1101 0
	jmp	.L158
.L164:
	.loc 1 1103 0
	movq	-24(%rbp), %rax
	movl	36(%rax), %eax
	cmpl	-44(%rbp), %eax
	jne	.L159
	.loc 1 1105 0
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 1106 0
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	cmpq	-24(%rbp), %rax
	jne	.L160
	.loc 1 1109 0
	movq	-24(%rbp), %rax
	movq	112(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 1111 0
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 1113 0
	jmp	.L161
.L160:
.LBB6:
	.loc 1 1117 0
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 1119 0
	jmp	.L162
.L163:
	.loc 1 1121 0
	movq	-16(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, -16(%rbp)
.L162:
	.loc 1 1119 0
	movq	-16(%rbp), %rax
	movq	112(%rax), %rax
	cmpq	-24(%rbp), %rax
	jne	.L163
	.loc 1 1123 0
	movq	-24(%rbp), %rax
	movq	112(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 112(%rax)
	.loc 1 1125 0
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 1127 0
	jmp	.L161
.L159:
.LBE6:
	.loc 1 1130 0
	movq	-24(%rbp), %rax
	movq	112(%rax), %rax
	movq	%rax, -24(%rbp)
.L158:
	.loc 1 1101 0
	cmpq	$0, -24(%rbp)
	jne	.L164
.L161:
	.loc 1 1133 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	del_link, .-del_link
	.section	.rodata
.LC53:
	.string	"epoll_create"
.LC54:
	.string	"epoll_ctl"
.LC55:
	.string	"wait"
.LC56:
	.string	"epoll_wait"
.LC57:
	.string	"accept"
	.align 8
.LC58:
	.string	"\345\256\242\346\210\267\347\253\257[%d|%s]\350\277\236\346\216\245\346\210\220\345\212\237\357\274\201\n"
.LC59:
	.string	"read error%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB18:
	.loc 1 1136 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1328, %rsp
	.loc 1 1136 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1140 0
	movl	$0, %eax
	call	socket_init
	movl	%eax, -1320(%rbp)
	.loc 1 1142 0
	movq	$0, -1296(%rbp)
	.loc 1 1142 0
	movq	$0, -1288(%rbp)
	.loc 1 1142 0
	movq	$0, -1280(%rbp)
	.loc 1 1142 0
	movq	$0, -1272(%rbp)
	.loc 1 1146 0
	movl	$16, -1328(%rbp)
	.loc 1 1152 0
	movl	$100, %edi
	call	epoll_create
	movl	%eax, -1316(%rbp)
	.loc 1 1154 0
	cmpl	$0, -1316(%rbp)
	jns	.L166
	.loc 1 1156 0
	movl	$.LC53, %edi
	call	perror
	.loc 1 1158 0
	movl	-1320(%rbp), %eax
	movl	%eax, %edi
	call	close
	.loc 1 1160 0
	movl	$-1, %eax
	jmp	.L178
.L166:
	.loc 1 1163 0
	movl	$1, -1264(%rbp)
	.loc 1 1165 0
	movl	-1320(%rbp), %eax
	movl	%eax, -1260(%rbp)
	.loc 1 1167 0
	leaq	-1264(%rbp), %rcx
	movl	-1320(%rbp), %edx
	movl	-1316(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	epoll_ctl
	movl	%eax, -1312(%rbp)
	.loc 1 1168 0
	cmpl	$0, -1312(%rbp)
	jns	.L168
	.loc 1 1170 0
	movl	$.LC54, %edi
	call	perror
	.loc 1 1171 0
	movl	$-1, %eax
	jmp	.L178
.L168:
	.loc 1 1176 0
	movl	$.LC55, %edi
	call	puts
	.loc 1 1178 0
	leaq	-1216(%rbp), %rsi
	movl	-1316(%rbp), %eax
	movl	$-1, %ecx
	movl	$10, %edx
	movl	%eax, %edi
	call	epoll_wait
	movl	%eax, -1308(%rbp)
	.loc 1 1179 0
	cmpl	$0, -1308(%rbp)
	jns	.L169
	.loc 1 1181 0
	movl	$.LC56, %edi
	call	perror
	.loc 1 1182 0
	movl	$-1, %eax
	jmp	.L178
.L169:
.LBB7:
	.loc 1 1185 0
	movl	$0, -1324(%rbp)
	jmp	.L170
.L177:
	.loc 1 1187 0
	movl	-1324(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1212, %rax
	movl	(%rax), %eax
	movl	%eax, -1304(%rbp)
	.loc 1 1188 0
	movl	-1304(%rbp), %eax
	cmpl	-1320(%rbp), %eax
	jne	.L171
	.loc 1 1190 0
	movl	$120, %edi
	call	malloc
	movq	%rax, -1288(%rbp)
	.loc 1 1192 0
	movl	$.LC57, %edi
	call	puts
	.loc 1 1194 0
	leaq	-1328(%rbp), %rdx
	leaq	-1232(%rbp), %rcx
	movl	-1320(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	accept
	movl	%eax, -1300(%rbp)
	.loc 1 1196 0
	cmpl	$-1, -1300(%rbp)
	jne	.L172
	.loc 1 1198 0
	movl	$.LC57, %edi
	call	perror
	.loc 1 1199 0
	movl	$-1, %eax
	jmp	.L178
.L172:
	.loc 1 1202 0
	movl	$1, -1264(%rbp)
	.loc 1 1204 0
	movl	-1300(%rbp), %eax
	movl	%eax, -1260(%rbp)
	.loc 1 1206 0
	leaq	-1264(%rbp), %rcx
	movl	-1300(%rbp), %edx
	movl	-1316(%rbp), %eax
	movl	$1, %esi
	movl	%eax, %edi
	call	epoll_ctl
	.loc 1 1208 0
	movq	-1288(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 1210 0
	movq	-1288(%rbp), %rax
	addq	$4, %rax
	movw	$48, (%rax)
	.loc 1 1212 0
	movq	-1288(%rbp), %rax
	movl	-1300(%rbp), %edx
	movl	%edx, 36(%rax)
	.loc 1 1214 0
	movzwl	-1230(%rbp), %eax
	movzwl	%ax, %eax
	movl	%eax, %edi
	call	ntohs
	movzwl	%ax, %edx
	movq	-1288(%rbp), %rax
	movl	%edx, 40(%rax)
	.loc 1 1216 0
	movq	-1288(%rbp), %rax
	leaq	44(%rax), %rdx
	.loc 1 1216 0
	leaq	-1232(%rbp), %rax
	addq	$4, %rax
	movl	$64, %ecx
	movq	%rax, %rsi
	movl	$2, %edi
	call	inet_ntop
	.loc 1 1218 0
	movq	-1296(%rbp), %rdx
	movq	-1288(%rbp), %rax
	movq	%rdx, 112(%rax)
	.loc 1 1220 0
	movq	-1288(%rbp), %rax
	movq	%rax, -1296(%rbp)
	.loc 1 1222 0
	movq	-1288(%rbp), %rax
	leaq	44(%rax), %rdx
	movq	-1288(%rbp), %rax
	movl	40(%rax), %eax
	movl	%eax, %esi
	movl	$.LC58, %edi
	movl	$0, %eax
	call	printf
	jmp	.L173
.L171:
.LBB8:
	.loc 1 1227 0
	leaq	-1248(%rbp), %rcx
	movl	-1304(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -1312(%rbp)
	.loc 1 1228 0
	cmpl	$0, -1312(%rbp)
	jne	.L174
	.loc 1 1231 0
	movl	$1231, %esi
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1233 0
	movq	-1296(%rbp), %rax
	movl	-1304(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	close_file
	.loc 1 1235 0
	movl	-1304(%rbp), %edx
	movl	-1316(%rbp), %eax
	movl	$0, %ecx
	movl	$2, %esi
	movl	%eax, %edi
	call	epoll_ctl
	.loc 1 1237 0
	movl	-1304(%rbp), %edx
	leaq	-1296(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	del_link
	.loc 1 1239 0
	movl	-1304(%rbp), %eax
	movl	%eax, %edi
	call	close
	jmp	.L173
.L174:
	.loc 1 1240 0
	cmpl	$0, -1312(%rbp)
	jns	.L176
	.loc 1 1242 0
	movl	$1242, %esi
	movl	$.LC59, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1244 0
	movq	-1296(%rbp), %rax
	movl	-1304(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	close_file
	.loc 1 1246 0
	movl	-1304(%rbp), %edx
	movl	-1316(%rbp), %eax
	movl	$0, %ecx
	movl	$2, %esi
	movl	%eax, %edi
	call	epoll_ctl
	.loc 1 1248 0
	movl	-1304(%rbp), %edx
	leaq	-1296(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	del_link
	.loc 1 1250 0
	movl	-1304(%rbp), %eax
	movl	%eax, %edi
	call	close
	jmp	.L173
.L176:
	.loc 1 1253 0
	movl	-1304(%rbp), %edx
	movq	-1248(%rbp), %rcx
	leaq	-1296(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	name
.L173:
.LBE8:
	.loc 1 1185 0 discriminator 2
	addl	$1, -1324(%rbp)
.L170:
	.loc 1 1185 0 is_stmt 0 discriminator 1
	movl	-1324(%rbp), %eax
	cmpl	-1308(%rbp), %eax
	jl	.L177
.LBE7:
	.loc 1 1258 0 is_stmt 1
	jmp	.L168
.L178:
	.loc 1 1259 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L179
	.loc 1 1259 0 is_stmt 0
	call	__stack_chk_fail
.L179:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	main, .-main
	.section	.rodata
.LC60:
	.string	"upload %s"
.LC61:
	.string	"open over,%d\n"
.LC62:
	.string	"read"
.LC63:
	.string	"TCP broken"
.LC64:
	.string	"pa.lenth:%d,sum:%d\n"
.LC65:
	.string	"bytes_read:%d\n"
.LC66:
	.string	"length:%d,%d`\n"
.LC67:
	.string	"sum:%d,%d\n"
.LC68:
	.string	"send over"
	.text
	.globl	send_o
	.type	send_o, @function
send_o:
.LFB19:
	.loc 1 1262 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2400, %rsp
	movq	%rdi, -2376(%rbp)
	movl	%esi, -2380(%rbp)
	movq	%rdx, -2400(%rbp)
	.loc 1 1262 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1274 0
	movl	$0, -2360(%rbp)
	.loc 1 1280 0
	movl	-2396(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-2064(%rbp), %rcx
	movl	-2380(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2356(%rbp)
	.loc 1 1282 0
	movl	-2356(%rbp), %eax
	cltq
	movb	$0, -2064(%rbp,%rax)
	.loc 1 1284 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rdi
	call	puts
	.loc 1 1286 0
	leaq	-2064(%rbp), %rax
	movl	$420, %edx
	movl	$577, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open
	movl	%eax, -2352(%rbp)
	.loc 1 1288 0
	cmpl	$-1, -2352(%rbp)
	jne	.L181
	.loc 1 1290 0
	movl	$.LC28, %edi
	call	perror
	.loc 1 1291 0
	movl	$-1, %eax
	jmp	.L191
.L181:
	.loc 1 1296 0
	leaq	-2064(%rbp), %rdx
	leaq	-2320(%rbp), %rax
	movl	$.LC60, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 1298 0
	movq	-2376(%rbp), %rdx
	leaq	-2320(%rbp), %rcx
	movl	-2380(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	mysql_record
	.loc 1 1300 0
	movl	$1300, %esi
	movl	$.LC61, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1302 0
	leaq	-2336(%rbp), %rcx
	movl	-2380(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2356(%rbp)
	.loc 1 1304 0
	cmpl	$0, -2356(%rbp)
	jns	.L183
	.loc 1 1306 0
	movl	$.LC62, %edi
	call	perror
	.loc 1 1307 0
	movl	$-1, %eax
	jmp	.L191
.L183:
	.loc 1 1308 0
	cmpl	$0, -2356(%rbp)
	jne	.L184
	.loc 1 1310 0
	movl	$.LC63, %edi
	call	puts
	.loc 1 1311 0
	movl	$-1, %eax
	jmp	.L191
.L184:
	.loc 1 1313 0
	movl	-2336(%rbp), %eax
	cmpl	$24, %eax
	jne	.L185
	.loc 1 1315 0
	movl	-2332(%rbp), %eax
	movl	%eax, -2348(%rbp)
	.loc 1 1317 0
	movl	-2332(%rbp), %eax
	movl	-2360(%rbp), %edx
	movl	%eax, %esi
	movl	$.LC64, %edi
	movl	$0, %eax
	call	printf
.L190:
	.loc 1 1321 0
	leaq	-1040(%rbp), %rcx
	movl	-2380(%rbp), %eax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2344(%rbp)
	.loc 1 1323 0
	movl	-2344(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC65, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1325 0
	movl	-2348(%rbp), %eax
	movl	$1325, %edx
	movl	%eax, %esi
	movl	$.LC66, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1327 0
	cmpl	$0, -2344(%rbp)
	jle	.L190
	.loc 1 1330 0
	movl	-2344(%rbp), %eax
	addl	%eax, -2360(%rbp)
	.loc 1 1332 0
	cmpl	$1023, -2348(%rbp)
	jg	.L187
	.loc 1 1334 0
	movl	-2344(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-1040(%rbp), %rcx
	movl	-2352(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2340(%rbp)
	.loc 1 1336 0
	jmp	.L185
.L187:
	.loc 1 1339 0
	movl	-2344(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-1040(%rbp), %rcx
	movl	-2352(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2340(%rbp)
	.loc 1 1341 0
	cmpl	$-1, -2340(%rbp)
	jne	.L188
	.loc 1 1343 0
	movl	$.LC14, %edi
	call	perror
	.loc 1 1344 0
	movl	$-1, %eax
	jmp	.L191
.L188:
	.loc 1 1345 0
	cmpl	$0, -2340(%rbp)
	je	.L193
	.loc 1 1349 0
	movl	-2360(%rbp), %eax
	movl	$1349, %edx
	movl	%eax, %esi
	movl	$.LC67, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1351 0
	movl	-2360(%rbp), %eax
	cmpl	-2348(%rbp), %eax
	jge	.L194
	.loc 1 1357 0
	jmp	.L190
.L193:
	.loc 1 1347 0
	nop
	jmp	.L185
.L194:
	.loc 1 1354 0
	nop
.L185:
	.loc 1 1360 0
	movl	$.LC68, %edi
	call	puts
	.loc 1 1362 0
	movl	$0, %eax
.L191:
	.loc 1 1363 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L192
	.loc 1 1363 0 is_stmt 0
	call	__stack_chk_fail
.L192:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	send_o, .-send_o
	.section	.rodata
.LC69:
	.string	"name :type :%d\n"
.LC70:
	.string	"show"
	.text
	.globl	name
	.type	name, @function
name:
.LFB20:
	.loc 1 1370 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	.loc 1 1371 0
	movl	-16(%rbp), %eax
	xorb	$-122, %al
	movl	%eax, -16(%rbp)
	.loc 1 1373 0
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC69, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1375 0
	movl	-16(%rbp), %eax
	cmpl	$10, %eax
	jne	.L196
	.loc 1 1377 0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movq	-16(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	order
	.loc 1 1379 0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	show
	jmp	.L197
.L196:
	.loc 1 1381 0
	movl	-16(%rbp), %eax
	cmpl	$11, %eax
	jne	.L198
	.loc 1 1383 0
	movq	-16(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	reg_ok
	jmp	.L197
.L198:
	.loc 1 1385 0
	movl	-16(%rbp), %eax
	cmpl	$21, %eax
	jne	.L199
	.loc 1 1387 0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movl	-20(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	send_o
	.loc 1 1389 0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	show
	jmp	.L197
.L199:
	.loc 1 1391 0
	movl	-16(%rbp), %eax
	cmpl	$31, %eax
	jne	.L200
	.loc 1 1393 0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movl	-20(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	rec_o
	.loc 1 1395 0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	show
	jmp	.L197
.L200:
	.loc 1 1397 0
	movl	-16(%rbp), %eax
	cmpl	$41, %eax
	jne	.L201
	.loc 1 1399 0
	movq	-16(%rbp), %rdx
	movl	-20(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	log_ok
	.loc 1 1401 0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	show
	jmp	.L197
.L201:
	.loc 1 1403 0
	movl	-16(%rbp), %eax
	cmpl	$61, %eax
	jne	.L202
	.loc 1 1406 0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	send_link
	.loc 1 1408 0
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	show
	jmp	.L197
.L202:
	.loc 1 1410 0
	movl	-16(%rbp), %eax
	cmpl	$51, %eax
	jne	.L203
	.loc 1 1413 0
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movl	-20(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	exit_ok
	jmp	.L197
.L203:
	.loc 1 1415 0
	movl	-16(%rbp), %eax
	cmpl	$71, %eax
	jne	.L204
	.loc 1 1418 0
	movl	$.LC70, %edi
	call	puts
	.loc 1 1420 0
	movq	-16(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	show_mysql
	jmp	.L197
.L204:
	.loc 1 1422 0
	movl	-16(%rbp), %eax
	cmpl	$81, %eax
	jne	.L197
	.loc 1 1425 0
	movq	-16(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	record_mysql
.L197:
	.loc 1 1430 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	name, .-name
	.section	.rodata
.LC71:
	.string	"file:%s,%d\n"
.LC72:
	.string	"rb"
.LC73:
	.string	"file not found!"
	.align 8
.LC74:
	.string	"\350\257\245\346\226\207\344\273\266\347\232\204\351\225\277\345\272\246\344\270\272%ld\345\255\227\350\212\202\n"
.LC75:
	.string	"length:%ld,%d\n"
.LC76:
	.string	"fd:%d\n"
.LC77:
	.string	"download %s"
.LC78:
	.string	"read error"
.LC79:
	.string	"read over"
.LC80:
	.string	"ret1:%d\n"
.LC81:
	.string	"rec over"
	.text
	.globl	rec_o
	.type	rec_o, @function
rec_o:
.LFB21:
	.loc 1 1433 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2400, %rsp
	movq	%rdi, -2376(%rbp)
	movl	%esi, -2380(%rbp)
	movq	%rdx, -2400(%rbp)
	.loc 1 1433 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1446 0
	movl	-2396(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-2064(%rbp), %rcx
	movl	-2380(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2364(%rbp)
	.loc 1 1448 0
	movl	-2364(%rbp), %eax
	cltq
	movb	$0, -2064(%rbp,%rax)
	.loc 1 1450 0
	movl	-2396(%rbp), %edx
	leaq	-2064(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC71, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1452 0
	movq	$0, -2344(%rbp)
	.loc 1 1457 0
	leaq	-2064(%rbp), %rax
	movl	$.LC72, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -2344(%rbp)
	.loc 1 1459 0
	cmpq	$0, -2344(%rbp)
	jne	.L206
	.loc 1 1460 0
	movl	$.LC73, %edi
	call	puts
	jmp	.L207
.L206:
	.loc 1 1464 0
	movq	-2344(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek
	.loc 1 1467 0
	movq	-2344(%rbp), %rax
	movq	%rax, %rdi
	call	ftell
	movq	%rax, -2352(%rbp)
	.loc 1 1469 0
	movq	-2352(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC74, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1471 0
	movq	-2344(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L207:
	.loc 1 1474 0
	movq	-2352(%rbp), %rax
	movl	$1474, %edx
	movq	%rax, %rsi
	movl	$.LC75, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1476 0
	leaq	-2064(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open
	movl	%eax, -2360(%rbp)
	.loc 1 1478 0
	cmpl	$0, -2364(%rbp)
	jns	.L208
	.loc 1 1480 0
	movl	$.LC28, %edi
	call	perror
	.loc 1 1481 0
	movl	$-1, %eax
	jmp	.L218
.L208:
	.loc 1 1484 0
	movl	-2360(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC76, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1488 0
	leaq	-2064(%rbp), %rdx
	leaq	-2320(%rbp), %rax
	movl	$.LC77, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 1490 0
	movq	-2376(%rbp), %rdx
	leaq	-2320(%rbp), %rcx
	movl	-2380(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	mysql_record
	.loc 1 1494 0
	movl	$34, -2336(%rbp)
	.loc 1 1496 0
	movq	-2352(%rbp), %rax
	movl	%eax, -2332(%rbp)
	.loc 1 1498 0
	leaq	-2336(%rbp), %rcx
	movl	-2380(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2364(%rbp)
	.loc 1 1500 0
	cmpl	$0, -2364(%rbp)
	jg	.L211
	.loc 1 1502 0
	movl	$.LC14, %edi
	call	perror
	.loc 1 1503 0
	movl	$-1, %eax
	jmp	.L218
.L217:
	.loc 1 1510 0
	leaq	-1040(%rbp), %rcx
	movl	-2360(%rbp), %eax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -2364(%rbp)
	.loc 1 1512 0
	movq	-2352(%rbp), %rax
	movl	$1512, %edx
	movq	%rax, %rsi
	movl	$.LC75, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1515 0
	cmpl	$0, -2364(%rbp)
	jns	.L212
	.loc 1 1517 0
	movl	$.LC78, %edi
	call	puts
	.loc 1 1518 0
	movl	$-1, %eax
	jmp	.L218
.L212:
	.loc 1 1520 0
	cmpl	$0, -2364(%rbp)
	jne	.L213
	.loc 1 1522 0
	movl	$.LC79, %edi
	call	puts
	.loc 1 1523 0
	jmp	.L214
.L213:
	.loc 1 1525 0
	cmpl	$1024, -2364(%rbp)
	jne	.L215
	.loc 1 1528 0
	movl	-2364(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-1040(%rbp), %rcx
	movl	-2380(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2356(%rbp)
	.loc 1 1530 0
	movl	-2356(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC80, %edi
	movl	$0, %eax
	call	printf
	jmp	.L216
.L215:
	.loc 1 1532 0
	movl	-2364(%rbp), %eax
	cltq
	cmpq	-2352(%rbp), %rax
	jne	.L216
	.loc 1 1534 0
	movl	-2364(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-1040(%rbp), %rcx
	movl	-2380(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -2356(%rbp)
	.loc 1 1536 0
	movl	-2356(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC80, %edi
	movl	$0, %eax
	call	printf
.L216:
	.loc 1 1539 0
	movl	-2364(%rbp), %eax
	cltq
	subq	%rax, -2352(%rbp)
.L211:
	.loc 1 1508 0
	cmpq	$0, -2352(%rbp)
	jg	.L217
.L214:
	.loc 1 1543 0
	movl	$.LC81, %edi
	call	puts
	.loc 1 1545 0
	movl	$0, %eax
.L218:
	.loc 1 1546 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L219
	.loc 1 1546 0 is_stmt 0
	call	__stack_chk_fail
.L219:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	rec_o, .-rec_o
	.section	.rodata
.LC82:
	.string	"ret:%d\n"
.LC83:
	.string	"ptr :%s\n"
.LC84:
	.string	"%s>>./.file"
.LC85:
	.string	"system"
.LC86:
	.string	"order: %s"
.LC87:
	.string	"./.file"
.LC88:
	.string	"rm   ./.file  -f"
.LC89:
	.string	"order over"
	.text
	.globl	order
	.type	order, @function
order:
.LFB22:
	.loc 1 1552 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$3408, %rsp
	movq	%rdi, -3384(%rbp)
	movq	%rsi, -3392(%rbp)
	movl	%edx, -3396(%rbp)
	.loc 1 1552 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1562 0
	movq	$0, -3360(%rbp)
	.loc 1 1562 0
	movq	$0, -3352(%rbp)
	.loc 1 1564 0
	movl	$1, -3372(%rbp)
	.loc 1 1566 0
	movl	-3388(%rbp), %eax
	movslq	%eax, %rdx
	leaq	-2064(%rbp), %rcx
	movl	-3396(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -3368(%rbp)
	.loc 1 1568 0
	movl	-3368(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC82, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1570 0
	movl	-3368(%rbp), %eax
	cltq
	movb	$0, -2064(%rbp,%rax)
	.loc 1 1572 0
	leaq	-2064(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC83, %edi
	movl	$0, %eax
	call	printf
	.loc 1 1576 0
	leaq	-2064(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$.LC84, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 1578 0
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	puts
	.loc 1 1580 0
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	system
	movl	%eax, -3368(%rbp)
	.loc 1 1582 0
	cmpl	$0, -3368(%rbp)
	jns	.L221
	.loc 1 1584 0
	movl	$.LC85, %edi
	call	perror
	.loc 1 1585 0
	movl	$-1, %eax
	jmp	.L228
.L221:
	.loc 1 1590 0
	leaq	-2064(%rbp), %rdx
	leaq	-3344(%rbp), %rax
	movl	$.LC86, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	.loc 1 1592 0
	movq	-3384(%rbp), %rdx
	leaq	-3344(%rbp), %rcx
	movl	-3396(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	mysql_record
	.loc 1 1594 0
	movl	$0, %esi
	movl	$.LC87, %edi
	movl	$0, %eax
	call	open
	movl	%eax, -3364(%rbp)
	.loc 1 1595 0
	cmpl	$0, -3368(%rbp)
	jns	.L223
	.loc 1 1597 0
	movl	$.LC28, %edi
	call	perror
	.loc 1 1598 0
	movl	$-1, %eax
	jmp	.L228
.L223:
	.loc 1 1603 0
	leaq	-3088(%rbp), %rcx
	movl	-3364(%rbp), %eax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -3368(%rbp)
	.loc 1 1605 0
	cmpl	$0, -3368(%rbp)
	jns	.L224
	.loc 1 1607 0
	movl	$.LC78, %edi
	call	puts
	.loc 1 1608 0
	movl	$-1, %eax
	jmp	.L228
.L224:
	.loc 1 1609 0
	cmpl	$0, -3368(%rbp)
	jne	.L225
	.loc 1 1611 0
	movl	$8, %edi
	call	malloc
	movq	%rax, -3352(%rbp)
	.loc 1 1613 0
	movq	-3352(%rbp), %rax
	movl	$30, (%rax)
	.loc 1 1615 0
	movq	-3352(%rbp), %rcx
	movl	-3396(%rbp), %eax
	movl	$8, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	.loc 1 1617 0
	jmp	.L226
.L225:
	.loc 1 1620 0
	leaq	-3088(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	addq	$8, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -3360(%rbp)
	.loc 1 1622 0
	movq	-3360(%rbp), %rax
	movl	-3368(%rbp), %edx
	movl	%edx, 4(%rax)
	.loc 1 1624 0
	movq	-3360(%rbp), %rax
	movl	$20, (%rax)
	.loc 1 1626 0
	movl	-3368(%rbp), %eax
	movslq	%eax, %rdx
	movq	-3360(%rbp), %rax
	leaq	8(%rax), %rcx
	leaq	-3088(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy
	.loc 1 1628 0
	movl	-3368(%rbp), %eax
	cltq
	leaq	8(%rax), %rdx
	movq	-3360(%rbp), %rcx
	movl	-3396(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -3368(%rbp)
	.loc 1 1630 0
	cmpl	$-10, -3368(%rbp)
	je	.L230
	.loc 1 1638 0
	jmp	.L223
.L230:
	.loc 1 1632 0
	nop
.L226:
	.loc 1 1640 0
	movl	-3364(%rbp), %eax
	movl	%eax, %edi
	call	close
	.loc 1 1642 0
	movl	$.LC88, %edi
	call	system
	.loc 1 1644 0
	movl	$.LC89, %edi
	call	puts
	.loc 1 1646 0
	movl	$0, %eax
.L228:
	.loc 1 1647 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L229
	.loc 1 1647 0 is_stmt 0
	call	__stack_chk_fail
.L229:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	order, .-order
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/fcntl.h"
	.file 7 "/usr/include/stdint.h"
	.file 8 "/usr/include/time.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/sockaddr.h"
	.file 10 "/usr/include/x86_64-linux-gnu/bits/socket.h"
	.file 11 "/usr/include/netinet/in.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/socket_type.h"
	.file 13 "/usr/include/x86_64-linux-gnu/sys/epoll.h"
	.file 14 "/usr/include/mysql/mysql.h"
	.file 15 "/usr/include/mysql/binary_log_types.h"
	.file 16 "/usr/include/mysql/mysql_com.h"
	.file 17 "/usr/include/mysql/my_list.h"
	.file 18 "/usr/include/mysql/mysql/psi/psi_memory.h"
	.file 19 "/usr/include/mysql/my_alloc.h"
	.file 20 "server/server.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x22a0
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF404
	.byte	0xc
	.long	.LASF405
	.long	.LASF406
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd8
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x83
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x84
	.long	0x69
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x85
	.long	0x62
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x8b
	.long	0x69
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0xab
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x2
	.long	.LASF14
	.byte	0x4
	.byte	0x30
	.long	0xbd
	.uleb128 0x7
	.long	.LASF44
	.byte	0xd8
	.byte	0x5
	.byte	0xf1
	.long	0x23a
	.uleb128 0x8
	.long	.LASF15
	.byte	0x5
	.byte	0xf2
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.byte	0xf7
	.long	0xa5
	.byte	0x8
	.uleb128 0x8
	.long	.LASF17
	.byte	0x5
	.byte	0xf8
	.long	0xa5
	.byte	0x10
	.uleb128 0x8
	.long	.LASF18
	.byte	0x5
	.byte	0xf9
	.long	0xa5
	.byte	0x18
	.uleb128 0x8
	.long	.LASF19
	.byte	0x5
	.byte	0xfa
	.long	0xa5
	.byte	0x20
	.uleb128 0x8
	.long	.LASF20
	.byte	0x5
	.byte	0xfb
	.long	0xa5
	.byte	0x28
	.uleb128 0x8
	.long	.LASF21
	.byte	0x5
	.byte	0xfc
	.long	0xa5
	.byte	0x30
	.uleb128 0x8
	.long	.LASF22
	.byte	0x5
	.byte	0xfd
	.long	0xa5
	.byte	0x38
	.uleb128 0x8
	.long	.LASF23
	.byte	0x5
	.byte	0xfe
	.long	0xa5
	.byte	0x40
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.value	0x100
	.long	0xa5
	.byte	0x48
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.value	0x101
	.long	0xa5
	.byte	0x50
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.value	0x102
	.long	0xa5
	.byte	0x58
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.value	0x104
	.long	0x272
	.byte	0x60
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x106
	.long	0x278
	.byte	0x68
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.value	0x108
	.long	0x62
	.byte	0x70
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.value	0x10c
	.long	0x62
	.byte	0x74
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.value	0x10e
	.long	0x70
	.byte	0x78
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.value	0x112
	.long	0x46
	.byte	0x80
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.value	0x113
	.long	0x54
	.byte	0x82
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.value	0x114
	.long	0x27e
	.byte	0x83
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.value	0x118
	.long	0x28e
	.byte	0x88
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.value	0x121
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.value	0x129
	.long	0xa3
	.byte	0x98
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.value	0x12a
	.long	0xa3
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.value	0x12b
	.long	0xa3
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.value	0x12c
	.long	0xa3
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x5
	.value	0x12e
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF42
	.byte	0x5
	.value	0x12f
	.long	0x62
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF43
	.byte	0x5
	.value	0x131
	.long	0x294
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF407
	.byte	0x5
	.byte	0x96
	.uleb128 0x7
	.long	.LASF45
	.byte	0x18
	.byte	0x5
	.byte	0x9c
	.long	0x272
	.uleb128 0x8
	.long	.LASF46
	.byte	0x5
	.byte	0x9d
	.long	0x272
	.byte	0
	.uleb128 0x8
	.long	.LASF47
	.byte	0x5
	.byte	0x9e
	.long	0x278
	.byte	0x8
	.uleb128 0x8
	.long	.LASF48
	.byte	0x5
	.byte	0xa2
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x241
	.uleb128 0x6
	.byte	0x8
	.long	0xbd
	.uleb128 0xb
	.long	0xab
	.long	0x28e
	.uleb128 0xc
	.long	0x91
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x23a
	.uleb128 0xb
	.long	0xab
	.long	0x2a4
	.uleb128 0xc
	.long	0x91
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2aa
	.uleb128 0xd
	.long	0xab
	.uleb128 0x2
	.long	.LASF49
	.byte	0x6
	.byte	0x45
	.long	0x86
	.uleb128 0x2
	.long	.LASF50
	.byte	0x7
	.byte	0x31
	.long	0x46
	.uleb128 0x2
	.long	.LASF51
	.byte	0x7
	.byte	0x33
	.long	0x4d
	.uleb128 0x2
	.long	.LASF52
	.byte	0x7
	.byte	0x37
	.long	0x38
	.uleb128 0x2
	.long	.LASF53
	.byte	0x8
	.byte	0x4b
	.long	0x98
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF54
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF55
	.uleb128 0xb
	.long	0xab
	.long	0x304
	.uleb128 0xc
	.long	0x91
	.byte	0x1f
	.byte	0
	.uleb128 0xe
	.long	.LASF78
	.byte	0x4
	.long	0x4d
	.byte	0xc
	.byte	0x18
	.long	0x34f
	.uleb128 0xf
	.long	.LASF56
	.byte	0x1
	.uleb128 0xf
	.long	.LASF57
	.byte	0x2
	.uleb128 0xf
	.long	.LASF58
	.byte	0x3
	.uleb128 0xf
	.long	.LASF59
	.byte	0x4
	.uleb128 0xf
	.long	.LASF60
	.byte	0x5
	.uleb128 0xf
	.long	.LASF61
	.byte	0x6
	.uleb128 0xf
	.long	.LASF62
	.byte	0xa
	.uleb128 0x10
	.long	.LASF63
	.long	0x80000
	.uleb128 0x11
	.long	.LASF64
	.value	0x800
	.byte	0
	.uleb128 0x2
	.long	.LASF65
	.byte	0x9
	.byte	0x1c
	.long	0x46
	.uleb128 0x7
	.long	.LASF66
	.byte	0x10
	.byte	0xa
	.byte	0x99
	.long	0x37f
	.uleb128 0x8
	.long	.LASF67
	.byte	0xa
	.byte	0x9b
	.long	0x34f
	.byte	0
	.uleb128 0x8
	.long	.LASF68
	.byte	0xa
	.byte	0x9c
	.long	0x37f
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.long	0xab
	.long	0x38f
	.uleb128 0xc
	.long	0x91
	.byte	0xd
	.byte	0
	.uleb128 0x2
	.long	.LASF69
	.byte	0xb
	.byte	0x1e
	.long	0x2c5
	.uleb128 0x7
	.long	.LASF70
	.byte	0x4
	.byte	0xb
	.byte	0x1f
	.long	0x3b3
	.uleb128 0x8
	.long	.LASF71
	.byte	0xb
	.byte	0x21
	.long	0x38f
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF72
	.byte	0xb
	.byte	0x77
	.long	0x2ba
	.uleb128 0x7
	.long	.LASF73
	.byte	0x10
	.byte	0xb
	.byte	0xef
	.long	0x3fb
	.uleb128 0x8
	.long	.LASF74
	.byte	0xb
	.byte	0xf1
	.long	0x34f
	.byte	0
	.uleb128 0x8
	.long	.LASF75
	.byte	0xb
	.byte	0xf2
	.long	0x3b3
	.byte	0x2
	.uleb128 0x8
	.long	.LASF76
	.byte	0xb
	.byte	0xf3
	.long	0x39a
	.byte	0x4
	.uleb128 0x8
	.long	.LASF77
	.byte	0xb
	.byte	0xf6
	.long	0x3fb
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.long	0x3f
	.long	0x40b
	.uleb128 0xc
	.long	0x91
	.byte	0x7
	.byte	0
	.uleb128 0xe
	.long	.LASF79
	.byte	0x4
	.long	0x4d
	.byte	0xd
	.byte	0x28
	.long	0x47d
	.uleb128 0xf
	.long	.LASF80
	.byte	0x1
	.uleb128 0xf
	.long	.LASF81
	.byte	0x2
	.uleb128 0xf
	.long	.LASF82
	.byte	0x4
	.uleb128 0xf
	.long	.LASF83
	.byte	0x40
	.uleb128 0xf
	.long	.LASF84
	.byte	0x80
	.uleb128 0x11
	.long	.LASF85
	.value	0x100
	.uleb128 0x11
	.long	.LASF86
	.value	0x200
	.uleb128 0x11
	.long	.LASF87
	.value	0x400
	.uleb128 0xf
	.long	.LASF88
	.byte	0x8
	.uleb128 0xf
	.long	.LASF89
	.byte	0x10
	.uleb128 0x11
	.long	.LASF90
	.value	0x2000
	.uleb128 0x10
	.long	.LASF91
	.long	0x20000000
	.uleb128 0x10
	.long	.LASF92
	.long	0x40000000
	.uleb128 0x10
	.long	.LASF93
	.long	0x80000000
	.byte	0
	.uleb128 0x12
	.long	.LASF408
	.byte	0x8
	.byte	0xd
	.byte	0x4f
	.long	0x4b5
	.uleb128 0x13
	.string	"ptr"
	.byte	0xd
	.byte	0x51
	.long	0xa3
	.uleb128 0x13
	.string	"fd"
	.byte	0xd
	.byte	0x52
	.long	0x62
	.uleb128 0x13
	.string	"u32"
	.byte	0xd
	.byte	0x53
	.long	0x2c5
	.uleb128 0x13
	.string	"u64"
	.byte	0xd
	.byte	0x54
	.long	0x2d0
	.byte	0
	.uleb128 0x2
	.long	.LASF94
	.byte	0xd
	.byte	0x55
	.long	0x47d
	.uleb128 0x7
	.long	.LASF95
	.byte	0xc
	.byte	0xd
	.byte	0x57
	.long	0x4e5
	.uleb128 0x8
	.long	.LASF96
	.byte	0xd
	.byte	0x59
	.long	0x2c5
	.byte	0
	.uleb128 0x8
	.long	.LASF97
	.byte	0xd
	.byte	0x5a
	.long	0x4b5
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF98
	.byte	0xe
	.byte	0x31
	.long	0xab
	.uleb128 0x2
	.long	.LASF99
	.byte	0xe
	.byte	0x40
	.long	0x62
	.uleb128 0xe
	.long	.LASF100
	.byte	0x4
	.long	0x4d
	.byte	0xf
	.byte	0x32
	.long	0x5c6
	.uleb128 0xf
	.long	.LASF101
	.byte	0
	.uleb128 0xf
	.long	.LASF102
	.byte	0x1
	.uleb128 0xf
	.long	.LASF103
	.byte	0x2
	.uleb128 0xf
	.long	.LASF104
	.byte	0x3
	.uleb128 0xf
	.long	.LASF105
	.byte	0x4
	.uleb128 0xf
	.long	.LASF106
	.byte	0x5
	.uleb128 0xf
	.long	.LASF107
	.byte	0x6
	.uleb128 0xf
	.long	.LASF108
	.byte	0x7
	.uleb128 0xf
	.long	.LASF109
	.byte	0x8
	.uleb128 0xf
	.long	.LASF110
	.byte	0x9
	.uleb128 0xf
	.long	.LASF111
	.byte	0xa
	.uleb128 0xf
	.long	.LASF112
	.byte	0xb
	.uleb128 0xf
	.long	.LASF113
	.byte	0xc
	.uleb128 0xf
	.long	.LASF114
	.byte	0xd
	.uleb128 0xf
	.long	.LASF115
	.byte	0xe
	.uleb128 0xf
	.long	.LASF116
	.byte	0xf
	.uleb128 0xf
	.long	.LASF117
	.byte	0x10
	.uleb128 0xf
	.long	.LASF118
	.byte	0x11
	.uleb128 0xf
	.long	.LASF119
	.byte	0x12
	.uleb128 0xf
	.long	.LASF120
	.byte	0x13
	.uleb128 0xf
	.long	.LASF121
	.byte	0xf5
	.uleb128 0xf
	.long	.LASF122
	.byte	0xf6
	.uleb128 0xf
	.long	.LASF123
	.byte	0xf7
	.uleb128 0xf
	.long	.LASF124
	.byte	0xf8
	.uleb128 0xf
	.long	.LASF125
	.byte	0xf9
	.uleb128 0xf
	.long	.LASF126
	.byte	0xfa
	.uleb128 0xf
	.long	.LASF127
	.byte	0xfb
	.uleb128 0xf
	.long	.LASF128
	.byte	0xfc
	.uleb128 0xf
	.long	.LASF129
	.byte	0xfd
	.uleb128 0xf
	.long	.LASF130
	.byte	0xfe
	.uleb128 0xf
	.long	.LASF131
	.byte	0xff
	.byte	0
	.uleb128 0x14
	.string	"Vio"
	.byte	0x10
	.value	0x14e
	.long	0x5d2
	.uleb128 0x15
	.long	.LASF245
	.uleb128 0x16
	.long	.LASF132
	.value	0x2a8
	.byte	0x10
	.value	0x158
	.long	0x794
	.uleb128 0x17
	.string	"vio"
	.byte	0x10
	.value	0x159
	.long	0x794
	.byte	0
	.uleb128 0x9
	.long	.LASF133
	.byte	0x10
	.value	0x15a
	.long	0x79a
	.byte	0x8
	.uleb128 0x9
	.long	.LASF134
	.byte	0x10
	.value	0x15a
	.long	0x79a
	.byte	0x10
	.uleb128 0x9
	.long	.LASF135
	.byte	0x10
	.value	0x15a
	.long	0x79a
	.byte	0x18
	.uleb128 0x9
	.long	.LASF136
	.byte	0x10
	.value	0x15a
	.long	0x79a
	.byte	0x20
	.uleb128 0x17
	.string	"fd"
	.byte	0x10
	.value	0x15b
	.long	0x4f0
	.byte	0x28
	.uleb128 0x9
	.long	.LASF137
	.byte	0x10
	.value	0x161
	.long	0x38
	.byte	0x30
	.uleb128 0x9
	.long	.LASF138
	.byte	0x10
	.value	0x161
	.long	0x38
	.byte	0x38
	.uleb128 0x9
	.long	.LASF139
	.byte	0x10
	.value	0x161
	.long	0x38
	.byte	0x40
	.uleb128 0x9
	.long	.LASF140
	.byte	0x10
	.value	0x161
	.long	0x38
	.byte	0x48
	.uleb128 0x9
	.long	.LASF141
	.byte	0x10
	.value	0x162
	.long	0x38
	.byte	0x50
	.uleb128 0x9
	.long	.LASF142
	.byte	0x10
	.value	0x162
	.long	0x38
	.byte	0x58
	.uleb128 0x9
	.long	.LASF143
	.byte	0x10
	.value	0x163
	.long	0x4d
	.byte	0x60
	.uleb128 0x9
	.long	.LASF144
	.byte	0x10
	.value	0x163
	.long	0x4d
	.byte	0x64
	.uleb128 0x9
	.long	.LASF145
	.byte	0x10
	.value	0x164
	.long	0x4d
	.byte	0x68
	.uleb128 0x9
	.long	.LASF146
	.byte	0x10
	.value	0x164
	.long	0x4d
	.byte	0x6c
	.uleb128 0x9
	.long	.LASF147
	.byte	0x10
	.value	0x164
	.long	0x4d
	.byte	0x70
	.uleb128 0x9
	.long	.LASF148
	.byte	0x10
	.value	0x165
	.long	0x62
	.byte	0x74
	.uleb128 0x9
	.long	.LASF149
	.byte	0x10
	.value	0x166
	.long	0x7a0
	.byte	0x78
	.uleb128 0x9
	.long	.LASF150
	.byte	0x10
	.value	0x167
	.long	0x3f
	.byte	0x80
	.uleb128 0x9
	.long	.LASF151
	.byte	0x10
	.value	0x168
	.long	0xab
	.byte	0x81
	.uleb128 0x9
	.long	.LASF152
	.byte	0x10
	.value	0x169
	.long	0x4e5
	.byte	0x82
	.uleb128 0x9
	.long	.LASF153
	.byte	0x10
	.value	0x16a
	.long	0x4e5
	.byte	0x83
	.uleb128 0x9
	.long	.LASF154
	.byte	0x10
	.value	0x16b
	.long	0x4e5
	.byte	0x84
	.uleb128 0x9
	.long	.LASF155
	.byte	0x10
	.value	0x16c
	.long	0x4e5
	.byte	0x85
	.uleb128 0x9
	.long	.LASF156
	.byte	0x10
	.value	0x174
	.long	0x79a
	.byte	0x88
	.uleb128 0x9
	.long	.LASF157
	.byte	0x10
	.value	0x175
	.long	0x4d
	.byte	0x90
	.uleb128 0x9
	.long	.LASF158
	.byte	0x10
	.value	0x176
	.long	0x3f
	.byte	0x94
	.uleb128 0x9
	.long	.LASF159
	.byte	0x10
	.value	0x177
	.long	0x4e5
	.byte	0x95
	.uleb128 0x9
	.long	.LASF160
	.byte	0x10
	.value	0x178
	.long	0x4e5
	.byte	0x96
	.uleb128 0x9
	.long	.LASF161
	.byte	0x10
	.value	0x17a
	.long	0x7a6
	.byte	0x97
	.uleb128 0x18
	.long	.LASF162
	.byte	0x10
	.value	0x17c
	.long	0x7b7
	.value	0x297
	.uleb128 0x18
	.long	.LASF163
	.byte	0x10
	.value	0x185
	.long	0xa3
	.value	0x2a0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5c6
	.uleb128 0x6
	.byte	0x8
	.long	0x3f
	.uleb128 0x6
	.byte	0x8
	.long	0x4d
	.uleb128 0xb
	.long	0xab
	.long	0x7b7
	.uleb128 0x19
	.long	0x91
	.value	0x1ff
	.byte	0
	.uleb128 0xb
	.long	0xab
	.long	0x7c7
	.uleb128 0xc
	.long	0x91
	.byte	0x5
	.byte	0
	.uleb128 0x14
	.string	"NET"
	.byte	0x10
	.value	0x186
	.long	0x5d7
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF164
	.uleb128 0x6
	.byte	0x8
	.long	0xa5
	.uleb128 0x6
	.byte	0x8
	.long	0x38
	.uleb128 0x7
	.long	.LASF165
	.byte	0x18
	.byte	0x11
	.byte	0x23
	.long	0x817
	.uleb128 0x8
	.long	.LASF166
	.byte	0x11
	.byte	0x24
	.long	0x817
	.byte	0
	.uleb128 0x8
	.long	.LASF167
	.byte	0x11
	.byte	0x24
	.long	0x817
	.byte	0x8
	.uleb128 0x8
	.long	.LASF97
	.byte	0x11
	.byte	0x25
	.long	0xa3
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x7e6
	.uleb128 0x2
	.long	.LASF168
	.byte	0x11
	.byte	0x26
	.long	0x7e6
	.uleb128 0x16
	.long	.LASF169
	.value	0x518
	.byte	0xe
	.value	0x110
	.long	0xa81
	.uleb128 0x17
	.string	"net"
	.byte	0xe
	.value	0x112
	.long	0x7c7
	.byte	0
	.uleb128 0x18
	.long	.LASF170
	.byte	0xe
	.value	0x113
	.long	0x79a
	.value	0x2a8
	.uleb128 0x18
	.long	.LASF171
	.byte	0xe
	.value	0x114
	.long	0xa5
	.value	0x2b0
	.uleb128 0x18
	.long	.LASF172
	.byte	0xe
	.value	0x114
	.long	0xa5
	.value	0x2b8
	.uleb128 0x18
	.long	.LASF173
	.byte	0xe
	.value	0x114
	.long	0xa5
	.value	0x2c0
	.uleb128 0x18
	.long	.LASF174
	.byte	0xe
	.value	0x114
	.long	0xa5
	.value	0x2c8
	.uleb128 0x18
	.long	.LASF175
	.byte	0xe
	.value	0x114
	.long	0xa5
	.value	0x2d0
	.uleb128 0x18
	.long	.LASF176
	.byte	0xe
	.value	0x114
	.long	0xa5
	.value	0x2d8
	.uleb128 0x18
	.long	.LASF177
	.byte	0xe
	.value	0x115
	.long	0xa5
	.value	0x2e0
	.uleb128 0x1a
	.string	"db"
	.byte	0xe
	.value	0x115
	.long	0xa5
	.value	0x2e8
	.uleb128 0x18
	.long	.LASF178
	.byte	0xe
	.value	0x116
	.long	0x111b
	.value	0x2f0
	.uleb128 0x18
	.long	.LASF179
	.byte	0xe
	.value	0x117
	.long	0x1121
	.value	0x2f8
	.uleb128 0x18
	.long	.LASF180
	.byte	0xe
	.value	0x118
	.long	0xca1
	.value	0x300
	.uleb128 0x18
	.long	.LASF181
	.byte	0xe
	.value	0x119
	.long	0xb9f
	.value	0x358
	.uleb128 0x18
	.long	.LASF182
	.byte	0xe
	.value	0x11a
	.long	0xb9f
	.value	0x360
	.uleb128 0x18
	.long	.LASF183
	.byte	0xe
	.value	0x11b
	.long	0xb9f
	.value	0x368
	.uleb128 0x18
	.long	.LASF184
	.byte	0xe
	.value	0x11c
	.long	0x38
	.value	0x370
	.uleb128 0x18
	.long	.LASF185
	.byte	0xe
	.value	0x11d
	.long	0x38
	.value	0x378
	.uleb128 0x18
	.long	.LASF186
	.byte	0xe
	.value	0x11e
	.long	0x4d
	.value	0x380
	.uleb128 0x18
	.long	.LASF187
	.byte	0xe
	.value	0x11f
	.long	0x38
	.value	0x388
	.uleb128 0x18
	.long	.LASF188
	.byte	0xe
	.value	0x11f
	.long	0x38
	.value	0x390
	.uleb128 0x18
	.long	.LASF189
	.byte	0xe
	.value	0x120
	.long	0x4d
	.value	0x398
	.uleb128 0x18
	.long	.LASF190
	.byte	0xe
	.value	0x121
	.long	0x4d
	.value	0x39c
	.uleb128 0x18
	.long	.LASF191
	.byte	0xe
	.value	0x122
	.long	0x4d
	.value	0x3a0
	.uleb128 0x18
	.long	.LASF192
	.byte	0xe
	.value	0x123
	.long	0x4d
	.value	0x3a4
	.uleb128 0x18
	.long	.LASF193
	.byte	0xe
	.value	0x124
	.long	0x4d
	.value	0x3a8
	.uleb128 0x18
	.long	.LASF194
	.byte	0xe
	.value	0x125
	.long	0xe97
	.value	0x3b0
	.uleb128 0x18
	.long	.LASF195
	.byte	0xe
	.value	0x126
	.long	0x10ed
	.value	0x4a8
	.uleb128 0x18
	.long	.LASF196
	.byte	0xe
	.value	0x127
	.long	0x4e5
	.value	0x4ac
	.uleb128 0x18
	.long	.LASF197
	.byte	0xe
	.value	0x128
	.long	0x4e5
	.value	0x4ad
	.uleb128 0x18
	.long	.LASF198
	.byte	0xe
	.value	0x12b
	.long	0x1127
	.value	0x4ae
	.uleb128 0x18
	.long	.LASF152
	.byte	0xe
	.value	0x12c
	.long	0x4e5
	.value	0x4c3
	.uleb128 0x18
	.long	.LASF153
	.byte	0xe
	.value	0x12d
	.long	0xa3
	.value	0x4c8
	.uleb128 0x18
	.long	.LASF155
	.byte	0xe
	.value	0x12d
	.long	0xa3
	.value	0x4d0
	.uleb128 0x18
	.long	.LASF159
	.byte	0xe
	.value	0x12d
	.long	0xa3
	.value	0x4d8
	.uleb128 0x18
	.long	.LASF160
	.byte	0xe
	.value	0x12d
	.long	0xa3
	.value	0x4e0
	.uleb128 0x18
	.long	.LASF199
	.byte	0xe
	.value	0x12f
	.long	0x1137
	.value	0x4e8
	.uleb128 0x18
	.long	.LASF200
	.byte	0xe
	.value	0x130
	.long	0x1142
	.value	0x4f0
	.uleb128 0x1a
	.string	"thd"
	.byte	0xe
	.value	0x131
	.long	0xa3
	.value	0x4f8
	.uleb128 0x18
	.long	.LASF201
	.byte	0xe
	.value	0x136
	.long	0x114d
	.value	0x500
	.uleb128 0x18
	.long	.LASF202
	.byte	0xe
	.value	0x138
	.long	0xa5
	.value	0x508
	.uleb128 0x18
	.long	.LASF163
	.byte	0xe
	.value	0x139
	.long	0xa3
	.value	0x510
	.byte	0
	.uleb128 0x7
	.long	.LASF203
	.byte	0x80
	.byte	0xe
	.byte	0x5f
	.long	0xb89
	.uleb128 0x8
	.long	.LASF204
	.byte	0xe
	.byte	0x60
	.long	0xa5
	.byte	0
	.uleb128 0x8
	.long	.LASF205
	.byte	0xe
	.byte	0x61
	.long	0xa5
	.byte	0x8
	.uleb128 0x8
	.long	.LASF206
	.byte	0xe
	.byte	0x62
	.long	0xa5
	.byte	0x10
	.uleb128 0x8
	.long	.LASF207
	.byte	0xe
	.byte	0x63
	.long	0xa5
	.byte	0x18
	.uleb128 0x1b
	.string	"db"
	.byte	0xe
	.byte	0x64
	.long	0xa5
	.byte	0x20
	.uleb128 0x8
	.long	.LASF208
	.byte	0xe
	.byte	0x65
	.long	0xa5
	.byte	0x28
	.uleb128 0x1b
	.string	"def"
	.byte	0xe
	.byte	0x66
	.long	0xa5
	.byte	0x30
	.uleb128 0x8
	.long	.LASF138
	.byte	0xe
	.byte	0x67
	.long	0x38
	.byte	0x38
	.uleb128 0x8
	.long	.LASF209
	.byte	0xe
	.byte	0x68
	.long	0x38
	.byte	0x40
	.uleb128 0x8
	.long	.LASF210
	.byte	0xe
	.byte	0x69
	.long	0x4d
	.byte	0x48
	.uleb128 0x8
	.long	.LASF211
	.byte	0xe
	.byte	0x6a
	.long	0x4d
	.byte	0x4c
	.uleb128 0x8
	.long	.LASF212
	.byte	0xe
	.byte	0x6b
	.long	0x4d
	.byte	0x50
	.uleb128 0x8
	.long	.LASF213
	.byte	0xe
	.byte	0x6c
	.long	0x4d
	.byte	0x54
	.uleb128 0x8
	.long	.LASF214
	.byte	0xe
	.byte	0x6d
	.long	0x4d
	.byte	0x58
	.uleb128 0x8
	.long	.LASF215
	.byte	0xe
	.byte	0x6e
	.long	0x4d
	.byte	0x5c
	.uleb128 0x8
	.long	.LASF216
	.byte	0xe
	.byte	0x6f
	.long	0x4d
	.byte	0x60
	.uleb128 0x8
	.long	.LASF217
	.byte	0xe
	.byte	0x70
	.long	0x4d
	.byte	0x64
	.uleb128 0x8
	.long	.LASF218
	.byte	0xe
	.byte	0x71
	.long	0x4d
	.byte	0x68
	.uleb128 0x8
	.long	.LASF219
	.byte	0xe
	.byte	0x72
	.long	0x4d
	.byte	0x6c
	.uleb128 0x8
	.long	.LASF220
	.byte	0xe
	.byte	0x73
	.long	0x4fb
	.byte	0x70
	.uleb128 0x8
	.long	.LASF163
	.byte	0xe
	.byte	0x74
	.long	0xa3
	.byte	0x78
	.byte	0
	.uleb128 0x2
	.long	.LASF221
	.byte	0xe
	.byte	0x75
	.long	0xa81
	.uleb128 0x2
	.long	.LASF222
	.byte	0xe
	.byte	0x77
	.long	0x7da
	.uleb128 0x2
	.long	.LASF223
	.byte	0xe
	.byte	0x7e
	.long	0x2e6
	.uleb128 0x2
	.long	.LASF224
	.byte	0x12
	.byte	0x3d
	.long	0x4d
	.uleb128 0x7
	.long	.LASF225
	.byte	0x10
	.byte	0x13
	.byte	0x2d
	.long	0xbe6
	.uleb128 0x8
	.long	.LASF167
	.byte	0x13
	.byte	0x2f
	.long	0xbe6
	.byte	0
	.uleb128 0x8
	.long	.LASF226
	.byte	0x13
	.byte	0x30
	.long	0x4d
	.byte	0x8
	.uleb128 0x8
	.long	.LASF227
	.byte	0x13
	.byte	0x31
	.long	0x4d
	.byte	0xc
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xbb5
	.uleb128 0x2
	.long	.LASF228
	.byte	0x13
	.byte	0x32
	.long	0xbb5
	.uleb128 0x7
	.long	.LASF229
	.byte	0x58
	.byte	0x13
	.byte	0x35
	.long	0xc94
	.uleb128 0x8
	.long	.LASF230
	.byte	0x13
	.byte	0x37
	.long	0xc94
	.byte	0
	.uleb128 0x8
	.long	.LASF231
	.byte	0x13
	.byte	0x38
	.long	0xc94
	.byte	0x8
	.uleb128 0x8
	.long	.LASF232
	.byte	0x13
	.byte	0x39
	.long	0xc94
	.byte	0x10
	.uleb128 0x8
	.long	.LASF233
	.byte	0x13
	.byte	0x3b
	.long	0x2d
	.byte	0x18
	.uleb128 0x8
	.long	.LASF234
	.byte	0x13
	.byte	0x3c
	.long	0x2d
	.byte	0x20
	.uleb128 0x8
	.long	.LASF235
	.byte	0x13
	.byte	0x3d
	.long	0x4d
	.byte	0x28
	.uleb128 0x8
	.long	.LASF236
	.byte	0x13
	.byte	0x42
	.long	0x4d
	.byte	0x2c
	.uleb128 0x8
	.long	.LASF237
	.byte	0x13
	.byte	0x48
	.long	0x2d
	.byte	0x30
	.uleb128 0x8
	.long	.LASF238
	.byte	0x13
	.byte	0x4c
	.long	0x2d
	.byte	0x38
	.uleb128 0x8
	.long	.LASF239
	.byte	0x13
	.byte	0x4f
	.long	0x4e5
	.byte	0x40
	.uleb128 0x8
	.long	.LASF240
	.byte	0x13
	.byte	0x51
	.long	0xc9b
	.byte	0x48
	.uleb128 0x8
	.long	.LASF241
	.byte	0x13
	.byte	0x53
	.long	0xbaa
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xbec
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0x8
	.long	0xc9a
	.uleb128 0x2
	.long	.LASF242
	.byte	0x13
	.byte	0x54
	.long	0xbf7
	.uleb128 0x7
	.long	.LASF243
	.byte	0x18
	.byte	0xe
	.byte	0x89
	.long	0xcdd
	.uleb128 0x8
	.long	.LASF167
	.byte	0xe
	.byte	0x8a
	.long	0xcdd
	.byte	0
	.uleb128 0x8
	.long	.LASF97
	.byte	0xe
	.byte	0x8b
	.long	0xb94
	.byte	0x8
	.uleb128 0x8
	.long	.LASF138
	.byte	0xe
	.byte	0x8c
	.long	0x38
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xcac
	.uleb128 0x2
	.long	.LASF244
	.byte	0xe
	.byte	0x8d
	.long	0xcac
	.uleb128 0x6
	.byte	0x8
	.long	0xce3
	.uleb128 0x15
	.long	.LASF246
	.uleb128 0x7
	.long	.LASF247
	.byte	0x80
	.byte	0xe
	.byte	0x94
	.long	0xd4e
	.uleb128 0x8
	.long	.LASF97
	.byte	0xe
	.byte	0x95
	.long	0xcee
	.byte	0
	.uleb128 0x8
	.long	.LASF248
	.byte	0xe
	.byte	0x96
	.long	0xd4e
	.byte	0x8
	.uleb128 0x8
	.long	.LASF249
	.byte	0xe
	.byte	0x97
	.long	0xca1
	.byte	0x10
	.uleb128 0x8
	.long	.LASF250
	.byte	0xe
	.byte	0x98
	.long	0xb9f
	.byte	0x68
	.uleb128 0x8
	.long	.LASF179
	.byte	0xe
	.byte	0x99
	.long	0x4d
	.byte	0x70
	.uleb128 0x8
	.long	.LASF163
	.byte	0xe
	.byte	0x9b
	.long	0xa3
	.byte	0x78
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xcf4
	.uleb128 0x2
	.long	.LASF251
	.byte	0xe
	.byte	0x9c
	.long	0xcf9
	.uleb128 0xe
	.long	.LASF252
	.byte	0x4
	.long	0x4d
	.byte	0xe
	.byte	0x9e
	.long	0xe78
	.uleb128 0xf
	.long	.LASF253
	.byte	0
	.uleb128 0xf
	.long	.LASF254
	.byte	0x1
	.uleb128 0xf
	.long	.LASF255
	.byte	0x2
	.uleb128 0xf
	.long	.LASF256
	.byte	0x3
	.uleb128 0xf
	.long	.LASF257
	.byte	0x4
	.uleb128 0xf
	.long	.LASF258
	.byte	0x5
	.uleb128 0xf
	.long	.LASF259
	.byte	0x6
	.uleb128 0xf
	.long	.LASF260
	.byte	0x7
	.uleb128 0xf
	.long	.LASF261
	.byte	0x8
	.uleb128 0xf
	.long	.LASF262
	.byte	0x9
	.uleb128 0xf
	.long	.LASF263
	.byte	0xa
	.uleb128 0xf
	.long	.LASF264
	.byte	0xb
	.uleb128 0xf
	.long	.LASF265
	.byte	0xc
	.uleb128 0xf
	.long	.LASF266
	.byte	0xd
	.uleb128 0xf
	.long	.LASF267
	.byte	0xe
	.uleb128 0xf
	.long	.LASF268
	.byte	0xf
	.uleb128 0xf
	.long	.LASF269
	.byte	0x10
	.uleb128 0xf
	.long	.LASF270
	.byte	0x11
	.uleb128 0xf
	.long	.LASF271
	.byte	0x12
	.uleb128 0xf
	.long	.LASF272
	.byte	0x13
	.uleb128 0xf
	.long	.LASF273
	.byte	0x14
	.uleb128 0xf
	.long	.LASF274
	.byte	0x15
	.uleb128 0xf
	.long	.LASF275
	.byte	0x16
	.uleb128 0xf
	.long	.LASF276
	.byte	0x17
	.uleb128 0xf
	.long	.LASF277
	.byte	0x18
	.uleb128 0xf
	.long	.LASF278
	.byte	0x19
	.uleb128 0xf
	.long	.LASF279
	.byte	0x1a
	.uleb128 0xf
	.long	.LASF280
	.byte	0x1b
	.uleb128 0xf
	.long	.LASF281
	.byte	0x1c
	.uleb128 0xf
	.long	.LASF282
	.byte	0x1d
	.uleb128 0xf
	.long	.LASF283
	.byte	0x1e
	.uleb128 0xf
	.long	.LASF284
	.byte	0x1f
	.uleb128 0xf
	.long	.LASF285
	.byte	0x20
	.uleb128 0xf
	.long	.LASF286
	.byte	0x21
	.uleb128 0xf
	.long	.LASF287
	.byte	0x22
	.uleb128 0xf
	.long	.LASF288
	.byte	0x23
	.uleb128 0xf
	.long	.LASF289
	.byte	0x24
	.uleb128 0xf
	.long	.LASF290
	.byte	0x25
	.uleb128 0xf
	.long	.LASF291
	.byte	0x26
	.uleb128 0xf
	.long	.LASF292
	.byte	0x27
	.uleb128 0xf
	.long	.LASF293
	.byte	0x28
	.uleb128 0xf
	.long	.LASF294
	.byte	0x29
	.uleb128 0xf
	.long	.LASF295
	.byte	0x2a
	.uleb128 0xf
	.long	.LASF296
	.byte	0x2b
	.byte	0
	.uleb128 0x1d
	.byte	0x8
	.byte	0xe
	.byte	0xd4
	.long	0xe97
	.uleb128 0x1e
	.long	.LASF297
	.byte	0xe
	.byte	0xda
	.long	0xa5
	.uleb128 0x1e
	.long	.LASF298
	.byte	0xe
	.byte	0xe0
	.long	0xa5
	.byte	0
	.uleb128 0x7
	.long	.LASF299
	.byte	0xf8
	.byte	0xe
	.byte	0xbf
	.long	0x1082
	.uleb128 0x8
	.long	.LASF300
	.byte	0xe
	.byte	0xc0
	.long	0x4d
	.byte	0
	.uleb128 0x8
	.long	.LASF146
	.byte	0xe
	.byte	0xc0
	.long	0x4d
	.byte	0x4
	.uleb128 0x8
	.long	.LASF145
	.byte	0xe
	.byte	0xc0
	.long	0x4d
	.byte	0x8
	.uleb128 0x8
	.long	.LASF186
	.byte	0xe
	.byte	0xc1
	.long	0x4d
	.byte	0xc
	.uleb128 0x8
	.long	.LASF301
	.byte	0xe
	.byte	0xc1
	.long	0x4d
	.byte	0x10
	.uleb128 0x8
	.long	.LASF187
	.byte	0xe
	.byte	0xc2
	.long	0x38
	.byte	0x18
	.uleb128 0x8
	.long	.LASF171
	.byte	0xe
	.byte	0xc3
	.long	0xa5
	.byte	0x20
	.uleb128 0x8
	.long	.LASF172
	.byte	0xe
	.byte	0xc3
	.long	0xa5
	.byte	0x28
	.uleb128 0x8
	.long	.LASF302
	.byte	0xe
	.byte	0xc3
	.long	0xa5
	.byte	0x30
	.uleb128 0x8
	.long	.LASF174
	.byte	0xe
	.byte	0xc3
	.long	0xa5
	.byte	0x38
	.uleb128 0x1b
	.string	"db"
	.byte	0xe
	.byte	0xc3
	.long	0xa5
	.byte	0x40
	.uleb128 0x8
	.long	.LASF303
	.byte	0xe
	.byte	0xc4
	.long	0x1087
	.byte	0x48
	.uleb128 0x8
	.long	.LASF304
	.byte	0xe
	.byte	0xc5
	.long	0xa5
	.byte	0x50
	.uleb128 0x8
	.long	.LASF305
	.byte	0xe
	.byte	0xc5
	.long	0xa5
	.byte	0x58
	.uleb128 0x8
	.long	.LASF306
	.byte	0xe
	.byte	0xc5
	.long	0xa5
	.byte	0x60
	.uleb128 0x8
	.long	.LASF307
	.byte	0xe
	.byte	0xc5
	.long	0xa5
	.byte	0x68
	.uleb128 0x8
	.long	.LASF308
	.byte	0xe
	.byte	0xc6
	.long	0xa5
	.byte	0x70
	.uleb128 0x8
	.long	.LASF309
	.byte	0xe
	.byte	0xc7
	.long	0xa5
	.byte	0x78
	.uleb128 0x8
	.long	.LASF310
	.byte	0xe
	.byte	0xc8
	.long	0xa5
	.byte	0x80
	.uleb128 0x8
	.long	.LASF311
	.byte	0xe
	.byte	0xc9
	.long	0xa5
	.byte	0x88
	.uleb128 0x8
	.long	.LASF312
	.byte	0xe
	.byte	0xca
	.long	0xa5
	.byte	0x90
	.uleb128 0x8
	.long	.LASF313
	.byte	0xe
	.byte	0xcb
	.long	0xa5
	.byte	0x98
	.uleb128 0x8
	.long	.LASF314
	.byte	0xe
	.byte	0xcc
	.long	0x38
	.byte	0xa0
	.uleb128 0x8
	.long	.LASF315
	.byte	0xe
	.byte	0xcd
	.long	0x4e5
	.byte	0xa8
	.uleb128 0x8
	.long	.LASF154
	.byte	0xe
	.byte	0xce
	.long	0x4e5
	.byte	0xa9
	.uleb128 0x8
	.long	.LASF316
	.byte	0xe
	.byte	0xce
	.long	0x4e5
	.byte	0xaa
	.uleb128 0x8
	.long	.LASF152
	.byte	0xe
	.byte	0xcf
	.long	0x4e5
	.byte	0xab
	.uleb128 0x8
	.long	.LASF153
	.byte	0xe
	.byte	0xd0
	.long	0x4e5
	.byte	0xac
	.uleb128 0x8
	.long	.LASF155
	.byte	0xe
	.byte	0xd1
	.long	0x4e5
	.byte	0xad
	.uleb128 0x8
	.long	.LASF159
	.byte	0xe
	.byte	0xd2
	.long	0x4e5
	.byte	0xae
	.uleb128 0x8
	.long	.LASF317
	.byte	0xe
	.byte	0xd3
	.long	0xd5f
	.byte	0xb0
	.uleb128 0x1b
	.string	"ci"
	.byte	0xe
	.byte	0xe1
	.long	0xe78
	.byte	0xb8
	.uleb128 0x8
	.long	.LASF160
	.byte	0xe
	.byte	0xe2
	.long	0x4e5
	.byte	0xc0
	.uleb128 0x8
	.long	.LASF318
	.byte	0xe
	.byte	0xe4
	.long	0x4e5
	.byte	0xc1
	.uleb128 0x8
	.long	.LASF319
	.byte	0xe
	.byte	0xe7
	.long	0x10ac
	.byte	0xc8
	.uleb128 0x8
	.long	.LASF320
	.byte	0xe
	.byte	0xe8
	.long	0x10cb
	.byte	0xd0
	.uleb128 0x8
	.long	.LASF321
	.byte	0xe
	.byte	0xe9
	.long	0x10dc
	.byte	0xd8
	.uleb128 0x8
	.long	.LASF322
	.byte	0xe
	.byte	0xea
	.long	0x10cb
	.byte	0xe0
	.uleb128 0x8
	.long	.LASF323
	.byte	0xe
	.byte	0xeb
	.long	0xa3
	.byte	0xe8
	.uleb128 0x8
	.long	.LASF163
	.byte	0xe
	.byte	0xec
	.long	0x10e7
	.byte	0xf0
	.byte	0
	.uleb128 0x15
	.long	.LASF324
	.uleb128 0x6
	.byte	0x8
	.long	0x1082
	.uleb128 0x1f
	.long	0x62
	.long	0x10a6
	.uleb128 0x20
	.long	0x10a6
	.uleb128 0x20
	.long	0x2a4
	.uleb128 0x20
	.long	0xa3
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xa3
	.uleb128 0x6
	.byte	0x8
	.long	0x108d
	.uleb128 0x1f
	.long	0x62
	.long	0x10cb
	.uleb128 0x20
	.long	0xa3
	.uleb128 0x20
	.long	0xa5
	.uleb128 0x20
	.long	0x4d
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x10b2
	.uleb128 0x21
	.long	0x10dc
	.uleb128 0x20
	.long	0xa3
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x10d1
	.uleb128 0x15
	.long	.LASF325
	.uleb128 0x6
	.byte	0x8
	.long	0x10e2
	.uleb128 0xe
	.long	.LASF326
	.byte	0x4
	.long	0x4d
	.byte	0xe
	.byte	0xef
	.long	0x1116
	.uleb128 0xf
	.long	.LASF327
	.byte	0
	.uleb128 0xf
	.long	.LASF328
	.byte	0x1
	.uleb128 0xf
	.long	.LASF329
	.byte	0x2
	.uleb128 0xf
	.long	.LASF330
	.byte	0x3
	.byte	0
	.uleb128 0x15
	.long	.LASF331
	.uleb128 0x6
	.byte	0x8
	.long	0x1116
	.uleb128 0x6
	.byte	0x8
	.long	0xb89
	.uleb128 0xb
	.long	0xab
	.long	0x1137
	.uleb128 0xc
	.long	0x91
	.byte	0x14
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x81d
	.uleb128 0x15
	.long	.LASF332
	.uleb128 0x6
	.byte	0x8
	.long	0x1148
	.uleb128 0xd
	.long	0x113d
	.uleb128 0x6
	.byte	0x8
	.long	0x4e5
	.uleb128 0x22
	.long	.LASF333
	.byte	0xe
	.value	0x13a
	.long	0x828
	.uleb128 0x23
	.long	.LASF334
	.byte	0xb8
	.byte	0xe
	.value	0x13d
	.long	0x1230
	.uleb128 0x9
	.long	.LASF335
	.byte	0xe
	.value	0x13e
	.long	0xb9f
	.byte	0
	.uleb128 0x9
	.long	.LASF179
	.byte	0xe
	.value	0x13f
	.long	0x1121
	.byte	0x8
	.uleb128 0x9
	.long	.LASF97
	.byte	0xe
	.value	0x140
	.long	0x1230
	.byte	0x10
	.uleb128 0x9
	.long	.LASF336
	.byte	0xe
	.value	0x141
	.long	0xcee
	.byte	0x18
	.uleb128 0x9
	.long	.LASF337
	.byte	0xe
	.value	0x142
	.long	0x7e0
	.byte	0x20
	.uleb128 0x9
	.long	.LASF338
	.byte	0xe
	.value	0x143
	.long	0x1236
	.byte	0x28
	.uleb128 0x9
	.long	.LASF200
	.byte	0xe
	.value	0x144
	.long	0x1142
	.byte	0x30
	.uleb128 0x17
	.string	"row"
	.byte	0xe
	.value	0x145
	.long	0xb94
	.byte	0x38
	.uleb128 0x9
	.long	.LASF339
	.byte	0xe
	.value	0x146
	.long	0xb94
	.byte	0x40
	.uleb128 0x9
	.long	.LASF180
	.byte	0xe
	.value	0x147
	.long	0xca1
	.byte	0x48
	.uleb128 0x9
	.long	.LASF190
	.byte	0xe
	.value	0x148
	.long	0x4d
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF340
	.byte	0xe
	.value	0x148
	.long	0x4d
	.byte	0xa4
	.uleb128 0x17
	.string	"eof"
	.byte	0xe
	.value	0x149
	.long	0x4e5
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF341
	.byte	0xe
	.value	0x14b
	.long	0x4e5
	.byte	0xa9
	.uleb128 0x9
	.long	.LASF163
	.byte	0xe
	.value	0x14c
	.long	0xa3
	.byte	0xb0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xd54
	.uleb128 0x6
	.byte	0x8
	.long	0x1153
	.uleb128 0x22
	.long	.LASF342
	.byte	0xe
	.value	0x14d
	.long	0x115f
	.uleb128 0x24
	.string	"tm"
	.byte	0x38
	.byte	0x8
	.byte	0x85
	.long	0x12d8
	.uleb128 0x8
	.long	.LASF343
	.byte	0x8
	.byte	0x87
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF344
	.byte	0x8
	.byte	0x88
	.long	0x62
	.byte	0x4
	.uleb128 0x8
	.long	.LASF345
	.byte	0x8
	.byte	0x89
	.long	0x62
	.byte	0x8
	.uleb128 0x8
	.long	.LASF346
	.byte	0x8
	.byte	0x8a
	.long	0x62
	.byte	0xc
	.uleb128 0x8
	.long	.LASF347
	.byte	0x8
	.byte	0x8b
	.long	0x62
	.byte	0x10
	.uleb128 0x8
	.long	.LASF348
	.byte	0x8
	.byte	0x8c
	.long	0x62
	.byte	0x14
	.uleb128 0x8
	.long	.LASF349
	.byte	0x8
	.byte	0x8d
	.long	0x62
	.byte	0x18
	.uleb128 0x8
	.long	.LASF350
	.byte	0x8
	.byte	0x8e
	.long	0x62
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF351
	.byte	0x8
	.byte	0x8f
	.long	0x62
	.byte	0x20
	.uleb128 0x8
	.long	.LASF352
	.byte	0x8
	.byte	0x92
	.long	0x69
	.byte	0x28
	.uleb128 0x8
	.long	.LASF353
	.byte	0x8
	.byte	0x93
	.long	0x2a4
	.byte	0x30
	.byte	0
	.uleb128 0x7
	.long	.LASF354
	.byte	0x44
	.byte	0x14
	.byte	0x49
	.long	0x1309
	.uleb128 0x8
	.long	.LASF204
	.byte	0x14
	.byte	0x4b
	.long	0x2f4
	.byte	0
	.uleb128 0x1b
	.string	"num"
	.byte	0x14
	.byte	0x4c
	.long	0x62
	.byte	0x20
	.uleb128 0x8
	.long	.LASF173
	.byte	0x14
	.byte	0x4d
	.long	0x2f4
	.byte	0x24
	.byte	0
	.uleb128 0x7
	.long	.LASF355
	.byte	0x78
	.byte	0x14
	.byte	0x51
	.long	0x135d
	.uleb128 0x1b
	.string	"num"
	.byte	0x14
	.byte	0x53
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF173
	.byte	0x14
	.byte	0x54
	.long	0x2f4
	.byte	0x4
	.uleb128 0x1b
	.string	"cfd"
	.byte	0x14
	.byte	0x55
	.long	0x62
	.byte	0x24
	.uleb128 0x8
	.long	.LASF186
	.byte	0x14
	.byte	0x56
	.long	0x62
	.byte	0x28
	.uleb128 0x1b
	.string	"ip"
	.byte	0x14
	.byte	0x57
	.long	0x135d
	.byte	0x2c
	.uleb128 0x8
	.long	.LASF167
	.byte	0x14
	.byte	0x58
	.long	0x136d
	.byte	0x70
	.byte	0
	.uleb128 0xb
	.long	0xab
	.long	0x136d
	.uleb128 0xc
	.long	0x91
	.byte	0x3f
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x1309
	.uleb128 0x7
	.long	.LASF356
	.byte	0x8
	.byte	0x14
	.byte	0x5b
	.long	0x13a4
	.uleb128 0x8
	.long	.LASF220
	.byte	0x14
	.byte	0x5d
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF357
	.byte	0x14
	.byte	0x5e
	.long	0x62
	.byte	0x4
	.uleb128 0x8
	.long	.LASF97
	.byte	0x14
	.byte	0x5f
	.long	0x13a4
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.long	0xab
	.long	0x13b3
	.uleb128 0x25
	.long	0x91
	.byte	0
	.uleb128 0x26
	.long	.LASF358
	.value	0x404
	.byte	0x14
	.byte	0x63
	.long	0x13d9
	.uleb128 0x8
	.long	.LASF357
	.byte	0x14
	.byte	0x65
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF133
	.byte	0x14
	.byte	0x66
	.long	0x13d9
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.long	0xab
	.long	0x13ea
	.uleb128 0x19
	.long	0x91
	.value	0x3ff
	.byte	0
	.uleb128 0x7
	.long	.LASF359
	.byte	0x8
	.byte	0x14
	.byte	0x6b
	.long	0x140f
	.uleb128 0x1b
	.string	"row"
	.byte	0x14
	.byte	0x6d
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF179
	.byte	0x14
	.byte	0x6e
	.long	0x62
	.byte	0x4
	.byte	0
	.uleb128 0x27
	.long	.LASF409
	.byte	0x1
	.byte	0x7
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1449
	.uleb128 0x28
	.string	"pid"
	.byte	0x1
	.byte	0x9
	.long	0x2af
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x29
	.long	.LASF360
	.byte	0x1
	.byte	0x17
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2a
	.long	.LASF366
	.byte	0x1
	.byte	0x26
	.long	0x62
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x1574
	.uleb128 0x2b
	.string	"cfd"
	.byte	0x1
	.byte	0x26
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2212
	.uleb128 0x2b
	.string	"p"
	.byte	0x1
	.byte	0x26
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2224
	.uleb128 0x28
	.string	"ret"
	.byte	0x1
	.byte	0x2b
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2180
	.uleb128 0x28
	.string	"pa"
	.byte	0x1
	.byte	0x2d
	.long	0x1574
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2168
	.uleb128 0x29
	.long	.LASF204
	.byte	0x1
	.byte	0x2f
	.long	0x2f4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1088
	.uleb128 0x28
	.string	"sql"
	.byte	0x1
	.byte	0x41
	.long	0x2a4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2160
	.uleb128 0x28
	.string	"res"
	.byte	0x1
	.byte	0x43
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2192
	.uleb128 0x29
	.long	.LASF361
	.byte	0x1
	.byte	0x4e
	.long	0x157a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2152
	.uleb128 0x29
	.long	.LASF362
	.byte	0x1
	.byte	0x5a
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2188
	.uleb128 0x29
	.long	.LASF363
	.byte	0x1
	.byte	0x5e
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2184
	.uleb128 0x29
	.long	.LASF364
	.byte	0x1
	.byte	0x62
	.long	0x1121
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2144
	.uleb128 0x28
	.string	"a"
	.byte	0x1
	.byte	0x64
	.long	0xab
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2197
	.uleb128 0x2c
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x28
	.string	"row"
	.byte	0x1
	.byte	0x8b
	.long	0xb94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2136
	.uleb128 0x29
	.long	.LASF133
	.byte	0x1
	.byte	0x8d
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0x28
	.string	"i"
	.byte	0x1
	.byte	0x8e
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2196
	.uleb128 0x28
	.string	"my"
	.byte	0x1
	.byte	0x9a
	.long	0x13ea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2176
	.uleb128 0x29
	.long	.LASF365
	.byte	0x1
	.byte	0x9c
	.long	0x13b3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2128
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x1373
	.uleb128 0x6
	.byte	0x8
	.long	0x123c
	.uleb128 0x2a
	.long	.LASF367
	.byte	0x1
	.byte	0xe8
	.long	0x62
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x1632
	.uleb128 0x2b
	.string	"cfd"
	.byte	0x1
	.byte	0xe8
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2244
	.uleb128 0x2d
	.long	.LASF133
	.byte	0x1
	.byte	0xe8
	.long	0xa5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2256
	.uleb128 0x2d
	.long	.LASF368
	.byte	0x1
	.byte	0xe8
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2264
	.uleb128 0x2e
	.string	"ret"
	.byte	0x1
	.byte	0xee
	.long	0x62
	.uleb128 0x28
	.string	"sql"
	.byte	0x1
	.byte	0xf0
	.long	0x1632
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2208
	.uleb128 0x29
	.long	.LASF369
	.byte	0x1
	.byte	0xf2
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2080
	.uleb128 0x29
	.long	.LASF370
	.byte	0x1
	.byte	0xf4
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0x2f
	.string	"q"
	.byte	0x1
	.value	0x104
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2224
	.uleb128 0x2f
	.string	"t"
	.byte	0x1
	.value	0x110
	.long	0x2db
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2232
	.uleb128 0x2f
	.string	"lt"
	.byte	0x1
	.value	0x112
	.long	0x1642
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2216
	.byte	0
	.uleb128 0xb
	.long	0xab
	.long	0x1642
	.uleb128 0xc
	.long	0x91
	.byte	0x7f
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x1248
	.uleb128 0x30
	.long	.LASF371
	.byte	0x1
	.value	0x130
	.long	0x62
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x1785
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x130
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2212
	.uleb128 0x31
	.string	"p"
	.byte	0x1
	.value	0x130
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2224
	.uleb128 0x2f
	.string	"ret"
	.byte	0x1
	.value	0x135
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2180
	.uleb128 0x2f
	.string	"pa"
	.byte	0x1
	.value	0x137
	.long	0x1574
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2168
	.uleb128 0x32
	.long	.LASF204
	.byte	0x1
	.value	0x139
	.long	0x2f4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1088
	.uleb128 0x2f
	.string	"sql"
	.byte	0x1
	.value	0x14b
	.long	0x2a4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2160
	.uleb128 0x2f
	.string	"res"
	.byte	0x1
	.value	0x14d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2192
	.uleb128 0x32
	.long	.LASF361
	.byte	0x1
	.value	0x157
	.long	0x157a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2152
	.uleb128 0x32
	.long	.LASF362
	.byte	0x1
	.value	0x163
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2188
	.uleb128 0x32
	.long	.LASF363
	.byte	0x1
	.value	0x168
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2184
	.uleb128 0x32
	.long	.LASF364
	.byte	0x1
	.value	0x16d
	.long	0x1121
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2144
	.uleb128 0x2f
	.string	"a"
	.byte	0x1
	.value	0x16f
	.long	0xab
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2197
	.uleb128 0x2c
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x2f
	.string	"row"
	.byte	0x1
	.value	0x196
	.long	0xb94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2136
	.uleb128 0x32
	.long	.LASF133
	.byte	0x1
	.value	0x198
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0x2f
	.string	"i"
	.byte	0x1
	.value	0x19a
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2196
	.uleb128 0x2f
	.string	"my"
	.byte	0x1
	.value	0x1a6
	.long	0x13ea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2176
	.uleb128 0x32
	.long	.LASF365
	.byte	0x1
	.value	0x1a8
	.long	0x13b3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2128
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	.LASF372
	.byte	0x1
	.value	0x1f7
	.long	0x62
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x1801
	.uleb128 0x33
	.long	.LASF368
	.byte	0x1
	.value	0x1f7
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x1f7
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x2f
	.string	"ret"
	.byte	0x1
	.value	0x1fa
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2f
	.string	"p"
	.byte	0x1
	.value	0x1fc
	.long	0x136d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2f
	.string	"pa"
	.byte	0x1
	.value	0x200
	.long	0x1574
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x32
	.long	.LASF373
	.byte	0x1
	.value	0x21b
	.long	0x1373
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x30
	.long	.LASF374
	.byte	0x1
	.value	0x227
	.long	0x62
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x1840
	.uleb128 0x33
	.long	.LASF375
	.byte	0x1
	.value	0x227
	.long	0x136d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2f
	.string	"p"
	.byte	0x1
	.value	0x22a
	.long	0x136d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x30
	.long	.LASF376
	.byte	0x1
	.value	0x239
	.long	0x62
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x18dd
	.uleb128 0x33
	.long	.LASF368
	.byte	0x1
	.value	0x239
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1368
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x239
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1372
	.uleb128 0x32
	.long	.LASF133
	.byte	0x1
	.value	0x23c
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1072
	.uleb128 0x2f
	.string	"p"
	.byte	0x1
	.value	0x23e
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1344
	.uleb128 0x2f
	.string	"t"
	.byte	0x1
	.value	0x24a
	.long	0x2db
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1352
	.uleb128 0x2f
	.string	"lt"
	.byte	0x1
	.value	0x24c
	.long	0x1642
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1336
	.uleb128 0x2f
	.string	"fd"
	.byte	0x1
	.value	0x252
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1356
	.uleb128 0x2f
	.string	"buf"
	.byte	0x1
	.value	0x25c
	.long	0x18dd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1328
	.byte	0
	.uleb128 0xb
	.long	0xab
	.long	0x18ed
	.uleb128 0xc
	.long	0x91
	.byte	0xfe
	.byte	0
	.uleb128 0x30
	.long	.LASF377
	.byte	0x1
	.value	0x271
	.long	0x62
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x197a
	.uleb128 0x31
	.string	"q"
	.byte	0x1
	.value	0x271
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1368
	.uleb128 0x32
	.long	.LASF133
	.byte	0x1
	.value	0x273
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1072
	.uleb128 0x2f
	.string	"t"
	.byte	0x1
	.value	0x275
	.long	0x2db
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1344
	.uleb128 0x2f
	.string	"lt"
	.byte	0x1
	.value	0x277
	.long	0x1642
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1336
	.uleb128 0x2f
	.string	"fd"
	.byte	0x1
	.value	0x27d
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1352
	.uleb128 0x2f
	.string	"buf"
	.byte	0x1
	.value	0x287
	.long	0x18dd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1328
	.uleb128 0x2f
	.string	"cfd"
	.byte	0x1
	.value	0x289
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1348
	.byte	0
	.uleb128 0x30
	.long	.LASF378
	.byte	0x1
	.value	0x29c
	.long	0x62
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a65
	.uleb128 0x33
	.long	.LASF368
	.byte	0x1
	.value	0x29c
	.long	0x1a65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x29c
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -284
	.uleb128 0x31
	.string	"pa"
	.byte	0x1
	.value	0x29c
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x2f
	.string	"ma"
	.byte	0x1
	.value	0x29f
	.long	0x12d8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x2f
	.string	"ret"
	.byte	0x1
	.value	0x2a1
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x32
	.long	.LASF379
	.byte	0x1
	.value	0x2a3
	.long	0x3be
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x2f
	.string	"p"
	.byte	0x1
	.value	0x2a5
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x2f
	.string	"q"
	.byte	0x1
	.value	0x2a5
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x2f
	.string	"sql"
	.byte	0x1
	.value	0x2ab
	.long	0x1632
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2c
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x32
	.long	.LASF361
	.byte	0x1
	.value	0x2d2
	.long	0x157a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x32
	.long	.LASF380
	.byte	0x1
	.value	0x2d4
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -268
	.uleb128 0x34
	.string	"row"
	.byte	0x1
	.value	0x2d8
	.long	0xb94
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x136d
	.uleb128 0x30
	.long	.LASF381
	.byte	0x1
	.value	0x30b
	.long	0x62
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x1aec
	.uleb128 0x33
	.long	.LASF368
	.byte	0x1
	.value	0x30b
	.long	0x1a65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x30b
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x31
	.string	"pa"
	.byte	0x1
	.value	0x30b
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x32
	.long	.LASF133
	.byte	0x1
	.value	0x30e
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x2f
	.string	"row"
	.byte	0x1
	.value	0x30e
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x2f
	.string	"ma"
	.byte	0x1
	.value	0x310
	.long	0x12d8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x30
	.long	.LASF382
	.byte	0x1
	.value	0x32e
	.long	0x62
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b87
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x32e
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -516
	.uleb128 0x31
	.string	"pa"
	.byte	0x1
	.value	0x32e
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -528
	.uleb128 0x33
	.long	.LASF368
	.byte	0x1
	.value	0x32e
	.long	0x1a65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -536
	.uleb128 0x2f
	.string	"p"
	.byte	0x1
	.value	0x331
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -504
	.uleb128 0x2f
	.string	"ma"
	.byte	0x1
	.value	0x333
	.long	0x12d8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -496
	.uleb128 0x2f
	.string	"buf"
	.byte	0x1
	.value	0x335
	.long	0x18dd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x34
	.string	"ret"
	.byte	0x1
	.value	0x33b
	.long	0x62
	.uleb128 0x2f
	.string	"sql"
	.byte	0x1
	.value	0x33d
	.long	0x1632
	.uleb128 0x3
	.byte	0x91
	.sleb128 -416
	.byte	0
	.uleb128 0x30
	.long	.LASF383
	.byte	0x1
	.value	0x362
	.long	0x62
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c02
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x362
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x31
	.string	"pa"
	.byte	0x1
	.value	0x362
	.long	0x1373
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x33
	.long	.LASF368
	.byte	0x1
	.value	0x362
	.long	0x1a65
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x32
	.long	.LASF133
	.byte	0x1
	.value	0x365
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2f
	.string	"ret"
	.byte	0x1
	.value	0x365
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2f
	.string	"a"
	.byte	0x1
	.value	0x367
	.long	0xab
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.byte	0
	.uleb128 0x30
	.long	.LASF384
	.byte	0x1
	.value	0x394
	.long	0x62
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c73
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x394
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -260
	.uleb128 0x31
	.string	"pa"
	.byte	0x1
	.value	0x394
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x2f
	.string	"ma"
	.byte	0x1
	.value	0x397
	.long	0x12d8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x2f
	.string	"ret"
	.byte	0x1
	.value	0x399
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -244
	.uleb128 0x2f
	.string	"sql"
	.byte	0x1
	.value	0x39b
	.long	0x1632
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.byte	0
	.uleb128 0x30
	.long	.LASF385
	.byte	0x1
	.value	0x3c6
	.long	0x62
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x1cd1
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x3c6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x31
	.string	"pa"
	.byte	0x1
	.value	0x3c6
	.long	0x1373
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x32
	.long	.LASF133
	.byte	0x1
	.value	0x3c9
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2f
	.string	"ret"
	.byte	0x1
	.value	0x3c9
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x35
	.long	.LASF391
	.byte	0x1
	.value	0x3e3
	.long	0x62
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x1da0
	.uleb128 0x32
	.long	.LASF386
	.byte	0x1
	.value	0x3e6
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -340
	.uleb128 0x2f
	.string	"ret"
	.byte	0x1
	.value	0x3e6
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -332
	.uleb128 0x32
	.long	.LASF387
	.byte	0x1
	.value	0x3e6
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x32
	.long	.LASF388
	.byte	0x1
	.value	0x3e8
	.long	0x3be
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0x32
	.long	.LASF186
	.byte	0x1
	.value	0x3ea
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x2f
	.string	"ip"
	.byte	0x1
	.value	0x3ec
	.long	0x1632
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x32
	.long	.LASF389
	.byte	0x1
	.value	0x3ee
	.long	0x1632
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x2f
	.string	"fp"
	.byte	0x1
	.value	0x3f0
	.long	0x1da0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0x2f
	.string	"i"
	.byte	0x1
	.value	0x3fb
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -348
	.uleb128 0x2c
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x2f
	.string	"i"
	.byte	0x1
	.value	0x40f
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -344
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb2
	.uleb128 0x30
	.long	.LASF390
	.byte	0x1
	.value	0x442
	.long	0x62
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x1e22
	.uleb128 0x33
	.long	.LASF368
	.byte	0x1
	.value	0x442
	.long	0x1a65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x33
	.long	.LASF389
	.byte	0x1
	.value	0x442
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x2f
	.string	"p"
	.byte	0x1
	.value	0x445
	.long	0x136d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2f
	.string	"ptr"
	.byte	0x1
	.value	0x449
	.long	0x136d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2c
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x2f
	.string	"q"
	.byte	0x1
	.value	0x45d
	.long	0x136d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x35
	.long	.LASF392
	.byte	0x1
	.value	0x46f
	.long	0x62
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f62
	.uleb128 0x2f
	.string	"ret"
	.byte	0x1
	.value	0x472
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1328
	.uleb128 0x32
	.long	.LASF386
	.byte	0x1
	.value	0x474
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1336
	.uleb128 0x32
	.long	.LASF368
	.byte	0x1
	.value	0x476
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1312
	.uleb128 0x32
	.long	.LASF393
	.byte	0x1
	.value	0x476
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1304
	.uleb128 0x2f
	.string	"p"
	.byte	0x1
	.value	0x476
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1296
	.uleb128 0x2f
	.string	"del"
	.byte	0x1
	.value	0x476
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1288
	.uleb128 0x32
	.long	.LASF379
	.byte	0x1
	.value	0x478
	.long	0x3be
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1248
	.uleb128 0x32
	.long	.LASF387
	.byte	0x1
	.value	0x47a
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1344
	.uleb128 0x2f
	.string	"efd"
	.byte	0x1
	.value	0x47c
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1332
	.uleb128 0x2f
	.string	"cfd"
	.byte	0x1
	.value	0x47c
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1316
	.uleb128 0x32
	.long	.LASF394
	.byte	0x1
	.value	0x47c
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1324
	.uleb128 0x32
	.long	.LASF389
	.byte	0x1
	.value	0x47c
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1320
	.uleb128 0x2f
	.string	"ev"
	.byte	0x1
	.value	0x47e
	.long	0x4c0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1280
	.uleb128 0x2f
	.string	"evs"
	.byte	0x1
	.value	0x47e
	.long	0x1f62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1232
	.uleb128 0x2c
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x2f
	.string	"i"
	.byte	0x1
	.value	0x4a1
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1340
	.uleb128 0x2c
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x2f
	.string	"p"
	.byte	0x1
	.value	0x4c9
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1264
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	0x4c0
	.long	0x1f72
	.uleb128 0xc
	.long	0x91
	.byte	0x63
	.byte	0
	.uleb128 0x30
	.long	.LASF395
	.byte	0x1
	.value	0x4ed
	.long	0x62
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x2062
	.uleb128 0x33
	.long	.LASF368
	.byte	0x1
	.value	0x4ed
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2392
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x4ed
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2396
	.uleb128 0x31
	.string	"p"
	.byte	0x1
	.value	0x4ed
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2416
	.uleb128 0x2f
	.string	"ret"
	.byte	0x1
	.value	0x4f0
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2372
	.uleb128 0x32
	.long	.LASF133
	.byte	0x1
	.value	0x4f2
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2080
	.uleb128 0x32
	.long	.LASF396
	.byte	0x1
	.value	0x4f4
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0x32
	.long	.LASF397
	.byte	0x1
	.value	0x4f6
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2368
	.uleb128 0x32
	.long	.LASF138
	.byte	0x1
	.value	0x4f8
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2364
	.uleb128 0x2f
	.string	"sum"
	.byte	0x1
	.value	0x4fa
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2376
	.uleb128 0x2f
	.string	"pa"
	.byte	0x1
	.value	0x4fc
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2352
	.uleb128 0x32
	.long	.LASF398
	.byte	0x1
	.value	0x4fe
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2360
	.uleb128 0x32
	.long	.LASF399
	.byte	0x1
	.value	0x4fe
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2356
	.uleb128 0x2f
	.string	"buf"
	.byte	0x1
	.value	0x50e
	.long	0x18dd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2336
	.byte	0
	.uleb128 0x30
	.long	.LASF204
	.byte	0x1
	.value	0x559
	.long	0x62
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x20b0
	.uleb128 0x33
	.long	.LASF368
	.byte	0x1
	.value	0x559
	.long	0x1a65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x31
	.string	"p"
	.byte	0x1
	.value	0x559
	.long	0x1373
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x559
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x30
	.long	.LASF400
	.byte	0x1
	.value	0x598
	.long	0x62
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x21b2
	.uleb128 0x33
	.long	.LASF368
	.byte	0x1
	.value	0x598
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2392
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x598
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2396
	.uleb128 0x31
	.string	"p"
	.byte	0x1
	.value	0x598
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2416
	.uleb128 0x2f
	.string	"ret"
	.byte	0x1
	.value	0x59c
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2380
	.uleb128 0x32
	.long	.LASF401
	.byte	0x1
	.value	0x59c
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2372
	.uleb128 0x32
	.long	.LASF133
	.byte	0x1
	.value	0x59e
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2080
	.uleb128 0x32
	.long	.LASF396
	.byte	0x1
	.value	0x5a0
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0x36
	.long	.LASF397
	.byte	0x1
	.value	0x5a2
	.long	0x62
	.uleb128 0x36
	.long	.LASF398
	.byte	0x1
	.value	0x5a4
	.long	0x62
	.uleb128 0x36
	.long	.LASF399
	.byte	0x1
	.value	0x5a4
	.long	0x62
	.uleb128 0x2f
	.string	"fp"
	.byte	0x1
	.value	0x5ac
	.long	0x1da0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2360
	.uleb128 0x32
	.long	.LASF138
	.byte	0x1
	.value	0x5ae
	.long	0x69
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2368
	.uleb128 0x2f
	.string	"fd"
	.byte	0x1
	.value	0x5c4
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2376
	.uleb128 0x2f
	.string	"buf"
	.byte	0x1
	.value	0x5ce
	.long	0x18dd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2336
	.uleb128 0x2f
	.string	"pa"
	.byte	0x1
	.value	0x5d4
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2352
	.byte	0
	.uleb128 0x30
	.long	.LASF402
	.byte	0x1
	.value	0x60f
	.long	0x62
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x228e
	.uleb128 0x33
	.long	.LASF368
	.byte	0x1
	.value	0x60f
	.long	0x136d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3400
	.uleb128 0x31
	.string	"p"
	.byte	0x1
	.value	0x60f
	.long	0x1373
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3408
	.uleb128 0x31
	.string	"cfd"
	.byte	0x1
	.value	0x60f
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3412
	.uleb128 0x2f
	.string	"ret"
	.byte	0x1
	.value	0x612
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3384
	.uleb128 0x32
	.long	.LASF133
	.byte	0x1
	.value	0x614
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3104
	.uleb128 0x2f
	.string	"ptr"
	.byte	0x1
	.value	0x616
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -2080
	.uleb128 0x32
	.long	.LASF403
	.byte	0x1
	.value	0x618
	.long	0x13d9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0x2f
	.string	"pa"
	.byte	0x1
	.value	0x61a
	.long	0x1574
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3376
	.uleb128 0x2f
	.string	"tr"
	.byte	0x1
	.value	0x61a
	.long	0x1574
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3368
	.uleb128 0x2f
	.string	"i"
	.byte	0x1
	.value	0x61c
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3388
	.uleb128 0x2f
	.string	"fd"
	.byte	0x1
	.value	0x626
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3380
	.uleb128 0x2f
	.string	"buf"
	.byte	0x1
	.value	0x634
	.long	0x18dd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -3360
	.byte	0
	.uleb128 0x37
	.long	.LASF410
	.byte	0x14
	.byte	0x45
	.long	0x1153
	.uleb128 0x9
	.byte	0x3
	.quad	mysql
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x17
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
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x18
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x17
	.byte	0x1
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
	.uleb128 0x1e
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
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x16
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
	.uleb128 0x23
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
	.uleb128 0x5
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
	.uleb128 0x2c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
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
	.byte	0
	.byte	0
	.uleb128 0x35
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
	.uleb128 0x36
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
	.uleb128 0x37
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
.LASF247:
	.string	"st_mysql_data"
.LASF243:
	.string	"st_mysql_rows"
.LASF7:
	.string	"size_t"
.LASF11:
	.string	"sizetype"
.LASF345:
	.string	"tm_hour"
.LASF333:
	.string	"MYSQL"
.LASF367:
	.string	"mysql_record"
.LASF231:
	.string	"used"
.LASF145:
	.string	"write_timeout"
.LASF104:
	.string	"MYSQL_TYPE_LONG"
.LASF319:
	.string	"local_infile_init"
.LASF172:
	.string	"user"
.LASF134:
	.string	"buff_end"
.LASF274:
	.string	"MYSQL_OPT_SSL_VERIFY_SERVER_CERT"
.LASF74:
	.string	"sin_family"
.LASF76:
	.string	"sin_addr"
.LASF26:
	.string	"_IO_save_end"
.LASF287:
	.string	"MYSQL_OPT_CONNECT_ATTR_DELETE"
.LASF286:
	.string	"MYSQL_OPT_CONNECT_ATTR_ADD"
.LASF276:
	.string	"MYSQL_DEFAULT_AUTH"
.LASF58:
	.string	"SOCK_RAW"
.LASF87:
	.string	"EPOLLMSG"
.LASF290:
	.string	"MYSQL_OPT_CAN_HANDLE_EXPIRED_PASSWORDS"
.LASF53:
	.string	"time_t"
.LASF139:
	.string	"buf_length"
.LASF19:
	.string	"_IO_write_base"
.LASF262:
	.string	"MYSQL_OPT_PROTOCOL"
.LASF218:
	.string	"decimals"
.LASF35:
	.string	"_lock"
.LASF125:
	.string	"MYSQL_TYPE_TINY_BLOB"
.LASF220:
	.string	"type"
.LASF335:
	.string	"row_count"
.LASF24:
	.string	"_IO_save_base"
.LASF216:
	.string	"def_length"
.LASF383:
	.string	"exit_ok"
.LASF28:
	.string	"_chain"
.LASF394:
	.string	"count"
.LASF32:
	.string	"_cur_column"
.LASF89:
	.string	"EPOLLHUP"
.LASF261:
	.string	"MYSQL_OPT_LOCAL_INFILE"
.LASF212:
	.string	"table_length"
.LASF328:
	.string	"MYSQL_STATUS_GET_RESULT"
.LASF254:
	.string	"MYSQL_OPT_COMPRESS"
.LASF259:
	.string	"MYSQL_SET_CHARSET_DIR"
.LASF405:
	.string	"server.c"
.LASF303:
	.string	"init_commands"
.LASF322:
	.string	"local_infile_error"
.LASF361:
	.string	"result"
.LASF388:
	.string	"seraddr"
.LASF198:
	.string	"scramble"
.LASF140:
	.string	"where_b"
.LASF391:
	.string	"socket_init"
.LASF173:
	.string	"passwd"
.LASF189:
	.string	"protocol_version"
.LASF61:
	.string	"SOCK_DCCP"
.LASF6:
	.string	"long int"
.LASF59:
	.string	"SOCK_RDM"
.LASF256:
	.string	"MYSQL_INIT_COMMAND"
.LASF351:
	.string	"tm_isdst"
.LASF401:
	.string	"ret1"
.LASF114:
	.string	"MYSQL_TYPE_YEAR"
.LASF146:
	.string	"read_timeout"
.LASF404:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF202:
	.string	"info_buffer"
.LASF45:
	.string	"_IO_marker"
.LASF392:
	.string	"main"
.LASF122:
	.string	"MYSQL_TYPE_NEWDECIMAL"
.LASF84:
	.string	"EPOLLRDBAND"
.LASF99:
	.string	"my_socket"
.LASF393:
	.string	"pnew"
.LASF158:
	.string	"error"
.LASF368:
	.string	"head"
.LASF107:
	.string	"MYSQL_TYPE_NULL"
.LASF79:
	.string	"EPOLL_EVENTS"
.LASF258:
	.string	"MYSQL_READ_DEFAULT_GROUP"
.LASF255:
	.string	"MYSQL_OPT_NAMED_PIPE"
.LASF266:
	.string	"MYSQL_OPT_USE_RESULT"
.LASF83:
	.string	"EPOLLRDNORM"
.LASF246:
	.string	"embedded_query_result"
.LASF106:
	.string	"MYSQL_TYPE_DOUBLE"
.LASF295:
	.string	"MYSQL_OPT_SSL_MODE"
.LASF306:
	.string	"charset_dir"
.LASF182:
	.string	"insert_id"
.LASF235:
	.string	"block_num"
.LASF4:
	.string	"signed char"
.LASF44:
	.string	"_IO_FILE"
.LASF179:
	.string	"fields"
.LASF384:
	.string	"mysql_write"
.LASF60:
	.string	"SOCK_SEQPACKET"
.LASF248:
	.string	"embedded_info"
.LASF1:
	.string	"unsigned char"
.LASF304:
	.string	"my_cnf_file"
.LASF293:
	.string	"MYSQL_OPT_NET_BUFFER_LENGTH"
.LASF175:
	.string	"server_version"
.LASF205:
	.string	"org_name"
.LASF130:
	.string	"MYSQL_TYPE_STRING"
.LASF94:
	.string	"epoll_data_t"
.LASF289:
	.string	"MYSQL_ENABLE_CLEARTEXT_PLUGIN"
.LASF210:
	.string	"name_length"
.LASF206:
	.string	"table"
.LASF284:
	.string	"MYSQL_OPT_SSL_CRLPATH"
.LASF372:
	.string	"send_link"
.LASF78:
	.string	"__socket_type"
.LASF201:
	.string	"unbuffered_fetch_owner"
.LASF13:
	.string	"char"
.LASF251:
	.string	"MYSQL_DATA"
.LASF56:
	.string	"SOCK_STREAM"
.LASF244:
	.string	"MYSQL_ROWS"
.LASF363:
	.string	"num_rows"
.LASF156:
	.string	"unused"
.LASF288:
	.string	"MYSQL_SERVER_PUBLIC_KEY"
.LASF377:
	.string	"open_file"
.LASF407:
	.string	"_IO_lock_t"
.LASF228:
	.string	"USED_MEM"
.LASF73:
	.string	"sockaddr_in"
.LASF365:
	.string	"my_buff"
.LASF339:
	.string	"current_row"
.LASF294:
	.string	"MYSQL_OPT_TLS_VERSION"
.LASF75:
	.string	"sin_port"
.LASF250:
	.string	"rows"
.LASF310:
	.string	"ssl_ca"
.LASF332:
	.string	"st_mysql_methods"
.LASF380:
	.string	"num_row"
.LASF217:
	.string	"flags"
.LASF344:
	.string	"tm_min"
.LASF183:
	.string	"extra_info"
.LASF16:
	.string	"_IO_read_ptr"
.LASF48:
	.string	"_pos"
.LASF180:
	.string	"field_alloc"
.LASF67:
	.string	"sa_family"
.LASF77:
	.string	"sin_zero"
.LASF147:
	.string	"retry_count"
.LASF362:
	.string	"num_fields"
.LASF375:
	.string	"phead"
.LASF27:
	.string	"_markers"
.LASF237:
	.string	"max_capacity"
.LASF232:
	.string	"pre_alloc"
.LASF200:
	.string	"methods"
.LASF142:
	.string	"max_packet_size"
.LASF105:
	.string	"MYSQL_TYPE_FLOAT"
.LASF111:
	.string	"MYSQL_TYPE_DATE"
.LASF278:
	.string	"MYSQL_OPT_SSL_KEY"
.LASF379:
	.string	"cliaddr"
.LASF395:
	.string	"send_o"
.LASF126:
	.string	"MYSQL_TYPE_MEDIUM_BLOB"
.LASF69:
	.string	"in_addr_t"
.LASF221:
	.string	"MYSQL_FIELD"
.LASF400:
	.string	"rec_o"
.LASF340:
	.string	"current_field"
.LASF226:
	.string	"left"
.LASF120:
	.string	"MYSQL_TYPE_TIME2"
.LASF343:
	.string	"tm_sec"
.LASF409:
	.string	"make_daemon"
.LASF36:
	.string	"_offset"
.LASF378:
	.string	"mysql_read"
.LASF163:
	.string	"extension"
.LASF269:
	.string	"MYSQL_OPT_GUESS_CONNECTION"
.LASF90:
	.string	"EPOLLRDHUP"
.LASF292:
	.string	"MYSQL_OPT_MAX_ALLOWED_PACKET"
.LASF275:
	.string	"MYSQL_PLUGIN_DIR"
.LASF110:
	.string	"MYSQL_TYPE_INT24"
.LASF193:
	.string	"warning_count"
.LASF128:
	.string	"MYSQL_TYPE_BLOB"
.LASF297:
	.string	"client_ip"
.LASF214:
	.string	"db_length"
.LASF277:
	.string	"MYSQL_OPT_BIND"
.LASF396:
	.string	"buff1"
.LASF0:
	.string	"long unsigned int"
.LASF308:
	.string	"ssl_key"
.LASF88:
	.string	"EPOLLERR"
.LASF245:
	.string	"st_vio"
.LASF195:
	.string	"status"
.LASF30:
	.string	"_flags2"
.LASF127:
	.string	"MYSQL_TYPE_LONG_BLOB"
.LASF252:
	.string	"mysql_option"
.LASF18:
	.string	"_IO_read_base"
.LASF403:
	.string	"line"
.LASF209:
	.string	"max_length"
.LASF174:
	.string	"unix_socket"
.LASF43:
	.string	"_unused2"
.LASF225:
	.string	"st_used_mem"
.LASF185:
	.string	"packet_length"
.LASF352:
	.string	"tm_gmtoff"
.LASF108:
	.string	"MYSQL_TYPE_TIMESTAMP"
.LASF129:
	.string	"MYSQL_TYPE_VAR_STRING"
.LASF98:
	.string	"my_bool"
.LASF109:
	.string	"MYSQL_TYPE_LONGLONG"
.LASF169:
	.string	"st_mysql"
.LASF178:
	.string	"charset"
.LASF31:
	.string	"_old_offset"
.LASF176:
	.string	"host_info"
.LASF337:
	.string	"lengths"
.LASF113:
	.string	"MYSQL_TYPE_DATETIME"
.LASF402:
	.string	"order"
.LASF219:
	.string	"charsetnr"
.LASF331:
	.string	"charset_info_st"
.LASF356:
	.string	"pack"
.LASF282:
	.string	"MYSQL_OPT_SSL_CIPHER"
.LASF320:
	.string	"local_infile_read"
.LASF366:
	.string	"record_mysql"
.LASF301:
	.string	"protocol"
.LASF55:
	.string	"long long int"
.LASF222:
	.string	"MYSQL_ROW"
.LASF199:
	.string	"stmts"
.LASF144:
	.string	"compress_pkt_nr"
.LASF347:
	.string	"tm_mon"
.LASF285:
	.string	"MYSQL_OPT_CONNECT_ATTR_RESET"
.LASF341:
	.string	"unbuffered_fetch_cancelled"
.LASF369:
	.string	"buf1"
.LASF370:
	.string	"buf2"
.LASF164:
	.string	"double"
.LASF387:
	.string	"addrlen"
.LASF21:
	.string	"_IO_write_end"
.LASF123:
	.string	"MYSQL_TYPE_ENUM"
.LASF170:
	.string	"connector_fd"
.LASF137:
	.string	"remain_in_buf"
.LASF188:
	.string	"server_capabilities"
.LASF82:
	.string	"EPOLLOUT"
.LASF374:
	.string	"show"
.LASF300:
	.string	"connect_timeout"
.LASF133:
	.string	"buff"
.LASF152:
	.string	"unused1"
.LASF153:
	.string	"unused2"
.LASF155:
	.string	"unused3"
.LASF159:
	.string	"unused4"
.LASF160:
	.string	"unused5"
.LASF154:
	.string	"compress"
.LASF101:
	.string	"MYSQL_TYPE_DECIMAL"
.LASF316:
	.string	"named_pipe"
.LASF203:
	.string	"st_mysql_field"
.LASF157:
	.string	"last_errno"
.LASF249:
	.string	"alloc"
.LASF22:
	.string	"_IO_buf_base"
.LASF224:
	.string	"PSI_memory_key"
.LASF187:
	.string	"client_flag"
.LASF3:
	.string	"unsigned int"
.LASF151:
	.string	"save_char"
.LASF238:
	.string	"allocated_size"
.LASF359:
	.string	"mysql_msg"
.LASF385:
	.string	"reg_ok"
.LASF37:
	.string	"__pad1"
.LASF38:
	.string	"__pad2"
.LASF39:
	.string	"__pad3"
.LASF40:
	.string	"__pad4"
.LASF41:
	.string	"__pad5"
.LASF271:
	.string	"MYSQL_SECURE_AUTH"
.LASF318:
	.string	"report_data_truncation"
.LASF47:
	.string	"_sbuf"
.LASF49:
	.string	"pid_t"
.LASF161:
	.string	"last_error"
.LASF233:
	.string	"min_malloc"
.LASF92:
	.string	"EPOLLONESHOT"
.LASF257:
	.string	"MYSQL_READ_DEFAULT_FILE"
.LASF64:
	.string	"SOCK_NONBLOCK"
.LASF119:
	.string	"MYSQL_TYPE_DATETIME2"
.LASF223:
	.string	"my_ulonglong"
.LASF279:
	.string	"MYSQL_OPT_SSL_CERT"
.LASF15:
	.string	"_flags"
.LASF360:
	.string	"daemon_flag"
.LASF213:
	.string	"org_table_length"
.LASF141:
	.string	"max_packet"
.LASF325:
	.string	"st_mysql_options_extention"
.LASF207:
	.string	"org_table"
.LASF42:
	.string	"_mode"
.LASF406:
	.string	"/home/ubuntu/Mygraduation/remote"
.LASF270:
	.string	"MYSQL_SET_CLIENT_IP"
.LASF93:
	.string	"EPOLLET"
.LASF116:
	.string	"MYSQL_TYPE_VARCHAR"
.LASF162:
	.string	"sqlstate"
.LASF81:
	.string	"EPOLLPRI"
.LASF296:
	.string	"MYSQL_OPT_GET_SERVER_PUBLIC_KEY"
.LASF342:
	.string	"MYSQL_RES"
.LASF312:
	.string	"ssl_cipher"
.LASF227:
	.string	"size"
.LASF355:
	.string	"cli_info"
.LASF314:
	.string	"max_allowed_packet"
.LASF14:
	.string	"FILE"
.LASF10:
	.string	"__pid_t"
.LASF280:
	.string	"MYSQL_OPT_SSL_CA"
.LASF315:
	.string	"use_ssl"
.LASF338:
	.string	"handle"
.LASF264:
	.string	"MYSQL_OPT_READ_TIMEOUT"
.LASF192:
	.string	"server_language"
.LASF323:
	.string	"local_infile_userdata"
.LASF165:
	.string	"st_list"
.LASF346:
	.string	"tm_mday"
.LASF177:
	.string	"info"
.LASF57:
	.string	"SOCK_DGRAM"
.LASF350:
	.string	"tm_yday"
.LASF132:
	.string	"st_net"
.LASF398:
	.string	"bytes_read"
.LASF181:
	.string	"affected_rows"
.LASF117:
	.string	"MYSQL_TYPE_BIT"
.LASF229:
	.string	"st_mem_root"
.LASF54:
	.string	"long long unsigned int"
.LASF211:
	.string	"org_name_length"
.LASF65:
	.string	"sa_family_t"
.LASF138:
	.string	"length"
.LASF50:
	.string	"uint16_t"
.LASF8:
	.string	"__off_t"
.LASF273:
	.string	"MYSQL_OPT_RECONNECT"
.LASF371:
	.string	"show_mysql"
.LASF68:
	.string	"sa_data"
.LASF349:
	.string	"tm_wday"
.LASF330:
	.string	"MYSQL_STATUS_STATEMENT_GET_RESULT"
.LASF253:
	.string	"MYSQL_OPT_CONNECT_TIMEOUT"
.LASF86:
	.string	"EPOLLWRBAND"
.LASF242:
	.string	"MEM_ROOT"
.LASF190:
	.string	"field_count"
.LASF118:
	.string	"MYSQL_TYPE_TIMESTAMP2"
.LASF397:
	.string	"fd_write"
.LASF66:
	.string	"sockaddr"
.LASF12:
	.string	"__time_t"
.LASF326:
	.string	"mysql_status"
.LASF410:
	.string	"mysql"
.LASF376:
	.string	"close_file"
.LASF241:
	.string	"m_psi_key"
.LASF80:
	.string	"EPOLLIN"
.LASF85:
	.string	"EPOLLWRNORM"
.LASF25:
	.string	"_IO_backup_base"
.LASF34:
	.string	"_shortbuf"
.LASF364:
	.string	"field"
.LASF131:
	.string	"MYSQL_TYPE_GEOMETRY"
.LASF236:
	.string	"first_block_usage"
.LASF197:
	.string	"reconnect"
.LASF399:
	.string	"bytes_write"
.LASF234:
	.string	"block_size"
.LASF46:
	.string	"_next"
.LASF9:
	.string	"__off64_t"
.LASF70:
	.string	"in_addr"
.LASF291:
	.string	"MYSQL_OPT_SSL_ENFORCE"
.LASF196:
	.string	"free_me"
.LASF336:
	.string	"data_cursor"
.LASF95:
	.string	"epoll_event"
.LASF143:
	.string	"pkt_nr"
.LASF408:
	.string	"epoll_data"
.LASF215:
	.string	"catalog_length"
.LASF23:
	.string	"_IO_buf_end"
.LASF171:
	.string	"host"
.LASF63:
	.string	"SOCK_CLOEXEC"
.LASF204:
	.string	"name"
.LASF329:
	.string	"MYSQL_STATUS_USE_RESULT"
.LASF148:
	.string	"fcntl"
.LASF390:
	.string	"del_link"
.LASF186:
	.string	"port"
.LASF281:
	.string	"MYSQL_OPT_SSL_CAPATH"
.LASF150:
	.string	"reading_or_writing"
.LASF358:
	.string	"buff_msg"
.LASF62:
	.string	"SOCK_PACKET"
.LASF268:
	.string	"MYSQL_OPT_USE_EMBEDDED_CONNECTION"
.LASF324:
	.string	"st_dynamic_array"
.LASF334:
	.string	"st_mysql_res"
.LASF5:
	.string	"short int"
.LASF302:
	.string	"password"
.LASF52:
	.string	"uint64_t"
.LASF112:
	.string	"MYSQL_TYPE_TIME"
.LASF373:
	.string	"judge"
.LASF381:
	.string	"log_ok"
.LASF240:
	.string	"error_handler"
.LASF33:
	.string	"_vtable_offset"
.LASF305:
	.string	"my_cnf_group"
.LASF260:
	.string	"MYSQL_SET_CHARSET_NAME"
.LASF121:
	.string	"MYSQL_TYPE_JSON"
.LASF102:
	.string	"MYSQL_TYPE_TINY"
.LASF353:
	.string	"tm_zone"
.LASF103:
	.string	"MYSQL_TYPE_SHORT"
.LASF357:
	.string	"lenth"
.LASF208:
	.string	"catalog"
.LASF191:
	.string	"server_status"
.LASF17:
	.string	"_IO_read_end"
.LASF71:
	.string	"s_addr"
.LASF386:
	.string	"sockfd"
.LASF263:
	.string	"MYSQL_SHARED_MEMORY_BASE_NAME"
.LASF272:
	.string	"MYSQL_REPORT_DATA_TRUNCATION"
.LASF136:
	.string	"read_pos"
.LASF317:
	.string	"methods_to_use"
.LASF51:
	.string	"uint32_t"
.LASF239:
	.string	"error_for_capacity_exceeded"
.LASF265:
	.string	"MYSQL_OPT_WRITE_TIMEOUT"
.LASF29:
	.string	"_fileno"
.LASF267:
	.string	"MYSQL_OPT_USE_REMOTE_CONNECTION"
.LASF135:
	.string	"write_pos"
.LASF100:
	.string	"enum_field_types"
.LASF382:
	.string	"mysql_exit"
.LASF321:
	.string	"local_infile_end"
.LASF313:
	.string	"shared_memory_base_name"
.LASF230:
	.string	"free"
.LASF168:
	.string	"LIST"
.LASF348:
	.string	"tm_year"
.LASF2:
	.string	"short unsigned int"
.LASF149:
	.string	"return_status"
.LASF354:
	.string	"message"
.LASF20:
	.string	"_IO_write_ptr"
.LASF115:
	.string	"MYSQL_TYPE_NEWDATE"
.LASF91:
	.string	"EPOLLWAKEUP"
.LASF194:
	.string	"options"
.LASF311:
	.string	"ssl_capath"
.LASF389:
	.string	"temp"
.LASF327:
	.string	"MYSQL_STATUS_READY"
.LASF283:
	.string	"MYSQL_OPT_SSL_CRL"
.LASF96:
	.string	"events"
.LASF167:
	.string	"next"
.LASF97:
	.string	"data"
.LASF299:
	.string	"st_mysql_options"
.LASF309:
	.string	"ssl_cert"
.LASF166:
	.string	"prev"
.LASF124:
	.string	"MYSQL_TYPE_SET"
.LASF72:
	.string	"in_port_t"
.LASF298:
	.string	"bind_address"
.LASF184:
	.string	"thread_id"
.LASF307:
	.string	"charset_name"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits

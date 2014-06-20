	.file	"string0.c"
	.section	.rodata
.LC0:
	.string	"Hello World"
.LC1:
	.string	"%s\n"
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$36, %esp
	movl	$.LC0, -12(%ebp)
	movsbl	-5(%ebp),%eax
	movl	%eax, %edx
	movl	$4444, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__memcpy
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	puts
	movsbl	-5(%ebp),%eax
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	addl	$36, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.type	__memcpy, @function
__memcpy:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	movl	16(%ebp), %eax
	movl	%eax, %ecx
	shrl	$2, %ecx
	movl	8(%ebp), %edi
	movl	12(%ebp), %esi
	movl	16(%ebp), %eax
#APP
	rep movsl
	testb $2, %al
	je 1f
	movsw
1:	testb $1, %al
	je 2f
	movsb
2:
#NO_APP
	movl	%ecx, -20(%ebp)
	movl	%edi, -16(%ebp)
	movl	%esi, -12(%ebp)
	movl	8(%ebp), %eax
	addl	$16, %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.size	__memcpy, .-__memcpy
	.ident	"GCC: (GNU) 4.1.2 20071124 (Red Hat 4.1.2-42)"
	.section	.note.GNU-stack,"",@progbits

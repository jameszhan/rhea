	.file	"main.c"
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
	subl	$16, %esp
	movl	$1, -20(%ebp)
	movl	$2, -16(%ebp)
	movl	$3, -12(%ebp)
	movl	$0, -8(%ebp)
	movl	-16(%ebp), %eax
	addl	-20(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	-12(%ebp), %eax
	addl	%eax, -8(%ebp)
	movl	-8(%ebp), %eax
	addl	$16, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.2 20071124 (Red Hat 4.1.2-42)"
	.section	.note.GNU-stack,"",@progbits

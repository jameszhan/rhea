	.file	"hello.c"
	.section	.rodata
.LC0:
	.string	"Hello World"
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
	subl	$4, %esp
	movl	$.LC0, (%esp)
	call	printf
	movl	$0, (%esp)
	call	exit
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.2 20071124 (Red Hat 4.1.2-42)"
	.section	.note.GNU-stack,"",@progbits

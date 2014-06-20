	.file	"simple.c"
	.section	.rodata
.LC0:
	.string	"a=%d, b=%d\n"
	.text
.globl func
	.type	func, @function
func:
	pushl	%ebp
	movl	%esp, %ebp
	;subl	$24, %esp
	;movl	12(%ebp), %eax
	;movl	%eax, 8(%esp)
	;movl	8(%ebp), %eax
	;movl	%eax, 4(%esp)
	;movl	$.LC0, (%esp)
	;call	printf
	movl	12(%ebp), %eax
	addl	8(%ebp), %eax
	leave
	ret
	.size	func, .-func
	.section	.rodata
.LC1:
	.string	"result=%d\n"
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
	movl	$12, -12(%ebp)
	movl	$18, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	func
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	addl	$36, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.2 20071124 (Red Hat 4.1.2-42)"
	.section	.note.GNU-stack,"",@progbits

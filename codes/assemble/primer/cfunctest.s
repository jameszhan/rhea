	.file	"cfunctest.c"
	.section	.rodata
	.align 8
.LC0:
	.long	1293080650
	.long	1074340347
	.text
.globl circumf
	.type	circumf, @function
circumf:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	addl	%eax, %eax
	pushl	%eax
	fildl	(%esp)
	leal	4(%esp), %esp
	fldl	.LC0
	fmulp	%st, %st(1)
	fstps	-4(%ebp)
	flds	-4(%ebp)
	leave
	ret
	.size	circumf, .-circumf
	.section	.rodata
	.align 8
.LC2:
	.long	1293080650
	.long	1074340347
	.text
.globl area
	.type	area, @function
area:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	imull	8(%ebp), %eax
	pushl	%eax
	fildl	(%esp)
	leal	4(%esp), %esp
	fldl	.LC2
	fmulp	%st, %st(1)
	fstps	-4(%ebp)
	flds	-4(%ebp)
	leave
	ret
	.size	area, .-area
	.section	.rodata
.LC4:
	.string	"Radius: %d\n"
.LC5:
	.string	"Circumference: %f\n"
.LC6:
	.string	"Area: %f\n"
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
	movl	$10, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC4, (%esp)
	call	printf
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	circumf
	fstpl	4(%esp)
	movl	$.LC5, (%esp)
	call	printf
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	area
	fstpl	4(%esp)
	movl	$.LC6, (%esp)
	call	printf
	movl	$0, %eax
	addl	$36, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.2 20071124 (Red Hat 4.1.2-42)"
	.section	.note.GNU-stack,"",@progbits

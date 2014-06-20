	.section	.rodata
output:
	.string	"The value a = %d, b = %d\n"
	.text
.globl main
	.type	main, @function
main:

	movl $78, %eax
	movl $32, %ebx
	
	xorl %ebx, %eax
	xorl %eax, %ebx
	xorl %ebx, %eax
		
	pushl %ebx
	pushl %eax
	pushl $output
	call	printf
	

	movl $1, %eax
	movl $0, %ebx
	int $0x80

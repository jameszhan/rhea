.section .data
message:
	.ascii "This is a test message\n"
rmb:
	.long 150
pi:
	.float 3.1415926

.section .text

.globl _start
_start:
	movl $0, %eax
	
	movl $4, %eax
	movl $1, %ebx
	movl $message, %ecx
	movl $23, %edx
	int $0x80
	
	movl $4, %eax
	movl $1, %ebx
	movl $rmb, %ecx
	int $0x80

	movl $4, %eax
	movl $1, %ebx
	movl $pi, %ecx
	movl $23, %edx
	int $0x80
	movl $1, %eax
	movl $0, %ebx
	int $0x80


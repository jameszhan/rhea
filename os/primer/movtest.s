.section .data
	cctv:
		.int 0xFFFF
	value:
		.int 0xFF;
	values:
		.int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60
.section .text
.globl _start
_start:
	nop

	movl value, %ecx
	
	movl $100, %eax
	movl %eax, value

	movl $2, %ecx
	movl values(, %ecx, 4), %eax
		
	movl $cctv, %edi
	movl $23, (%edi)
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80


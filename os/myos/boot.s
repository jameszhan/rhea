sectors = 18

.globl begtext, begdata, begbss, endtext, enddata, endbss
.text
begtext:
.data
begdata:
.bss
begbss:
.text

BOOTSEG	= 0x07c0
entry start
start:
	jmpi go, #BOOTSEG
go:
	mov	ax, cs
	mov	ds, ax
	mov	es, ax
	mov	ss, ax
	
		

msg0:
	.byte 13, 10
	.ascii "Prepare Loading System..."
	.byte 13, 10, 13, 10


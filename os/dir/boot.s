.globl begtext, begdata, begbss, endtext,enddata, endbss
.text
begtext:
.data
begdata:
.bss
begbss:

.text
BOOTSEG = 0x07c0

entry start
start:
	jmpi	go, BOOTSEG
go:	mov	ax, cs
	mov	ds, ax
	mov	es, ax

	mov	cx, #20
	mov	dx, #0x1004
	mov 	bx, #0x0009
	mov	bp, #msg
	mov	ax, #0x1301
	int	0x10
hi:
	mov	ax, #hello
	mov	bp, ax
	mov	cx, #20
	mov	ax, #0x1301
	mov	bx, #0x000f
	mov	dx, #0x1104
	int 	0x10	

loop0:	jmp	loop0

msg:	.ascii "Loading system..."
	.byte 13,10

hello:	.ascii "Hello OS world..."
	.byte 13,10

.org 510
	.word 0xAA55

.text
endtext:
.data
enddata:
.bss
endbss:

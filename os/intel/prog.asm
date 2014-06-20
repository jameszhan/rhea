	mov	ax, 0x1000
	mov	ds, ax
	mov	es, ax
	mov	fs, ax
	
	mov	si, okString
print:
	lodsb
	
	cmp	al, 0
	je	ok

	mov	ah, 0x0e
	mov	bx, 0x00
	int	0x10
	jmp	print

ok:
	jmp 	ok

okString:	
	db "Ok, System started successful!"
	
	times	510-($-$$) db 0
	dw	0xaa55
		
	

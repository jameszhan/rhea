[ORG 0]

jmp start2	; Goto segment 07c0h

msg db 'Program Loaded Succeed! Hello, myos!', $0

start2:
	mov ax, cs
	mov ds, ax
	mov es, ax

	mov si, msg

print:
	lodsb		; AL=string in ds:si
	cmp al, 0	; IF AL==0 then hang
	je hang

	mov ah, 0x0e	; Print AL
	mov bx, 7
	int 0x10

	jmp print 	; print next char
	

hang:
	jmp hang


	times 510-($-$$) db 0
	dw 0AA55h

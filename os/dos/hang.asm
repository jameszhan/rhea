; hang.asm
; A minimal bootstrap

hang:
	jmp hang


times 510 - ($ - $$) db 0;
dw 0AA55h



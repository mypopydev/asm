; alive2.asm
section .data
	msg1 	db 	"Hello, World!",0x0a,0 		; string with NL and 0
	msg2	db	"Alive and Kicking!",0x0a,0 	; string with NL and 0
	radius	dq	357
	pi 	dq	3.14
	fmtstr	db	"%s",0		; string
	fmtflt	db	"%lf",0x0a,0	; float
	fmtint	db 	"%d",0x0a,0	; integer
section .bss
section .text
extern 	printf
	global main
main:
	push	rbp		; function prologue
	mov	rbp, rsp	; function prologue
	
	;; printf string msg1
	mov	rax, 0		; no floating point
	mov	rdi, fmtstr
	mov 	rsi, msg1
	call 	printf

	;; printf string msg2
	mov	rax, 0		; no floating point
	mov	rdi, fmtstr
	mov 	rsi, msg2
	call 	printf
	
	;; printf radius
	mov	rax, 0		; no floating point
	mov	rdi, fmtint
	mov 	rsi, [radius]
	call 	printf
	
	;; printf floating point
	mov	rax, 1		; 1 xmm register used
	movq	xmm0, [pi]
	mov	rdi, fmtflt
	call	printf

	mov	rsp, rbp	; function epilogue
	pop	rbp		; function epilogue
ret

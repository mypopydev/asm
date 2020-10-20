;; betterloop.asm
extern printf	
section .data
	number 	dq 1000000000
	fmt	db "The sum from 0 to %ld is %ld",0x0a,0
section .bss
section .text
	global main
main:
	push rbp
	mov rbp, rsp

	mov rcx, [number]	; initialize rcx with the number
	mov rax, 0		; sum will be in rax
bloop:
	add rax, rcx
	loop bloop		; loop while decreasing rcx with 1
	                        ; until rcx = 0

	mov rdi, fmt
	mov rsi, [number]
	mov rdx, rax
	mov rax, 0
	call printf

	mov rsp, rbp
	pop rbp

	ret

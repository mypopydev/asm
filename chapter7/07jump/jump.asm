; jump.asm
extern printf
section .data
    number1 dq 42
    number2 dq 41
    fmt1 db "NUMBER1 >= NUMBER2",0x0a,0
    fmt2 db "NUMBER1 < NUMBER2",0x0a,0
section .bss
section .text
    global main
main:
    push rbp
    mov rbp, rsp
    
    mov rax, [number1]  ; move the number into register
    mov rbx, [number2]
    cmp rax, rbx        ; compare rax/rbx
    jge greater         ; rax greater or equal go to greater
    
    mov rdi, fmt2
    mov rax, 0
    call printf
    jmp exit
    
greater:
    mov rdi, fmt1
    mov rax, 0
    call printf

exit:
    mov rsp, rbp
    pop rbp
    
ret    

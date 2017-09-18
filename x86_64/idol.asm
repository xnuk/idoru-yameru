; How to build:
;
;     nasm -f elf64 -o idol.o idol.asm && ld -o idoru-yameru idol.o && ./idoru-yameru

section .data
    msg db "나 아이돌 그만둘래!", 0ah

section .text
    global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 27
    syscall
    mov rax, 60
    mov rdi, 0
    syscall

// 아래와 같이 빌드합니다
//
//    as idol.s -o idol.o
//    ld idol.o -o idol
//    ./idol

.global _start
.section .data
msg:
    .ascii "나 아이돌 그만둘래!\n"
    len = . - msg

.section .text
_start:
    mov x0, #1
    adr x1, msg
    mov x2, #len
    mov x8, #64
    svc #0

    mov x0, #0
    mov x8, #93
    svc #0


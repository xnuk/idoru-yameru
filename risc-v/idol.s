# 아래와 같이 빌드합니다
#
#    as idol.s -o idol.o
#    ld idol.o -o idol
#    ./idol

.global _start

.data
msg:
    .ascii "나 아이돌 그만둘래!\n"
    .set msg_len, . - msg

.text
_start:
    li a0, 1
    la a1, msg
    li a2, msg_len
    li a7, 64
    ecall

    li a0, 0
    li a7, 93
    ecall


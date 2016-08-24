// 아래와 같이 빌드합니다
//
//     gcc -m32 idol.s
//     ./a.out

YAMERU:
  .string "나 아이돌 그만둘래!"
  .globl main
main:
  pushl %ebp
  movl %esp, %ebp
  andl $-16, %esp
  subl $16, %esp
  movl $YAMERU, (%esp)
  call puts
  xorl %eax, %eax
  leave
  ret

// 아래와 같이 빌드합니다
//
//     gcc idol.s
//     ./a.out

YAMERU:
  .string "나 아이돌 그만둘래!"
  .global main
main:
  subq $8, %rsp
  movl $YAMERU, %edi
  call puts
  xorl %eax, %eax
  addq $8, %rsp
  ret

; 아래와 같이 빌드합니다
;
;     clang idol.ll
;     ./a.out


target triple = "x86_64-unknown-linux-gnu"

@yameru = private unnamed_addr constant [28 x i8] c"\EB\82\98 \EC\95\84\EC\9D\B4\EB\8F\8C \EA\B7\B8\EB\A7\8C\EB\91\98\EB\9E\98!\00", align 1
declare i32 @puts(i8* nocapture readonly) #1

define i32 @main() #0 {
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @yameru, i64 0, i64 0))
  ret i32 0
}

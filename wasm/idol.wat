;; 아래와 같은 커맨드로 빌드합니다.
;;    wasm-tools parse idol.wat -o idol.wasm
;;
;; wasmtime은 wat 파일도 바로 읽어서 실행할 수 있기 때문에 빌드 안 하고 실행해도 무방합니다.

(module
  (import "wasi_snapshot_preview1" "fd_write" (func $fd_write (param i32 i32 i32 i32) (result i32)))

  (memory 1)
  (export "memory" (memory 0))

  ;; string 데이터
  (data (i32.const 0) "나 아이돌 그만둘래!\n")
  ;; iovs
  (data (i32.const 28) (i32 0)) ;; 데이터 시작 지점
  (data (i32.const 32) (i32 28)) ;; 길이
  ;; write된 바이트 개수 받을 변수
  (data (i32.const 36) (i32 0))

  (func $main
    (call $fd_write
      (i32.const 1) ;; stdout
      (i32.const 28) ;; iovs array 포인터
      (i32.const 1) ;; iovs array 길이
      (i32.const 36) ;; write된 바이트 수 넣을 포인터
    )
    drop ;; 리턴 값 버리기
  )
  (export "" (func $main)) ;; default export로 설정
)

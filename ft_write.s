; ft_write.asm

section .text
    extern __errno_location

    global ft_write

ft_write:
    mov rax, 1          ; システムコール番号 1 (sys_write) をraxに設定します。
    syscall             ; カーネルを呼び出し、write処理を実行します。

    cmp rax, 0
    jge .success        ; rax >= 0 ならば .success ラベルにジャンプ (成功)

.error_handler:

    push rax

    call __errno_location wrt ..plt
    pop rdx
    neg rdx
    mov [rax], rdx
    mov rax, -1

    jmp .end

.success:

.end:
    ret


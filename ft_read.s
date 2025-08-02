section .text
    global ft_read         ; リンカがft_readシンボルを見つけられるように公開
    extern __errno_location ; Cライブラリのerrnoを扱うための外部関数

ft_read:
    mov rax, 0             ; 'read' のシステムコール番号 (0) をraxに設定
    syscall                ; カーネルを呼び出す

    cmp rax, 0             ; raxが0未満かチェック (エラーが発生したか)
    jl .error              ; もしrax < 0 なら、.errorセクションにジャンプ

    ret                    ; 成功。raxには読み込んだバイト数が入っているので、そのままリターン

.error:
    neg rax                ; raxの値を正の数に変換 (例: -9 -> 9)
    push rax               ; errnoの値をスタックに保存
    call __errno_location wrt ..plt ; errno変数のメモリアドレスをraxに取得
    pop rdi                ; 保存しておいたerrnoの値をrdiに戻す
    mov [rax], rdi         ; errnoのメモリアドレスに、エラーコードを設定

    mov rax, -1            ; 関数の戻り値として-1をraxに設定
    ret                    ; リターン

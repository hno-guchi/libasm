section .text
global ft_strcmp

; ft_strcmp(rdi, rsi)
; rdi: 1つ目の文字列 (s1) へのポインタ
; rsi: 2つ目の文字列 (s2) へのポインタ
; 返り値: eax

ft_strcmp:
.loop:
    ; rdiとrsiが指すメモリから1バイトずつ文字を読み込む
    mov     al, [rdi]       ; al = *s1
    mov     cl, [rsi]       ; cl = *s2

    ; 2つの文字を比較する
    cmp     al, cl
    jne     .done           ; 文字が異なればループを終了

    ; 文字がヌル文字かチェックする
    ; (al == cl なので、al が 0 なら cl も 0)
    test    al, al
    je      .done           ; ヌル文字ならループを終了

    ; 次の文字へポインタを進める
    inc     rdi
    inc     rsi
    jmp     .loop           ; ループの先頭に戻る

.done:
    ; 返り値を計算する: (unsigned char)s1 - (unsigned char)s2
    ; movzx命令で8ビットの文字(al, cl)を符号なし32ビット整数として
    ; eax, ecxレジスタに拡張する
    movzx   eax, al         ; eax = (unsigned char) al
    movzx   ecx, cl         ; ecx = (unsigned char) cl

    ; 差を計算する。結果は自動的にeaxに入る
    sub     eax, ecx
    ret

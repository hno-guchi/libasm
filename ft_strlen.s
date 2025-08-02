section .text
global ft_strlen

ft_strlen:
    xor     rax, rax            ; カウンタとなるraxを0にクリア

.loop:
    cmp     byte [rdi + rax], 0 ; 文字列の[rdi + rax]番目の文字が0 (ヌル文字) か比較
    je      .done               ; もしヌル文字ならループを終了
    inc     rax                 ; カウンタを1増やす
    jmp     .loop               ; ループの先頭に戻る

.done:
    ret                         ; 文字列の長さが入っているraxを返す

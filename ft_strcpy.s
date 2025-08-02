section .text
global ft_strcpy

ft_strcpy:
    mov     rax, rdi            ; 戻り値として、コピー先の開始アドレスをraxに保存しておく

.loop:
    mov     cl, byte [rsi]      ; コピー元(rsi)から1バイト読み込み、clレジスタに格納
    mov     byte [rdi], cl      ; clの値をコピー先(rdi)に書き込む
    inc     rdi                 ; コピー先のアドレスを1つ進める (dest++)
    inc     rsi                 ; コピー元のアドレスを1つ進める (src++)
    test    cl, cl              ; コピーした文字(cl)が0 (ヌル文字) かテスト
    jne     .loop               ; ヌル文字でなければループを続ける

    ret                         ; raxに入っているコピー先の開始アドレスを返す

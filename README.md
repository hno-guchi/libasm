# libasm

42の課題
アセンブリ言語の学習

64bitsアセンブリ
the "calling convention"(招集規約？)に注意すること
.s fileを作成すること
nasmでコンパイルすること
-no-pie flagの使用禁止
Intel syntax
library name libasm.a
main関数を作成（提出時にテストを作成すること）

実装するもの
・ft_strlen (man 3 strlen)
・ft_strcpy (man 3 strcpy)
・ft_strcmp (man 3 strcmp)
・ft_write (man 2 write)
・ft_read (man 2 read)
・ft_strdup (man 3 strdup, you can call to malloc)

システムコールで発生したエラーをチェックすること
必要に応じて適切に処理すること

errnoを適切に設定すること
errnoを適切に設定するために、extern ___errorやerrno_locationを呼び出すことができる

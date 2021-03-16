# OS自作入門6日目

今回も書くことはなさそう(甘え)。

と思ったらC言語で使ったことないやつがあったのでそれについて記載することにした。

## *.h

ヘッダファイル。ここに関数宣言や構造体等を記載しておけば重複等をなくすことができる。

## PIC

programmable interrupt controllerの略。設定可能な割り込みコントローラ。

CPUは単独では一つまでしか割り込みを行えない。

PICは８個の割り込み信号を一つの割り込み信号にまとめる装置。

マスタPICとスレーブPICが存在し、マスタPICのIRQ二番目にスレーブPIC８個が接続されている。

### PICのレジスタ

* IMR(interrupt mask register)

割り込み目隠しレジスタ。

8bitがそれぞれのIRQ番号に対応しており、１がたつと信号を無視するようになる。

* ICW

1~4が存在し、合計で４バイトのデータになる。
# 「Let's Build a Simple Database」を読みながら写経しつつ、メモを取る

wyagやって案外楽しかったので、次にこれをやっていく。

言語はC。

## 本家リンク

サイト:[How Does a Database Work? | Let’s Build a Simple Database](https://cstack.github.io/db_tutorial/)

リポジトリ:[GitHub - cstack/db_tutorial: Writing a sqlite clone from scratch in C](https://github.com/cstack/db_tutorial)

## Part1

ここでは、おそらく動作確認もかねてか、replを書いていくそうだ。

また、このデータベースはSqliteをモデルに作成し、

データベースを一つのファイルに保存するらしい。

アーキテクチャは以下リンク右あたりにある図の通り。

[Zipvfs: How ZIPVFS Works](https://www.sqlite.org/zipvfs/doc/trunk/www/howitworks.wiki)

入力はSQLであり、

### フロントエンド

* tokenizer

* parser

* code generator

コードジェネレータって何？って思って調べたけど全然出てこなかったのでなんもわからんかった。

とにかく、ここではSQLを解析して、何かのコード(VM向け)を生成するってことなのかな？

### バックエンド

これらは説明があった。

#### vm

virtual machine。

フロントエンドから送られてきたバイトコードをテーブルまたはインデックスのb-treeに変換して?格納する。

#### b-tree

データ構造...のはずだが、ここではそれ以外にもpagerにコマンドを発行してディスクからデータを取得したり保存したりできる。

#### pager

データのページを読み書きしたりするコマンドを受け取り、解釈する。

それにより、オフセットを用いてRead/Writeを行う。

また、解釈中には最近アクセスしたページについてはキャッシュとしてメモリに保存したり、いつ消したり等の

ページのキャッシュの管理も行う。

#### os-interface

文字通り。ちなみに今回は複数OSのサポートはないらしい。当たり前やが。

## Part2

## 参考

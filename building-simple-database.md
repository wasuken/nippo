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

* トークナイザ

* パーサ

* コードジェネレータ

## 参考

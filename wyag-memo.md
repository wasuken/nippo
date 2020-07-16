# Write yourself a gitを写経しつつ、読んだ

## 本家リンク

サイト:[Write yourself a Git!](https://wyag.thb.lt/)

リポジトリ:[GitHub - thblt/write-yourself-a-git: Learn Git by reimplementing it from scratch](https://github.com/thblt/write-yourself-a-git)

## 1

Gitのコア機能のみを実装していくらしい。

## 2

そういえば、Pythonって結構標準ライブラリが充実してると思った。

というのもwyagをClojureで途中まで書いてたんだけど、

Clojureの標準ライブラリにはないもの結構あった。

特にzlibとargparse。

他にも微妙な差異とかある。

てかこれはどのプロジェクトのリライトにも言えることだろうと思うけど、

別の言語で同じような書き方をするのはあまりおすすめできない。

そんな当たり前なことに少し前気がついた。

## 3

initを実装する。

ここでは、GitRepositoryというクラスを作成している。

このクラスは<project-root>/.git/configのデータやら、バージョン管理対象のファイルパスやら持ってるクラス(適当)

ここらへんは当然だけど.git付近のファイル/ディレクトリのIOやらチェックやらがほとんど。

あと、repo_findはここから先しばらくでてくるんじゃないんすかね。

git管理下のプロジェクトルート下ならどこからでも簡単にGitRepositoryクラスが手に入るからね。

## 4

cat-fileとhash-objectを書いていく。

それぞれ、実際のgitコマンドではあまり使わないと思う。少なくとも私は使ったことないし、

wyag記事中でも低レベルな、いわゆる配管と呼ばれているコマンドらしい。

[Git - Packfile](https://git-scm.com/book/ja/v2/Git%E3%81%AE%E5%86%85%E5%81%B4-Packfile)

ここにもある通り、

GitのObjectには種類があり、blob, commit, tag, treeとある。

[Git - Gitオブジェクト](https://git-scm.com/book/ja/v2/Git%E3%81%AE%E5%86%85%E5%81%B4-Git%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88)

最初に書いとくけど、git cat-file -p <hash>で簡単に内容を確認できるし、

-p を-tに変えるとオブジェクトの種類を出力してくれる。

なお、wyagの実装ではこれらを書き込む際は圧縮してる(zlib)。

### blob

blobはファイルを圧縮したもの、つまり、ファイルの中身そのものが入ってる。

treeはファイルシステムっぽい木構造のやつ。こんな感じ。

```

$ git cat-file -p 25fe1f9884c17c70b8784d15e35298fd8003f8ad
100644 blob 51176886f037d0e412d37e3ca560f595b11b7dc7	2020-01-13.md
100644 blob d4bd4b60cf209519773d5cfb4106672efe4a969b	2020-01-14.md
100644 blob 100b90bc2a3519e7a4ce8294d9b7564db1aa34b7	2020-01-15.md
100644 blob 5fe5034197d41be8876aaf5f1f1b8a06614c7ecc	2020-01-16.md
100644 blob 757f1c543932efa9e69c429b7ce6092ec7a81989	2020-01-17.md
100644 blob 4dbf80551f3293f854635b9bbbdcffa919076146	docker-dev-audio-thinking.md
100644 blob fbb54a8f5d089145396e26fd41f72545e7561a4f	lisp-music-1.md
100644 blob 20b6c51c7a4d283bb10235a4a9193db5d73099b9	lisp-music-2.md
040000 tree 6c67859c318caeb208ad430727c3b7cb5bfe4469	nippo_backup
100644 blob 2add9b9ba68ffb7b0698fe23adc458d10f22e561	output-technique-reading-impressions-3.md

```

### commit

commitは、保存するtree、author、committer、そしてコミットメッセージを保存する。

ちなみにこんな感じ。

```

$ git cat-file -p 2503fd4a11b5a314fed13eb82abde74fab348f6d
tree cc9d74a956f62d53990acd85fb7e50b749b2ab3c
parent 61491c8ff9e29085e85e374100ded91ad4f58df3
author wasuken <wevorence@gmail.com> 1580568991 +0900
committer wasuken <wevorence@gmail.com> 1580568991 +0900

c.

```

### tag

ここの検証？で少し時間かかった。


というのも、git tag testで作成したtagのオブジェクトをみようとしても

思った通りのフォーマットにはならなかったからだ。

```

$ git cat-file -p test
tree 2139ef4ba96cabe84cef034b9e28adf7a2a63210
parent bd94f6c1071c81e5f363d4f7629a9b8cb5320bef
author wasuken <wevorence@gmail.com> 1594825062 +0900
committer wasuken <wevorence@gmail.com> 1594825062 +0900

commit.

```

なんでじゃぁ＾〜。

と思いながらいろいろやってたらできた。

どうやらメッセージをいれないといかんらしい。なぜ？

```

$ git tag test2 -m "This is test2"
$ git cat-file -p test2
object 0fc0fda19e7fc7df09195d70e56e166eddee896b
type commit
tag test2
tagger wasuken <wevorence@gmail.com> 1594910197 +0900

This is test2

```

### タグの種類

これは後の章に書いてあるやつだけど、タグにはいくつか種類がある。

[Git - タグ](https://git-scm.com/book/ja/v2/Git-%E3%81%AE%E5%9F%BA%E6%9C%AC-%E3%82%BF%E3%82%B0)

#### 軽量タグ

commitオブジェクトの参照をそのまま保存したやつ。

cat-fileしても参照してるcommitオブジェクトの内容がでてくる。

#### 注釈付きのタグ

丁寧にtagオブジェクトまで拵えて、誰が作ったタグなのかと、そのメッセージまで書いてあるやつ。

cat-fileするとtagオブジェクトの内容がでてくる。

# その他リンク

[Git - Gitオブジェクト](https://git-scm.com/book/ja/v2/Git%E3%81%AE%E5%86%85%E5%81%B4-Git%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88)

[Git - タグ](https://git-scm.com/book/ja/v2/Git-%E3%81%AE%E5%9F%BA%E6%9C%AC-%E3%82%BF%E3%82%B0)

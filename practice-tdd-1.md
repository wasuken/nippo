# 実践テスト駆動開発

[実践テスト駆動開発 (Object Oriented SELECTION) | Steve Freeman, Nat Pryce, 和智 右桂, 高木 正弘 |本 | 通販 | Amazon](https://www.amazon.co.jp/%E5%AE%9F%E8%B7%B5%E3%83%86%E3%82%B9%E3%83%88%E9%A7%86%E5%8B%95%E9%96%8B%E7%99%BA-Object-Oriented-SELECTION-Freeman/dp/4798124583)

やっていき。

## 一章

### 学習

* 実戦で並行して理解を進めなければならない。

経験を積み重ね、予期せぬ変化を予測しなければならない。

### フィードバックは重要

取得したフィードバックを元にシステムにそれを適用していく。

このサイクルを繰り返す必要がある。

### 変化を支えるプラクティス

* 常にテストを実施。

[リグレッション (regression)](https://wa3.i-3-i.info/word12330.html)

エラーを最小もしくは0にする。

* 自動化して、テストのコストを最小限にする

* コードをシンプルに、常に「リファクタリング」を行う。

これらの課題はTDDで解決できるという。

### TDD

#### 流れ

ユニットテストを書く、テストが通るように実装する、コードをリファクタリングして、テストに通ったフィーチャの実装をシンプルにする。

これらを繰り返す。

TDDを採用することにより、実装と設計の面でのフィードバックを得られる。

#### テストを書くことによる恩恵

* 受入基準の明確化。

* 疎結合のコンポーネントを書くようになる。

テストを書くとわかるが、結合されているとテスト書くのがキツくなる。

* テストによりその機能が実行可能な説明になる。

* 網羅的なリグレッションテストスイートが厚くなる。

#### テストを実行することによる恩恵

* 早めのフィードバック(エラー検出)。

* 作業の官僚の把握が楽になる。

### 全体像

* 失敗するテストを書く。

フィーチャーを実装する時には、さっきの流れに一つ追加される流れになる。

1-失敗する受入テストを書く ->
	(2-失敗するユニットテストを書く -> 3-テストを通るようにする -> 4-リファクタリングする->2)->1

よくわかってないことを教えるような図を書くのやめろ。

### エンドツーエンドテスト

UIからデータを入れてテストしたり、サードパーティのシステムからメッセージを送信したりするテスト。

受入テストを書いたから終わりではなく、特に厳格な企業ではこれが始まりである。

### テストのレベル

* 受入テスト

システム全体が機能するか。

* インテグレーションテスト

変更できないコードに対して、書いたコードが機能するか。

* ユニットテスト

オブジェクトは正しく振る舞っているか。また、扱いやすいか。

### 外側と内側の質

#### 外側

* 顧客のニーズに答えられているかどうか。

#### 内側

* 開発者、管理者のニーズに答えられているかどうか。

## 二章

### オブジェクトの網の目

* 重要なのはメッセージング(アラン・ケイ)。

どうやるかではなく、何をしたいか。

### 値とオブジェクト

* 値とは、変化しない量をモデル化した不変のインスタンス。

* オブジェクトとは、可変な状態を用いたもの。あるオブジェクト同士が状態が同じであったとしてもアイデンティティは異なる。

### メッセージに従うこと

コミュニケーションパターン...?

ここはまじで訳わからんし、調べようもなかった。

### デメテルの掟

何をしてほしいか記述する。どうやってそうするかは呼び出したオブジェクトに任せる。

いわゆる情報の隠蔽はこれである(?)。

### 時にはおきてを破る

命じることができない時には仕方なく書く。

### オブジェクト間のユニットテスト

縛りすぎて、テストできなくなる箇所ができてもおかしくない。

そんな時はモックオブジェクトを使う。
# scheme-intepretor

[ここ](https://ja.wikibooks.org/wiki/48%E6%99%82%E9%96%93%E3%81%A7Scheme%E3%82%92%E6%9B%B8%E3%81%93%E3%81%86)をみて
書きたいと思ったから書いた。

## 初めの一歩

ボクシングではない。

[初めの一歩](https://ja.wikibooks.org/wiki/48%E6%99%82%E9%96%93%E3%81%A7Scheme%E3%82%92%E6%9B%B8%E3%81%93%E3%81%86/%E6%9C%80%E5%88%9D%E3%81%AE%E4%B8%80%E6%AD%A9)


ここで理解できなかったことは特にないと思う。

## 構文解析

[構文解析](https://ja.wikibooks.org/wiki/48%E6%99%82%E9%96%93%E3%81%A7Scheme%E3%82%92%E6%9B%B8%E3%81%93%E3%81%86/%E6%A7%8B%E6%96%87%E8%A7%A3%E6%9E%90)

ここからいきなり長くなってわけわからんくなった。

けど混乱していても時間が勝手に立つだけなのでとりあえずわからないところをまとめてみることにする。

### oneOf

こいつはこいつ単体で動作しない何かという認識。実際parse関数と組み合わせて利用している。

replで実行してみたが、エラーを吐いた。

実証はできなかったが、理解としては恐らくここの通りで

>oneOfは引数で与えられた文字列中のどれか一文字を認識します

parseと組み合わせることで、認識して、Either型で返してるんだと思う(?)。

自分でも何言ってるのかよくわからない。

### parse

こいつも謎だ。何いきなりしゃしゃり出てきてるのだ。

しかもoneOfもだけどWiki内のリンク割と死んでる。ググったけど。

### liftM

はじめ見たとき？？？ってなったのでググった。

>モナドに入っている値に対して、関数を持ち上げることで適用します。

[ここから抜粋](https://qiita.com/7shi/items/4408b76624067c17e933#liftm)

なるほど。

今日はここまで。

## 参考

[48時間でSchemeを書こう](https://ja.wikibooks.org/wiki/48%E6%99%82%E9%96%93%E3%81%A7Scheme%E3%82%92%E6%9B%B8%E3%81%93%E3%81%86)

[haskell parsec個人メモ](https://qiita.com/elipmoc101/items/fedc068523477b1617e1)

[liftMを学ぶ(モナドに関数を適用する)](https://sirocco.hatenadiary.org/entry/20110226/1298752244)

[Haskell モナド変換子 超入門](https://qiita.com/7shi/items/4408b76624067c17e933#liftm)
# 挫折しない統計学入門

## 多変量解析と相関関係

大小様々な値になる**変量**の複数の組み合わせて表されているデータ、**多変量データ**

の分布を取り扱う統計手法を**多変量解析**という。

また、変量間の増減の傾向を**相関関係**いい、一方の変量が多く、

かつもう一方が多いときは**正の相関関係**といい、一方の変量が多く、

かつもう一方が小さい場合は**負の相関関係**という。

## 散布図

多変量データの分布を眼に見えるように表現するのに使われるのが**散布図**。

また、一直線に並ぶような散布図を強い相関、そうでないものを弱い相関と呼ぶ。

なお、右にゆくにつれてあがるのが正の相関、右から下へ落ちていく感じのが負の相関という。

そしてそれらを表す数値が**相関係数**。

## 回帰分析

二つ以上の変量の組みで表されるデータがあるとき、ある変量と他の変量との

関係を求める方法の一つ。

回帰分析をすることで、一方の変量によって、他方の変量がどのように変わるかがわかる。

y = a + bxみたいな回帰を線形単回帰という。

モデルと測定値の差の二乗を最小とする**最小二乗法**という。

> 最小二乗法とは，データの組 (xi,yi) が多数与えられたときに，x と y の関係を表すもっともらしい関数 y=f(x) を求める方法です。

> 引用元: [最小二乗法（直線）の簡単な説明 | 高校数学の美しい物語](https://mathtrain.jp/leastsquares)

## 決定係数

> 決定係数とは、回帰分析によって求められた目的変数の予測値が、実際の目的変数の値とどのくらい一致しているかを表している指標です。

> 引用元: [決定係数が高ければOKは危ない！決定係数を正しく理解しよう | テレビCM効果の可視化「サイカ マゼラン」](https://xica.net/magellan/marketing-idea/stats/about-coefficient-of-determination/#:~:text=%E6%B1%BA%E5%AE%9A%E4%BF%82%E6%95%B0%E3%81%A8%E3%81%AF%E3%80%81%E5%9B%9E%E5%B8%B0,%E9%87%8D%E5%9B%9E%E5%B8%B0%E5%88%86%E6%9E%90%E3%81%8C%E3%81%82%E3%82%8A%E3%81%BE%E3%81%99%E3%80%82)
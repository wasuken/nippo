# 実用Common Lispメモ

## 一言メモ

* defparameterは不変、defvarは変更前提で使う。

* assocは'((hgoe 10) (fuga 20))みたいなリストを検索するときに使う。

	```lisp
	(assoc 'hoge '((hoge 10) (fuga 20))) ;#=> (hoge 10)a
	```

* acons

	[CLHS: Function ACONS](http://www.lispworks.com/documentation/HyperSpec/Body/f_acons.htm)

	簡単に表現すると、(acons [key] [value] [alist])。[alist]に'([key] . [value])が入る。

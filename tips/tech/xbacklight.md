# バックライト調整

gnomeとかのマネージャいれたらこんなこと考えるまでもないと思うんだけど、

Awesomeとかだと適当にいれるとそんなのついてこない。

そんなときのcli1ツール。

## 環境

* OS: Arch Linux

## xbacklight

インストール

```shell
$ yay -S acpilight
```

```shell
$ yay -Qii acpilight
Name            : acpilight
Version         : 1.2-2
Description     : a backward-compatible xbacklight replacement based on ACPI
Architecture    : any
URL             : https://gitlab.com/wavexx/acpilight
Licenses        : GPL3
Groups          : None
Provides        : xorg-xbacklight
Depends On      : python
Optional Deps   : None
Required By     : None
Optional For    : None
Conflicts With  : xorg-xbacklight
Replaces        : None
Installed Size  : 13.04 KiB
Packager        : Felix Yan <felixonmars@archlinux.org>
Build Date      : Tue 07 Jul 2020 10:20:02 PM JST
Install Date    : Tue 20 Apr 2021 08:50:32 AM JST
Install Reason  : Explicitly installed
Install Script  : Yes
Validated By    : Signature
Backup Files    :
(none)
```

リポジトリ見てみたら、Pythonで書かれてた。

以下、最低限使い方。

### 現在値取得

```shell
$ xbacklight getf
```

getだと整数で取得される。

### 現在値更新

```shell
# xbacklight set 30
```

setは整数でも小数でも指定できる。

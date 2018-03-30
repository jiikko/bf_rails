# README
* スキャルピング支援ツール
* 直近60分の値幅を数字で見れる
* WEBから任意の幅で注文ができる

## アーキテクチャ(予定)
* ポーリングして画面をリフレッシュする
```
[ビットフライヤー]
  |    \
  |     \
[WEB] --- [resque]
  |     /
  |    /
[MySQL]
```

## Install
```
bundle exec rails bf_engine:install:migrations
bundle exec rails db:migrate
```

## Usage
```
bundle exec foreman start
```

## メモ
* 買いから入るので大きな下落に巻き込まれると終了する
* 直近15分くらいの幅しか見ていないので落ちそうだと思ったら自分で停止しなければならぬ

## TODO
* foremanが停止したらjsが無限にポーリングするのでjsで例外処理を行ってその旨を表示する
* ステータスの取得をバックグラウンドで実行したい
  * 今はビューから同期通信で実行している

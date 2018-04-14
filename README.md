# README
* BF APIを使った注文ツール

## アーキテクチャ
* ポーリングして画面をリフレッシュする
```
[BF API]
  |    \
  |     \
[WEB] --- [Resque]
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
* foreman 管理下のプロセスが終了したらresqueも終了して売りを発注しないまま終了する、というのがあるので起動コマンドは別で作成する
  * foremanで resqueを起動しない
* 注文一覧をクリックしたら詳細がスライドして出てくるようにする
* 発注クリックしたらテーブルに1行追加する
  * クリック後にリアクションがないので連打しがちなのでリアクションが欲しい

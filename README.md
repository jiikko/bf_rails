# README
* BF APIを使った注文ツール

## アーキテクチャ
```
[BF API]
  |     \
  |      \
[Rails] --- [Resque]
  |      /
  |     /
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

## TODO
* foreman 管理下のプロセスが終了したらresqueも終了して売りを発注しないまま終了する、というのがあるので起動コマンドは別で作成する
  * foremanで resqueを起動しない
* 注文一覧をクリックしたら詳細がスライドして出てくるようにする
* 設定画面を別ページの設ける
* ページにテーマを当てることができる

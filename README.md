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
* foremanを停止した直後にたまにresqueが残り続けることがあって、そのresqueにはpipeがbrokenしているらしくエラーになる
  * after_forkで接続チェックして破棄する？
* ページにテーマを当てることができる

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
$ bundle install
$ bundle exec rails bf_engine:install:migrations
$ bundle exec rails db:migrate
```

## Usage
```
$ bundle exec foreman start
```
Open http://localhost:3000

## メモ
* 買いから入るので大きな下落に巻き込まれると終了する

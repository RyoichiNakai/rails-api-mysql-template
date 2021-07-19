# Rails API and MySQL Docker Template

## 概要

Rails6.0のAPIモードとMySQL5.7を接続するためのDockerテンプレート

## Docker環境構築&基本操作

### `.env`の作成

以下のように`.env`に必要な項目を記述する

```text
MYSQL_ROOT_PASSWORD={ルートパスワード}
MYSQL_DATABASE={DBの名前}
MYSQL_USER={MySQLユーザ名}
MYSQL_PASSWORD={MySQLパスワード}
```

`MYSQL_USER=root`としてしまうと　後述の`docker-compose`時に怒られるので，避けるようにすること．

### Dockerを使えるかの確認

`docker`/`docker-compose`が使えるかの確認

```zsh
docker -v
docker-compose -v
```

`docker`が使えない場合は，[こちら](https://hub.docker.com/editions/community/docker-ce-desktop-mac) から`Docker for Desktop`をインストール  
`docker-compose`を使えない場合は，以下のコマンドを使用して，インストール

```zsh
brew install docker-compose
```

### イメージをビルド

api/Dockerfileを利用して，Ruby2.7環境のイメージを作成  
キャッシュを反映させたくない場合は，下のコマンドを実行する

```zsh
docker-compose build
# docker-compose build --no-cache
```

後述の`docker-compose up`時にビルドが走るので，しなくてもいい

### コンテナを立ち上げる

コンテナの立ち上げ

```zsh
docker-compose up
```

コンテナの一覧を表示する  
`Container ID`をコピーしておく

```zsh
docker ps -a
```

コンテナの中に入る

```zsh
docker exec -it [Container ID] bash
```

> 初回実行の際は，後述の**DBの生成**を必ず行うこと

コンテナを停止する(`Docker for Desktop`でGUI上でコンテナやイメージを削除することも可能）

```zsh
docker-compose down
```

## Railsの操作

### コンテナの中から操作

- DBの生成（**初回`docker-compose up`時に必ず行うこと**）

```zsh
rails db:create
```

- サーバの起動

```zsh
rails s
```

- ルーティングの確認

```zsh
rails routes
```

- DBマイグレーション

```zsh
rails db:migrate
```

- モジュールをインストール

```zsh
bundle install
```

- モデルの作成

```zsh
rails g model {作成したいモデル名(単数系)}
```

- コントローラの作成

```zsh
rails g controller {作成したいコントローラ名(複数形)}
```

- マイグレーションファイルの作成
    - 詳しい説明は[こちら](https://pikawaka.com/rails/migration)
    
```zsh
rails g migration {マイグレーションのクラス名}
```

### コンテナの外から操作

```zsh
docker-compose run api {実行したRailsのコマンド}
```

## Rails APIについて

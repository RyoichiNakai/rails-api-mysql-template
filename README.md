# Rails API and MySQL Docker Template

## 概要

Rails6.0のAPIモードとMySQL5.7を接続するためのDockerテンプレート

![image](https://user-images.githubusercontent.com/49640294/126355486-bbb7f883-c74b-4f6d-aff2-12c7bbc3fcf5.png)

## Docker環境構築&基本操作

### `.env`の作成

以下のように`.env`に必要な項目を記述する

```text
MYSQL_ROOT_PASSWORD={ルートパスワード}
MYSQL_DATABASE={DBの名前}
MYSQL_USER={MySQLユーザ名}
MYSQL_PASSWORD={MySQLパスワード}
```

- `MYSQL_USER=root`としてしまうと　後述の`docker-compose`時に怒られるので，避けるようにすること
- `docker-compose.yml`と同じ階層で作成するようにこと

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

※ Homebrewは事前にインストールしておいてください

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

### 初回コンテナ立ち上げ時に必ず行うこと

コンテナを立ち上げ、コンテナの中に入ってから以下のコマンドを実行して、MySQLとの接続を行う

```zsh
rails db:create
```

### コンテナの中から操作

- サーバの起動
  - `-b`で`0.0.0.0`をバインドしないと，コンテナ外からアクセスできない

```zsh
rails s -b 0.0.0.0
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

- MySQLへの接続

```zsh
rails db
```

### コンテナの外から操作

```zsh
docker-compose run api {実行したRailsのコマンド}
```

## Rails APIについて

### 基本的な操作

> Railsで超簡単API  
> <https://qiita.com/k-penguin-sato/items/adba7a1a1ecc3582a9c9>

## RubocopとSolargraph

RubocopはRubyのコード整形ツールで、以下のようにコードが汚い時は、指摘してくれたり、自動修正を行ってくれます

![image](https://user-images.githubusercontent.com/49640294/126646341-6d961d6a-392e-4cc5-a8bd-da1af9890d0c.png)

またSolargraphはRubyのコード保管ツールです

### 使用方法

Docker環境なので、ローカル環境のターミナルで以下のコマンドを実行し、2つのツールを使用

#### rbenvのインストール

すでにインストールしている場合は、1つ目のコマンドのみ実行  
インストールしていない場合は、[こちら](https://qiita.com/Kodak_tmo/items/73147ed4f0eec54d6e94)に使い方が記載されています

```zsh
brew update && brew upgrade ruby-build
brew install rbenv
```

#### local環境に`api/.ruby-version`と同じバージョンをインストール

```zsh
rbenv install 2.7.4
rbenv global 2.7.4
```

### 必要なパッケージをインストール

```zsh
gem install rubocop
gem install rubocop-performance
gem install rubocop-rails
gem install solargraph
```

### VSCodeで以下のプラグインをインストール

- Ruby
- Ruby on Rails
- endwise
- ruby-rubocop
- Ruby Solargraph

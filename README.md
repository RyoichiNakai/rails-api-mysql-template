# Rails API and MySQL Docker Template

## 概要

Rails6.0のAPIモードとMySQL5.7を接続するためのDockerテンプレート

## Docker環境構築

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

後述の`docker-compose`時にビルドが走るので，しなくてもいい

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

コンテナを停止する(`Docker for Desktop`でGUI上でコンテナやイメージを削除することも可能）

```zsh
docker-compose down
```


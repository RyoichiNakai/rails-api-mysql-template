# Rails API and MySQL Docker Template

Rails6のAPIモードとMySQL5.7を接続するためのDockerテンプレート

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

### Dockerを使えるかを確認
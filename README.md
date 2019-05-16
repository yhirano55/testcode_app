# testcode app

## Setup

```
$ bundle install
$ bundle exec rails db:create db:migrate
```

## API

```
$ curl -X localhost:3000/api/v1/auth --data 'email=admin@example.com' --data 'password=password'
```

### 仕様

#### 概要

リクエストパラメーター email と password を受け付け、emailからユーザーを検索し、ユーザーが存在したらパスワードで認証する

1. 認証に成功したら、JSON形式でアクセストークンを返す（HTTPステータスコード 200）
2. 認証に失敗したら、JSON形式でエラーメッセージを返す（HTTPステータスコード 401）
2. ユーザーを検索して存在しなければ、JSON形式でエラーメッセージを返す（HTTP ステータスコード 404）
3. ユーザーを検索して存在するもBANされている場合は、JSON形式でエラーメッセージを返す（HTTP ステータスコード 403）

### Userデータの作り方

```
$ bundle exec rails runner 'User.create(email: "admin@example.com", password: "password")'
```

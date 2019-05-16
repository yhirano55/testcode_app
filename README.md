# testcode app

コントローラテスティングとデバッグ方法を学ぶ

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

## byebug

- デバッグツール
- Ruby on Railsには、byebugというgemがGemfileに書かれているので利用できる
- Sinatraで利用したい場合は、Gemfileに追加すれば利用できる
- コードの途中で `debugger` と書くと、そこで処理が停止して、デバッグができる（JavaScriptと同じ）
- `exit` で終了する
- `n` で次の行に進む
- `s` で次のループに進む

### 参考情報

- https://github.com/deivid-rodriguez/byebug#byebugs-commands
- https://qiita.com/TYuko/items/d46f5dc91dd488574273

### ActiveRecord

```
user = User.new
user.email = "admin@example.com"
user.password = "password"
user.save

User.create(email: "admin@example.com", password: "password")

user = User.find(1)
user = User.find_by(email: 'admin@example.com')

user.update(email: 'foobar@example.com')
user.destroy

users = User.all
banned_users = User.where(banned: false).all
not_banned_users = User.where(banned: true).all

user = User.first
user = User.limit(3)

user = User.order(id: :asc) # 昇順
user = User.order(id: :desc) # 降順
```

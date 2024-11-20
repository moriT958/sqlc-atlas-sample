# sqlc + atlas
sqlcとatlasを使用したマイグレーション環境のテスト

# sqlcメモ
- `sqlc.yml`を編集し、設定を行う。
- DDLを記述する。(`schema.sql`)
- DB操作を記述する。(`query.sql`)
- `sqlc generate`で、goコードを生成。

# Atlasメモ
- `atlas.hcl`を編集する。`env`を一つ以上定義する。: atlasの設定

## スキーマ管理系コマンド
- `atlas schema inspect --env [envname]`: 現在のスキーマ状態を確認
- `atlas schema apply --env [envname]`: DDLを現在のスキーマに適応

## マイグレーション系コマンド
- `atlas migrate diff --env [envname]`: DDLと現在のスキーマの差分を記録
- `atlas migrate apply --env [envname]`: 記録されたマイグレーションファイルを現在のスキーマに適応
- `atlas migrate validate --env [envname]`: マイグレーションファイルのチェックサム検証
- `atlas migrate hash --env [envname]`: チェックサムの再生成

# どうやって使っていくか？
- まず、DDLとクエリを記述する。(`schema.sql`, `query.sql`)
- `sqlc generate`でコードを生成する。
- `atlas schema apply`でスキーマを適応。
- スキーマ変更時は、DDLを編集し、`atlas migrate diff`で記録を残した後、`atlas migrate apply`で適応。
- スキーマ変更後、クエリ記述ファイルを編集し、`sqlc generate`で再生成。

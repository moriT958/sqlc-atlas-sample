# sqlc + atlas

sqlc と atlas を使用したマイグレーション環境のテスト

# sqlc メモ

- `sqlc.yml`を編集し、設定を行う。
- DDL を記述する。(`schema.sql`)
- DB 操作を記述する。(`query.sql`)
- `sqlc generate`で、go コードを生成。

# Atlas メモ

- `atlas.hcl`を編集する。`env`を一つ以上定義する。: atlas の設定

## スキーマ管理系コマンド

- `atlas schema inspect --env [envname]`: 現在のスキーマ状態を確認
- `atlas schema apply --env [envname]`: DDL を現在のスキーマに適応

## マイグレーション系コマンド

- `atlas migrate diff --env [envname]`: DDL と現在のスキーマの差分を記録
- `atlas migrate apply --env [envname]`: 記録されたマイグレーションファイルを現在のスキーマに適応
- `atlas migrate validate --env [envname]`: マイグレーションファイルのチェックサム検証
- `atlas migrate hash --env [envname]`: チェックサムの再生成

# どうやって使っていくか？

- まず、DDL とクエリを記述する。(`schema.sql`, `query.sql`)
- `sqlc generate`でコードを生成する。
- `atlas schema apply`でスキーマを適応。
- スキーマ変更時は、DDL を編集し、`atlas migrate diff`で記録を残した後、`atlas migrate apply`で適応。
- スキーマ変更後、クエリ記述ファイルを編集し、`sqlc generate`で再生成。

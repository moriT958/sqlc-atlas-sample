# Atlasコマンド復習

# 使ったコマンドまとめ
- `atlas.hcl`を編集する。`env`を一つ以上定義する。: atlasの設定

- スキーマ系
- `atlas schema inspect --env [envname] > [filename]`: 初期DBの反映
- `atlas schema apply --env [envname]`: 生成された理想スキーマファイルを編集し適応。

- マイグレーション系
- `atlas migrate diff --env [envname]`: 理想スキーマファイルとマイグレーションファイルの差分を記録
- `atlas migrate apply --env [envname]`: マイグレーションファイルをDBに適応
- `atlas migrate validate --env [envname]`: マイグレーションファイルのチェックサム検証
- `atlas migrate hash --env [envname]`: チェックサムの再生成

# 注意点
- atlas-go-sdkを使う場合は、理想スキーマファイルではなく、マイグレーションからテーブル更新したほうがいい。
- 理由はまず、HCLの整数型は`int`だが、postgresでは`integer`である。
- そのため、最初にHCLを記述した際は`int`で記述していても、`atlas inspect`した際に`integer`に上書きされてしまう。
- `integer`に上書きされた状態のまま、go側でHCLファイルを読み込もうとすると、「HCLでは`integer`型は存在しません。」というエラーになるため。
- したがって、SQL形式で記述されたマイグレーションファイルからスキーマ更新を行なったほうが、ラクである。

# どうやって使っていくか？
- 理想スキーマファイルは手動でしか触らない。(intがintegerで上書きされないように)
- もしくは、最初から理想スキーマをHCLではなくSQLで書く。
- inspectするときは、ターミナルで確認するのに留める。
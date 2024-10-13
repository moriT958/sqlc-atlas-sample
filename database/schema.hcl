schema "public" {
  comment = "standard public schema"
}

table "orders" {
  schema = schema.public
  column "id" {
    null = false
    type = int
  }
  column "name" {
    null = true
    type = varchar(20)
  }
  column "user_id" {
    null = false
    type = int
  }
  column "product_id" {
    null = false
    type = int
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "product_fk" {
    columns     = [column.product_id]
    ref_columns = [table.products.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
  foreign_key "user_fk" {
    columns     = [column.user_id]
    ref_columns = [table.users.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
}

table "products" {
  schema = schema.public
  column "id" {
    null = false
    type = int
  }
  column "name" {
    null = true
    type = varchar(20)
  }
  column "description" {
    null = false
    type = text
  }
  column "quantity" {
    null = false
    type = int
  }
  primary_key {
    columns = [column.id]
  }
}

table "users" {
  schema = schema.public
  column "id" {
    null = false
    type = int
  }
  column "username" {
    null = false
    type = varchar(20)
  }
  column "email" {
    null = true
    type = varchar(20)
  }
  primary_key {
    columns = [column.id]
  }
}

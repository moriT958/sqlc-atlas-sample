env "test" {
    src = "file://database/schema.hcl"
    url = "postgres://postgres:postgres@localhost:5432/mydb?sslmode=disable"
    dev = "docker://postgres/15/dev"

    migration {
        dir = "file://database/migrations"
    }
}
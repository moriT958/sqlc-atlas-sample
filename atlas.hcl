env "test" {
    src = "file://schema.sql"
    url = "postgres://postgres:postgres@localhost:5432/mydb?sslmode=disable"
    dev = "docker://postgres/15/dev"

    migration {
        dir = "file://migrations"
    }
}
package main

import (
	"atlas-test/tutorial"
	"context"
	"database/sql"
	"log"
	"reflect"

	_ "github.com/lib/pq"
)

func run() error {
	ctx := context.Background()

	uri := "postgresql://postgres:postgres@127.0.0.1:5432/mydb?sslmode=disable"
	conn, err := sql.Open("postgres", uri)
	if err != nil {
		return err
	}
	defer conn.Close()

	queries := tutorial.New(conn)

	// list all authors
	authors, err := queries.ListAuthors(ctx)
	if err != nil {
		return err
	}
	log.Println(authors)

	// create an author
	insertedAuthor, err := queries.CreateAuthor(ctx, tutorial.CreateAuthorParams{
		Name: "Brian Kernighan",
		Age:  sql.NullInt32{Int32: 3, Valid: true},
		Bio:  sql.NullString{String: "Co-author of The C Programming Language and The Go Programming Language", Valid: true},
	})
	if err != nil {
		return err
	}
	log.Println(insertedAuthor)

	// get the author we just inserted
	fetchedAuthor, err := queries.GetAuthor(ctx, insertedAuthor.ID)
	if err != nil {
		return err
	}

	// prints true
	log.Println(reflect.DeepEqual(insertedAuthor, fetchedAuthor))
	return nil
}

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}
}

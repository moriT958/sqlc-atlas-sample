package main

import (
	"context"
	"fmt"
	"log"
	"os"

	"ariga.io/atlas-go-sdk/atlasexec"
)

func main() {

	// テストの時に使う
	workdir, err := atlasexec.NewWorkingDir(
		atlasexec.WithMigrations(
			os.DirFS("./database/migrations"),
		),
	)
	if err != nil {
		log.Fatalf("failed to load working directory: %v", err)
	}
	defer workdir.Close()

	client, err := atlasexec.NewClient(workdir.Path(), "atlas")
	if err != nil {
		log.Fatalf("failed to initialize client: %v", err)
	}
	// Run `atlas migrate apply`
	res, err := client.MigrateApply(context.Background(), &atlasexec.MigrateApplyParams{
		URL: "postgres://postgres:postgres@localhost:5432/mydb?sslmode=disable",
	})
	if err != nil {
		log.Fatalf("failed to apply migrations: %v", err)
	}

	fmt.Printf("Applied %d migrations\n", len(res.Applied))
}

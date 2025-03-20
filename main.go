package main

import (
	"context"
	"fmt"
	"log"

	"github.com/spiffe/go-spiffe/v2/workloadapi"
)

func main() {
	if err := run(context.Background()); err != nil {
		log.Fatal(err)
	}
}

func run(ctx context.Context) error {
	svid, err := workloadapi.FetchX509SVID(ctx)
	if err != nil {
		return err
	}
	fmt.Printf("Here is the SPIFFE ID: %s\n", svid.ID)
	return nil
}

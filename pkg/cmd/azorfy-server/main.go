package main

import (
	"github.com/azorfy/azorfy/pkg/cmd/azorfy-server/daemon"
	"os"
)

const VERSION = "0.0.1"

func main() {
	app := daemon.Daemon{Version: VERSION}

	os.Exit(app.Run())
}

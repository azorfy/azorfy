package daemon

import (
	"flag"
	"fmt"
)

type Daemon struct {
	Version string
}

func (d *Daemon) Run() int {
	err := d.parseFlags()
	if err != nil {
		return 1
	}

	err = d.startServer()
	if err != nil {
		return 1
	}

	return 0
}

func (d *Daemon) parseFlags() error {
	var (
		v = flag.Bool("v", false, "prints current version and exits")
	)

	flag.Parse()

	if *v {
		fmt.Printf("version %s\n", d.Version)
	}

	return nil
}

func (d *Daemon) startServer() error {
	return nil
}

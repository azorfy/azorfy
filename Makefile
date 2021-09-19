.PHONY: run run-server run-frontend build build-linux build-osx build-windows build-frontend swagger-codegen

BUILD_DIR = ./_build/bin
DIST_DIR = ./_dist
GO_FILES = ./pkg
SCRIPT_FILES = ./scripts

run: run-server run-frontend
build: build-linux build-osx build-windows

run-server:
	go build -o $(BUILD_DIR)/azorfy-server $(GO_FILES)/cmd/azorfy-server
	$(BUILD_DIR)/azorfy-server

run-frontend:
	npm start

build-linux:
	env GOOS=linux GOARCH=amd64 go build -o $(DIST_DIR)/linux_amd64/bin/azorfy-server $(GO_FILES)/cmd/azorfy-server

build-osx:
	env GOOS=darwin GOARCH=amd64 go build -o $(DIST_DIR)/darwin_amd64/bin/azorfy-server $(GO_FILES)/cmd/azorfy-server

build-windows:
	env GOOS=windows GOARCH=amd64 go build -o $(DIST_DIR)/windows_amd64/bin/azorfy-server.exe $(GO_FILES)/cmd/azorfy-server

build-frontend:
	npm build

swagger-codegen:
	${PWD}/scripts/swagger-codegen.sh

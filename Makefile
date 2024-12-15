.PHONY: build
build:
	go build -ldflags "-s -w" -o ./bin/bruh ./cmd

.PHONY: run
run:
	go run cmd/main.go

.PHONY: test
test:
	go test `go list ./...`

.PHONY: ci-testing
ci-testing:
	mkdir -p coverage
	go test -json -v -coverprofile ./coverage/coverage.txt `go list ./...`
	go tool cover -html=./coverage/coverage.txt -o ./coverage/coverage.html

all: build

build: build-elasticsearch

build-elasticsearch:
	govendor build -o bin/go-mysql-elasticsearch  -ldflags '-w -s' ./cmd/go-mysql-elasticsearch
	upx bin/go-mysql-elasticsearch

test:
	govendor test -timeout 1m --race ./...

clean:
	govendor clean -i ./...
	@rm -rf bin
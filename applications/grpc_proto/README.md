# GRPC proto

## Ruby

```
grpc_tools_ruby_protoc --proto_path=./protos --ruby_out=./lib/ruby --grpc_out=./lib/ruby **/*.proto
```

## Golang

```
protoc -I=. --go_out=paths=source_relative:./lib/go  **/*.proto
```

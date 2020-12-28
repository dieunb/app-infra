# GRPC proto

## Ruby

```
grpc_tools_ruby_protoc --proto_path=./protos --ruby_out=./lib/ruby --grpc_out=./lib/ruby **/*.proto
```

## Golang

```
go get -u google.golang.org/protobuf/cmd/protoc-gen-go
go install google.golang.org/protobuf/cmd/protoc-gen-go

go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc

# generate the messages
protoc -I=. --go_out=paths=source_relative:./lib/go  **/*.proto

# generate the services
protoc --go-grpc_out=./lib/go/protos protos/jobs.proto
```

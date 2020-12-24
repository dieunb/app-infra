mkfile_path := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

build:
	cd $(mkfile_path) && \
		go build -buildmode plugin -o ../hello-plugin.so hello-plugin.go

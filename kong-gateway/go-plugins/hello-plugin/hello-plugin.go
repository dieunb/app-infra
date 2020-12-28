/*
A "hello world" plugin in Go,
which reads a request header and sets a response header.
*/
package main

import (
	"fmt"
	"github.com/Kong/go-pdk"
	"log"
	"strconv"

	"github.com/dieunb/app-infra/applications/grpc_proto/lib/go/protos"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
)

const AUTH_HEADER_KEY = "jwt_token"
const AUTH_ERROR_CODE = 401

const AuthFailedResponse = `{"message": "Authentication Failed!", "status": "FAILED"}`

type Config struct {
	Message string
}

func New() interface{} {
	return &Config{}
}

func (conf Config) Access(kong *pdk.PDK) {
	responseHeaders := make(map[string][]string)

	jwt_token, err := getJwtAuthToken(kong)

	if err != nil {
		kong.Log.Err("Get AUTH header err : ", err)
		kong.Response.SetStatus(AUTH_ERROR_CODE)
		kong.Response.Exit(AUTH_ERROR_CODE, AuthFailedResponse, responseHeaders)
		return
	}

	var conn *grpc.ClientConn
	conn, err = grpc.Dial("authentication:9003", grpc.WithInsecure())

	if err != nil {
		log.Fatalf("did not connect: %s", err)
	}
	defer conn.Close()

	c := rpc.NewJobServiceClient(conn)

	response, err := c.GetJob(context.Background(), &rpc.GetJobReq{Id: jwt_token})

	if err != nil {
		log.Fatalf("Error when calling SayHello: %s", err)
	}
	log.Printf("Response from server: %s", response.Name)

	kong.Response.SetHeader("x-hello-from-go", fmt.Sprintf("The message comes from authentication service %s", response.Name))
}

func getJwtAuthToken(kong *pdk.PDK) (uint64, error) {
	jwt_token, err := kong.Request.GetHeader(AUTH_HEADER_KEY)

	if err != nil {
		return 0, err
	}

	jwt_token_int, err := strconv.ParseUint(jwt_token, 10, 64)

	if err != nil {
		return 0, err
	}

	return jwt_token_int, nil
}

# Authentication

Configuration to run behind Kong gateway

## Build and run authenticaion in docker

```bash
docker build . -t local/authentication:0.0.1
docker run -d --name authentication local/authentication:0.0.1
```

## Add authenticaion container to kong-gateway_default network

```bash
docker network connect kong-gateway_default authentication
```

## Configuration service and route in Kong


## Play with gprc

```
# Start gprc server
./bin/grpc

# Start a client and make a call to server by irb -r ./config/environment.rb
client = ::Rpc::JobService::Stub.new('0.0.0.0:9003', :this_channel_is_insecure)
request = ::Rpc::GetJobReq.new(id: 1)
client.get_job(request)
```

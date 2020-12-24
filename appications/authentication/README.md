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

# Shippy User Service
## How to run locally

1) Run postgres database: `docker run -d -p 5432:5432 postgres`
2) Build & run: `make build && make run`
3) Run NATS: `docker run -d -p 4222:4222 nats`
4) (optional) API gateway: `docker pull microhq/micro`

## Run user service & email service

1) Run user service locally
2) For email service run [GitHub shippy-email-service](https://github.com/JekaTka/shippy-email-service): `make build && make run`

## Test user service & email service

1) Run user service locally
2) Run email service locally
3) Build & run user CLI [GitHub shippy-user-cli](https://github.com/JekaTka/shippy-user-cli): `make build && make run`

# Run API gateway (microhq/micro) & test service

1) docker run -p 8080:8080 -e MICRO_REGISTRY=mdns microhq/micro api --handler=rpc --address=:8080 --namespace=shippy
2) curl -XPOST -H 'Content-Type: application/json' -d '{ "service": "shippy.auth", "method": "Auth.Create", "request": {"email": "ewan.valentine89@gmail.com", "password": "testing123", "name": "Ewan Valentine", "company": "BBC" } }' http://localhost:8080/rpc
3) curl -XPOST -H 'Content-Type: application/json' -d '{ "service": "shippy.auth", "method": "Auth.Auth", "request":  { "email": "ewan.valentine89@gmail.com", "password": "testing123" } }' http://localhost:8080/rpc

build:
	protoc -I. --go_out=plugins=micro:$(GOPATH)/src/github.com/JekaTka/microservices-in-golang/user-service proto/user/user.proto
	GOOS=linux GOARCH=amd64 go build
	docker build -t user-service .

run:
	docker run -p 50051:50051 \
		-e MICRO_SERVER_ADDRESS=:50051 \
		-e MICRO_REGISTRY=mdns user-service
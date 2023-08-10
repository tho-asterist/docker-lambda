FROM golang:1

WORKDIR /app

ENV CGO_ENABLED=0

COPY go.mod go.sum ./
RUN go mod download

COPY init.go ./
RUN GOARCH=arm64 GOOS=linux go build init.go

FROM mlupin/docker-lambda:base-arm64

ENV PATH=/var/lang/bin:$PATH \
    LD_LIBRARY_PATH=/var/lang/lib:$LD_LIBRARY_PATH

COPY --from=0 /app/init /var/runtime/init

USER sbx_user1051

ENTRYPOINT ["/var/runtime/init"]

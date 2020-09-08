# Build Image
FROM golang:1.15-alpine3.12 AS builder

WORKDIR /app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN go build

# Runtime Image
FROM golang:1.15-alpine3.12

COPY --from=builder /app/go-mockgen /usr/bin

WORKDIR /app

ENTRYPOINT [ "/usr/bin/go-mockgen" ]
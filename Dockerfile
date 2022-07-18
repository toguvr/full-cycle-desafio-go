FROM golang:1.18 AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build index.go

# PROD
FROM hello-world

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/index .

CMD ["./index"]

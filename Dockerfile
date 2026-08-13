FROM golang:1.26-alpine AS builder

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -o deployguard-api .

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/deployguard-api .

EXPOSE 8080

CMD ["./deployguard-api"]
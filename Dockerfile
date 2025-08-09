# Dockerfile
FROM quay.io/projectquay/golang:latest

WORKDIR /app

COPY . .

RUN go build -o app .

CMD ["./app"]

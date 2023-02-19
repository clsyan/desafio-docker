FROM golang:alpine as builder
 
WORKDIR /app
 
COPY . .

RUN go build -o /app main.go

FROM scratch

COPY --from=builder /app /app

ENTRYPOINT [ "go", "run", "main.go" ]
FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY go.mod .
COPY mensagem-entrada.go .

RUN go build -o /mensagem-entrada

FROM scratch

WORKDIR /

COPY --from=builder /mensagem-entrada /

cmd [ "/mensagem-entrada" ]
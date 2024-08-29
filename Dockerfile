FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY go.mod .
COPY mensagem-entrada.go .

RUN go build -ldflags '-s -w' -o /mensagem-entrada

# Não encontrei nenhuma imagem menor, nem como filtrar ou classificar por tamanho no Dockerhub
FROM scratch

WORKDIR /

COPY --from=builder /mensagem-entrada /

cmd [ "/mensagem-entrada" ]
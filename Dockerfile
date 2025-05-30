# збірка
FROM ubuntu:22.04 AS builder

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    g++ make cmake wget curl libstdc++6 autoconf automake libtool pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN ./configure && make

# полегшений образ
FROM alpine:latest

RUN apk --no-cache add libstdc++ curl

WORKDIR /app
COPY --from=builder /app/httpserver .

EXPOSE 8080
CMD ["./httpserver"]
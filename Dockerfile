FROM ubuntu:22.04

# Встановлення залежностей
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    g++ \
    make \
    cmake \
    wget \
    curl \
    libstdc++6 \
    autoconf \
    automake \
    libtool \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Компіляція програми
RUN make

# Відкриваємо порт
EXPOSE 8080

# Запуск сервера
CMD ["./httpserver"]

# Базовий образ Ubuntu
FROM ubuntu:22.04

# Встановлення залежностей
RUN apt-get update && apt-get install -y \
    g++ \
    make \
    cmake \
    wget \
    curl \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

# Копіюємо весь проєкт у контейнер
WORKDIR /app
COPY . .

# Компіляція програми
RUN make

# Відкриваємо порт
EXPOSE 8080

# Запуск сервера
CMD ["./httpserver"]

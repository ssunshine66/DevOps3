#!/bin/bash

IMAGE="realslimshady1/trig-http-server:multiarch"

# Запускаємо srv1 на CPU core 0
docker run -d --cpuset-cpus="0" --name srv1 -p 8081:8080 $IMAGE

# Функція для перевірки CPU завантаження (імітація)
check_load() {
    # Це лише приклад — заміни на щось реальне при бажанні
    echo $((RANDOM % 100))
}

# Перевірка кожні 60 сек — масштабування
while true; do
    sleep 60

    load=$(check_load)
    echo "Load: $load"

    # Додаємо srv2, якщо навантаження високе
    if [ $load -gt 50 ] && [ "$(docker ps -q -f name=srv2)" == "" ]; then
        echo "High load detected. Starting srv2..."
        docker run -d --cpuset-cpus="1" --name srv2 -p 8082:8080 $IMAGE
    fi

    # Додаємо srv3
    if [ $load -gt 80 ] && [ "$(docker ps -q -f name=srv3)" == "" ]; then
        echo "Very high load. Starting srv3..."
        docker run -d --cpuset-cpus="2" --name srv3 -p 8083:8080 $IMAGE
    fi

    # Видаляємо srv3, якщо немає навантаження
    if [ $load -lt 20 ] && [ "$(docker ps -q -f name=srv3)" != "" ]; then
        echo "Low load. Stopping srv3..."
        docker stop srv3 && docker rm srv3
    fi

    # Видаляємо srv2, якщо немає навантаження
    if [ $load -lt 40 ] && [ "$(docker ps -q -f name=srv2)" != "" ]; then
        echo "Low load. Stopping srv2..."
        docker stop srv2 && docker rm srv2
    fi
done

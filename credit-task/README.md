# Credit-Module Control Task

## Структура
- nginx.conf — конфігурація NGINX як балансувальника
- scriptA.sh — автоматичне масштабування контейнерів
- scriptB.sh — генерація навантаження

## Запуск

```bash
# 1. Запустити nginx з config
docker run -d --name nginx-lb -p 80:80 -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro nginx

# 2. Запустити масштабування
chmod +x scriptA.sh
./scriptA.sh &

# 3. Створити навантаження
chmod +x scriptB.sh
./scriptB.sh &

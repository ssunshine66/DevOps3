#!/bin/bash

while true; do
    curl -s http://localhost/calc
    sleep $((RANDOM % 6 + 5))  # Випадково 5–10 сек
done

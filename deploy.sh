#!/bin/bash

echo "[+] Stopping old containers..."
docker-compose down

echo "[+] Rebuilding and starting fresh containers..."
docker-compose up -d --build

echo "[+] Deployment done. App running on port 5000."


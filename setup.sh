#!/bin/bash

read -p "Введіть ім’я ноди (наприклад: Fearless-C37-S1): " NODE_NAME 

INSTALL_PATH="/root/go/bin/node-checker"
BIN_URL="https://raw.githubusercontent.com/0xFearless-1/copy/main/node-checker"

curl -fsSL "$BIN_URL" -o "$INSTALL_PATH"
chmod +x "$INSTALL_PATH"

(crontab -l 2>/dev/null; echo "0 * * * * $INSTALL_PATH --node-name=$NODE_NAME >> /var/log/node-checker.log 2>&1") | crontab -

echo "✅ node-checker встановлено!"

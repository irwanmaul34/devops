#!/bin/bash

WEBHOOK_URL="https://discord.com/api/webhooks/1416653912772968469/zY25smwDWqCelEpIqjUaX6bgDWP76mNJjubrCIykmulaw7VpDdCowlHY_etbrWs-mu5e"

# Threshold dalam persen
THRESHOLD=80

# Cek disk usage (root /)
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Nama host
HOSTNAME=$(hostname)

# Pesan alert
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    MESSAGE="⚠️ Disk usage di **$HOSTNAME** sudah ${USAGE}% (threshold ${THRESHOLD}%)"
    curl -H "Content-Type: application/json" \
         -X POST \
         -d "{\"content\": \"$MESSAGE\"}" \
         "$WEBHOOK_URL"
fi

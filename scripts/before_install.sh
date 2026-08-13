#!/bin/bash
set -euo pipefail

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP_DIR="/var/backups/cafe/${TIMESTAMP}"

mkdir -p "$BACKUP_DIR"

if [ -d /var/www/html/cafe ]; then
    cp -a /var/www/html/cafe/. "$BACKUP_DIR/"
fi

mkdir -p /var/www/html/cafe

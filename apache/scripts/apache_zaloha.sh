#!/bin/bash

BACKUP_DIR="/backup/apache"
CONFIG_DIR="/etc/apache2"
DATE=$(date +%F)

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/apache_backup_$DATE.tar.gz" "$CONFIG_DIR"

echo "Backup created at $BACKUP_DIR/apache_backup_$DATE.tar.gz"

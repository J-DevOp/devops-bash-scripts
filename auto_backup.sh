#!/bin/bash

# ==============================
# Automated Backup Script
# ==============================

SOURCE_DIR="/home/junaid/Documents"
BACKUP_DIR="/home/junaid/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
DEST="$BACKUP_DIR/backup_$TIMESTAMP"

# Create backup directory if not exists
mkdir -p "$DEST"

# Perform backup using rsync
rsync -avh --progress "$SOURCE_DIR/" "$DEST/"

# Logging
echo "Backup completed on $TIMESTAMP from $SOURCE_DIR to $DEST" >> /var/log/auto_backup.log

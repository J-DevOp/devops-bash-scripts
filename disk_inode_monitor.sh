#!/bin/bash

# Script: disk_inode_monitor.sh
# Description: Monitors disk usage and inode usage and logs alerts if usage exceeds threshold.

# Set thresholds
DISK_THRESHOLD=80
INODE_THRESHOLD=80

# Log file (change path if permission denied)
LOG_FILE="$HOME/disk_inode_monitor.log"

# Get current date
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Start logging
echo "[$DATE] Running disk and inode usage checks..." >> "$LOG_FILE"

# Loop through each mounted filesystem
df -hP | grep '^/dev/' | while read -r line; do
    USAGE=$(echo "$line" | awk '{print $5}' | tr -d '%')
    MOUNT_POINT=$(echo "$line" | awk '{print $6}')

    if [[ -n "$USAGE" && "$USAGE" =~ ^[0-9]+$ && "$USAGE" -ge $DISK_THRESHOLD ]]; then
        echo "[$DATE] ALERT: Disk usage on $MOUNT_POINT is at ${USAGE}%." >> "$LOG_FILE"
    fi
done

# Check inode usage
df -iP | grep '^/dev/' | while read -r line; do
    IUSAGE=$(echo "$line" | awk '{print $5}' | tr -d '%')
    MOUNT_POINT=$(echo "$line" | awk '{print $6}')

    if [[ -n "$IUSAGE" && "$IUSAGE" =~ ^[0-9]+$ && "$IUSAGE" -ge $INODE_THRESHOLD ]]; then
        echo "[$DATE] ALERT: Inode usage on $MOUNT_POINT is at ${IUSAGE}%." >> "$LOG_FILE"
    fi
done

echo "[$DATE] Check completed." >> "$LOG_FILE"


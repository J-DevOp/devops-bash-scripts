# devops-bash-scripts
A collection of useful Bash scripts for DevOps tasks like monitoring, automation, and system health checks.

## Disk and Inode Monitoring Script

This script checks disk space and inode usage across mounted filesystems. If thresholds are crossed, it logs alerts in `/var/log/disk_inode_monitor.log`.

### Features:
- Checks all mount points.
- Warns if disk or inode usage exceeds 80%.
- Logs events with timestamp.


# Disk and Inode Monitoring Script

## 📌 Description
A Bash script to monitor disk space and inode usage on a Linux system. It checks all mounted partitions and logs alerts when usage exceeds defined thresholds.

This script is useful in DevOps and system administration for proactive health monitoring of servers, ensuring that storage and inode exhaustion do not disrupt services.

---

##  Features
- Checks disk usage and inode usage for all partitions.
- Customizable thresholds.
- Logs alerts with timestamps to `/var/log/disk_inode_monitor.log`.
- Easy to automate via `cron`.

---

##  Script Location
[`disk_inode_monitor.sh`](./disk_inode_monitor.sh)

---

##  How to Use

### Make the script executable
```bash
chmod +x disk_inode_monitor.sh

######################################

## Auto Backup Script
📌 Description
This script automates the backup of a specified source directory into a compressed .tar.gz archive. It's ideal for regular backups of configuration files, user data, logs, or entire directories.

## Features
Compresses the source directory into a timestamped archive.

Supports backup destination customization.

Ensures organized, versioned backups.

Can be scheduled via cron for full automation.

## Example Usage

./auto_backup.sh /etc /backups
This backs up /etc to /backups/etc_backup_YYYY-MM-DD_HH-MM-SS.tar.gz.

⏱️ Automation Tip
Add this to your crontab for daily backups at 2:00 AM:

0 2 * * * /home/junaid/devops-bash-scripts/auto_backup.sh /etc /backups
## Use Case in DevOps
This script is useful in:

CI/CD pipeline backups

Disaster recovery setups

Pre-deployment environment snapshots

Cloud VM and container volume backups

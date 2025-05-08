# devops-bash-scripts
A collection of useful Bash scripts for DevOps tasks like monitoring, automation, and system health checks.

## 📊 Disk and Inode Monitoring Script

This script checks disk space and inode usage across mounted filesystems. If thresholds are crossed, it logs alerts in `/var/log/disk_inode_monitor.log`.

### Features:
- Checks all mount points.
- Warns if disk or inode usage exceeds 80%.
- Logs events with timestamp.

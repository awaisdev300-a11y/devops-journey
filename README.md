
# DevOps Journey

My hands-on journey learning Linux, Bash scripting, system administration, and DevOps fundamentals using Ubuntu Server 24.04.

## About This Repository

This repository documents my practical learning, scripts, and troubleshooting experience as I build my DevOps skills.

## Projects

### Automated Backup Script

A Bash script that creates compressed backups of a specified directory.

**Features**
- Creates compressed `.tar.gz` archives.
- Uses a separate configuration file for backup settings.
- Creates the backup destination directory when needed.
- Checks for errors during the backup process.
- Removes incomplete archives when backup creation fails.
- Deletes old backups based on the configured retention period.

**Configuration**

Copy `config/backup.conf.example` to `config/backup.conf` and adjust the settings:

```bash
BACKUP_DIR="$HOME/backups"
KEEP_DAYS=7
```

The actual configuration file is excluded from Git. Only the example configuration is tracked.

**Run the script**

From the repository root:

```bash
./scripts/backup_script.sh /path/to/source_directory
```

Replace `/path/to/source_directory` with the directory you want to back up.

### Linux Troubleshooting — Day 26

Practical incident reports covering:
- Service failure investigation
- File permission troubleshooting
- Nginx configuration troubleshooting

## Technologies and Tools

- Ubuntu Server 24.04
- Linux command line
- Bash scripting
- Git and GitHub
- SSH
- tar and gzip
- systemd
- Nginx

## Learning Approach

I focus on hands-on practice, troubleshooting real errors, understanding why things fail, and documenting what I learn.

## Current Progress

Completed my first month of Linux and DevOps fundamentals practice and began documenting my work using Git and GitHub.

## Author

Awais

[GitHub Profile](https://github.com/awaisdev300-a11y)

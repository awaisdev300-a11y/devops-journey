#!/bin/bash
set -eu
echo "[$(date)] INFO: Backup process started."

if [ "$#" -ne 1 ]; then
        echo "ERROR: Expected exactly one source directory."
	echo "Usage: $0 <source_directory>"
        exit 64

fi

folder=$1
timestamps=$(date +%Y%m%d_%H%M%S)
archive="backup_$timestamps.tar.gz"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd )"
CONFIG_FILE="$SCRIPT_DIR/../config/backup.conf"
source "$CONFIG_FILE"

if [[ -z "$BACKUP_DIR" || -z "$KEEP_DAYS" ]]; then
	echo "ERROR: BACKUP_DIR or KEEP_DAYS is missing in the configuration."
	exit 3
fi
if [ -d  "$BACKUP_DIR" ]; then
        echo "Backup directory exists, proceeded to backup"
elif [ -f "$BACKUP_DIR" ]; then
        echo "ERROR: Backup destination exists but is not a directory: $BACKUP_DIR"
        exit 2
else
        echo "INFO: Backup destination does not exist. Creating it..."
        if ! mkdir -p "$BACKUP_DIR"; then 
        	echo "ERROR: Could not create backup destination: $BACKUP_DIR"
		exit 3
      	fi 
fi
archive_path="$BACKUP_DIR/$archive"

if [ -d "$folder" ] ; then
	if tar -czf "$archive_path" "$folder"; then 
		echo "[$(date)] SUCCESS: Backup created: $archive_path"
	else
    		tar_excode="$?"
    		echo "ERROR: Backup failed (tar exit code: $tar_excode). Removing incomplete archive."
		rm -f "$archive_path" || true 
    		exit "$tar_excode"
	fi
else

	echo "ERROR: Source directory does not exist: $folder"
	exit 1


fi

find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +"$KEEP_DAYS" -delete

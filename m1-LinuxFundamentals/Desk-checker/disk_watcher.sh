#!/bin/bash

# disk_check.sh - checks how full a disk is and warns if it is over a limit
# Usage: ./disk_check.sh <path to disk> <limit 1-100>
#
# Exit codes:
#   0 = disk usage is OK
#   1 = wrong usage (missing argument or bad limit)
#   2 = the path does not exist
#   3 = disk usage is over the limit

set -euo pipefail

path="$1"
limit="$2"
if [[ -z "$path" || "$#" -ne 2 || ! "$limit" =~ ^[0-9]+$ || "$limit" -gt 100 ]]
then
        echo "[ERROR] Usage: $0 <Path/to/disk> <limit (1-100)>"
        exit 1
fi

if [ -e "$path" ]; then
        usage=$( df --output=pcent "$path" | tail -n 1 | tr -dc "0-9" )

        if [ "$usage" -gt "$limit" ]; then
                echo "[WARNING] Disk usage is $usage% Full"
                exit 3
        else
                echo "[GOOD] disk usage is $usage% "
        fi
else
        echo "[Error] Enter a valid Path"
        echo "Usage:<script>  </path/to/disk> <limit eg 80>"
        exit 2
fi


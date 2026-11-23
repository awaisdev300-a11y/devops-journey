# Disk Space Checker

A small Bash script that checks how full a disk is. If the usage is over the limit you give, it prints a warning.

I made it on the last day of Month 1 of my DevOps roadmap.

## Usage

```bash
chmod +x disk_check.sh
./disk_check.sh <path to disk> <limit 1-100>
```

Example:

```bash
./disk_check.sh / 80
```

This checks the disk that holds `/` and warns if it is more than 80% full.

## Output

```
[GOOD] disk usage is 40%
[WARNING] Disk usage is 85% Full
```

## Exit codes

| Code | Meaning |
|------|---------|
| 0 | Disk usage is OK |
| 1 | Wrong usage (missing argument or bad limit) |
| 2 | The path does not exist |
| 3 | Disk usage is over the limit |

You can check the code after running the script with `echo $?`. This makes it possible to use the script in cron or in other scripts.

## What I practiced

- Arguments (`$1`, `$2`, `$#`)
- Checking input with `if`, `-z`, `-e` and a regex
- Command substitution with `df | tail | tr`
- Exit codes
- `set -euo pipefail`
- Checking my script with `shellcheck`

## Tested on

Ubuntu Server (VirtualBox)

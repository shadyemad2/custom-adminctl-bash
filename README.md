i# adminctl - System Administration Command-Line Tool

## Overview
adminctl is a Bash-based CLI tool designed for modular system administration tasks including backup, monitoring, network management, and service control.

## Main Commands
- `help`: Show usage instructions.
- `version`: Show tool version.
- `backup`: Backup-related commands.
- `monitor`: System monitoring commands.
- `network`: Network commands.
- `service`: Service management commands.

## Tool Modules

### Backup Module (backup)
- Commands:
  - `run`: Perform backup.
    - Options:
      - `--source <path>`: Source directories (comma-separated).
      - `--dest <path>`: Destination directory.
      - `--compress`: Enable compressed (tar.gz) backup.
  - `restore <backup_file> <destination_dir>`: Restore backup.
  - `delete <backup_file>`: Delete a backup.
  - `help`: Show backup commands help.

### Network Module (network)
- Commands:
  - `iface`: Show network interfaces.
  - `route`: Show routing table.
  - `ports`: Show listening ports.
  - `summary`: Show network summary.
  - `help`: Show help.

### Monitor Module (monitor)
- Commands:
  - `cpu`: Top 5 CPU usage processes.
  - `mem`: Top 5 memory usage processes.
  - `disk`: Disk usage (xfs, ext4).
  - `uptime`: System uptime.
  - `full`: Full system report.
  - `help`: Show help.

### Service Module (service)
- Commands:
  - `check <service_name>`: Check if a service is running.
  - `autorestart <service_name>`: Restart service if down.
  - `log <service_name>`: Show last 10 log lines.
  - `help`: Show help.

## Usage Examples
- Run a compressed backup:  
  `adminctl backup run --source /etc,/home/user --dest /backups --compress`
- Show network summary:  
  `adminctl network summary`
- Show top CPU processes:  
  `adminctl monitor cpu`
- Check sshd service status:  
  `adminctl service check sshd`

---

## Images
- Example backup command output: [Insert image here]
- Network summary screenshot: [Insert image here]
- Monitor full report sample: [Insert image here]
- Service status and logs example: [Insert image here]

---

This tool leverages standard Linux utilities like `systemctl`, `ip`, `ss`, `ps`, and `df` for comprehensive system management.

If you need further assistance or explanations, feel free to ask.















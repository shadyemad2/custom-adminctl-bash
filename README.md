# 🚀 adminctl - System Administration Command-Line Tool

## Overview
adminctl is a Bash-based CLI tool designed for modular system administration tasks including backup, monitoring, network management, and service control.

## Main Commands
- `help`: Show usage instructions.
- `version`: Show tool version.
- `backup`: Backup-related commands.
- `monitor`: System monitoring commands.
- `network`: Network commands.
- `service`: Service management commands.
<img width="801" height="521" alt="adminctl-help" src="https://github.com/user-attachments/assets/7590ff89-172c-4181-a73a-1c06a2abc0aa" />

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
<img width="1096" height="618" alt="backup_help" src="https://github.com/user-attachments/assets/cd8a7b90-d17f-4b12-94e6-7b1e02e2315b" />
  
<img width="1413" height="479" alt="backup restore" src="https://github.com/user-attachments/assets/5aa1e04f-7953-47aa-9178-c2bcaaa50ca1" />

### Network Module (network)
- Commands:
  - `iface`: Show network interfaces.
  - `route`: Show routing table.
  - `ports`: Show listening ports.
  - `summary`: Show network summary.
  - `help`: Show help.
    
<img width="791" height="410" alt="network_help" src="https://github.com/user-attachments/assets/d7e553c4-752d-4b11-a29a-945fdfe7d6cb" />

<img width="1373" height="639" alt="network_ports" src="https://github.com/user-attachments/assets/ab85b69f-7021-4675-8c42-5776c6f12566" />


### Monitor Module (monitor)
- Commands:
  - `cpu`: Top 5 CPU usage processes.
  - `mem`: Top 5 memory usage processes.
  - `disk`: Disk usage (xfs, ext4).
  - `uptime`: System uptime.
  - `full`: Full system report.
  - `help`: Show help.
    
<img width="716" height="468" alt="monitor_help" src="https://github.com/user-attachments/assets/3e6e7160-60ae-4d65-aef1-cfe105ea69be" />

<img width="926" height="637" alt="monitor_cpu_mem_disk" src="https://github.com/user-attachments/assets/76ac68c7-2bec-4ab4-9634-02bdc6a31a40" />
  

### Service Module (service)
- Commands:
  - `check <service_name>`: Check if a service is running.
  - `autorestart <service_name>`: Restart service if down.
  - `log <service_name>`: Show last 10 log lines.
  - `help`: Show help.
    
<img width="769" height="424" alt="service_help" src="https://github.com/user-attachments/assets/30a836d8-c67d-49c3-81a4-fd3bad551119" />

<img width="663" height="232" alt="service_check" src="https://github.com/user-attachments/assets/61ddaefe-31f1-46d4-9fdf-230a279a8fc9" />


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
## man page

<img width="1392" height="733" alt="man_page1" src="https://github.com/user-attachments/assets/008f9cf9-0ce1-489c-b9e4-735d44ea36df" />

<img width="1393" height="719" alt="man_page2" src="https://github.com/user-attachments/assets/73dbf9bc-17f2-4308-bfff-a26413d85520" />


---

This tool leverages standard Linux utilities like `systemctl`, `ip`, `ss`, `ps`, and `df` for comprehensive system management.

If you need further assistance or explanations, feel free to ask.

Made by [**Shady Emad**](https://github.com/shadyemad2)













#!/bin/bash
# monitor.sh - System monitoring module

show_help() {
    cat <<EOF
Usage: adminctl monitor <command>

Commands:
  cpu     Show CPU usage (top 5 processes)
  mem     Show memory usage (top 5 processes)
  disk    Show disk usage
  uptime  Show system uptime
  full    Show full system report
  help    Show this help message
EOF
}

COMMAND="$1"
shift || true

case "$COMMAND" in
    cpu)
        echo "[monitor] Top 5 processes by CPU usage:"
        ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
        ;;
    mem)
        echo "[monitor] Top 5 processes by Memory usage:"
        ps -eo pid,comm,%mem --sort=-%mem | head -n 6
        ;;
    disk)
        echo "[monitor] Disk usage:"
        df -hT | grep -E "xfs|ext4"
        ;;
    uptime)
        echo "[monitor] System uptime:"
        uptime -p
        ;;
    full)
        echo "[monitor] ===== System Report ====="
        echo "Hostname: $(hostname)"
        echo "Uptime: $(uptime -p)"
        echo
        echo "--- CPU ---"
        ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
        echo
        echo "--- Memory ---"
        ps -eo pid,comm,%mem --sort=-%mem | head -n 6
        echo
        echo "--- Disk ---"
        df -hT | grep -E "xfs|ext4"
        ;;
    help|"")
        show_help
        ;;
    *)
        echo "[monitor] Unknown command: $COMMAND"
        show_help
        exit 1
        ;;
esac

#!/bin/bash
# service.sh - Service management module

show_help() {
    cat <<EOF
Usage: adminctl service <command> [service_name]

Commands:
  check       Check if a service is running
  autorestart Restart service if not running
  log         Show last 10 log lines of a service
  help        Show this help message
EOF
}

COMMAND="$1"
SERVICE="$2"
shift 2 || true

if [[ "$COMMAND" == "" || "$COMMAND" == "help" ]]; then
    show_help
    exit 0
fi

if [[ -z "$SERVICE" && "$COMMAND" != "help" ]]; then
    echo "[service] Missing service name for '$COMMAND'"
    show_help
    exit 1
fi

case "$COMMAND" in
    check)
        if systemctl is-active --quiet "$SERVICE"; then
            echo "[service] $SERVICE is running"
        else
            echo "[service] $SERVICE is NOT running"
        fi
        ;;
    autorestart)
        if systemctl is-active --quiet "$SERVICE"; then
            echo "[service] $SERVICE is already running"
        else
            echo "[service] $SERVICE is down, restarting..."
            sudo systemctl start "$SERVICE"
            if systemctl is-active --quiet "$SERVICE"; then
                echo "[service] $SERVICE restarted successfully"
            else
                echo "[service] Failed to restart $SERVICE"
            fi
        fi
        ;;
    log)
        echo "[service] Showing last 10 log lines for $SERVICE:"
        journalctl -u "$SERVICE" -n 10 --no-pager
        ;;
    *)
        echo "[service] Unknown command: $COMMAND"
        show_help
        exit 1
        ;;
esac



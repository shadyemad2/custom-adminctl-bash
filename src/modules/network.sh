#!/bin/bash
# network.sh - Network monitoring module

show_help() {
    cat <<EOF
Usage: adminctl network <command>

Commands:
  iface    Show network interfaces
  route    Show routing table
  ports    Show listening ports
  summary  Show network summary
  help     Show this help message
EOF
}

COMMAND="$1"
shift || true

case "$COMMAND" in
    iface)
        echo "[network] Interfaces:"
        ip -brief addr
        ;;
    route)
        echo "[network] Routing table:"
        ip route
        ;;
    ports)
        echo "[network] Listening ports:"
        ss -tulpn
        ;;
    summary)
        echo "[network] ===== Network Summary ====="
        echo "--- Interfaces ---"
        ip -brief addr
        echo
        echo "--- Routes ---"
        ip route
        echo
        echo "--- Ports ---"
        ss -tulpn | head -n 15
        ;;
    help|"")
        show_help
        ;;
    *)
        echo "[network] Unknown command: $COMMAND"
        show_help
        exit 1
        ;;
esac



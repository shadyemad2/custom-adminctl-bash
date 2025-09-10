#!/bin/bash
# main.sh - core logic for adminctl
# Author Shady Emad

BASEDIR=$(cd "$(dirname "$0")/.." && pwd)
VERSION="0.1"


show_help() {
    cat <<EOF
Usage: adminctl <command> [options]

Commands:
  help                Show this help message
  version             Show version
  backup              Backup related commands
  monitor             Monitoring commands
  network             network commands
  service             check for services
Run 'adminctl <command> --help' for details.
EOF
}

show_version() {
    echo "adminctl version $VERSION"
}

# ---------- get command ----------
cmd="$1"
shift || true   # shift args if any

case "$cmd" in
    help|-h|--help|"")
        show_help
        ;;
    version|-v|--version)
        show_version
        ;;
    backup|-b)
        "$BASEDIR/src/modules/backup.sh" "$@"
        ;;
    monitor|-m)
        "$BASEDIR/src/modules/monitor.sh" "$@"
        ;;
    network|-n)
        "$BASEDIR/src/modules/network.sh" "$@"
        ;;	
    service|-s)
        "$BASEDIR/src/modules/service.sh" "$@"
        ;;	
    *)
        echo "Unknown command: $cmd"
        echo "Run 'adminctl help' for usage."
        exit 1
        ;;
esac


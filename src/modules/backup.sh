#!/bin/bash
# backup.sh - Backup module for adminctl

show_help() {
    cat <<EOF
Usage: adminctl backup <action> [options]

Actions:
  run       Run a backup
            Options:
              --source <path>     Source directories (comma-separated)
              --dest <path>       Destination directory
              --compress          Enable compression

  restore   Restore a backup
            Usage: adminctl backup restore <backup_file> <destination_dir>

  delete    Delete a backup
            Usage: adminctl backup delete <backup_file>

  help      Show this help message
EOF
}


ACTION="$1"
shift || true

case "$ACTION" in
    run)
        SOURCES=""
        DEST=""
        COMPRESS=false

        while [[ $# -gt 0 ]]; do
            case "$1" in
                --source) SOURCES="$2"; shift 2 ;;
                --dest) DEST="$2"; shift 2 ;;
                --compress) COMPRESS=true; shift ;;
                *) echo "[backup] Unknown option: $1"; exit 1 ;;
            esac
        done

        if [[ -z "$SOURCES" || -z "$DEST" ]]; then
            echo "[backup] Missing --source or --dest"
            exit 1
        fi

        mkdir -p "$DEST"
        TS=$(date +"%Y%m%d-%H%M%S")
        BACKUP_NAME="backup-$TS"
        BACKUP_PATH="$DEST/$BACKUP_NAME"

        IFS=',' read -ra SRCS <<< "$SOURCES"

        if $COMPRESS; then
            tar -czf "$BACKUP_PATH.tar.gz" "${SRCS[@]}"
            echo "[backup] Compressed backup created: $BACKUP_PATH.tar.gz"
        else
            mkdir -p "$BACKUP_PATH"
            for src in "${SRCS[@]}"; do
                cp -r "$src" "$BACKUP_PATH/"
            done
            echo "[backup] Backup directory created: $BACKUP_PATH"
        fi
        ;;
    restore)
        FILE="$1"
        DEST="$2"
        [[ -z "$FILE" || -z "$DEST" ]] && { echo "[backup] Usage: adminctl backup restore <file> <dest_dir>"; exit 1; }
        [[ ! -f "$FILE" ]] && { echo "[backup] Backup file not found: $FILE"; exit 1; }
        mkdir -p "$DEST"
        tar -xzf "$FILE" -C "$DEST"
        echo "[backup] Restore completed: $FILE -> $DEST"
        ;;
    delete)
        FILE="$1"
        [[ -z "$FILE" ]] && { echo "[backup] Usage: adminctl backup delete <file>"; exit 1; }
        [[ ! -f "$FILE" ]] && { echo "[backup] Backup file not found: $FILE"; exit 1; }
        rm -i "$FILE"
        echo "[backup] Deleted: $FILE"
        ;;
    help|--help|-h|"")
        show_help
        ;;
    *)
        echo "[backup] Unknown action: $ACTION"
        show_help
        exit 1
        ;;
esac

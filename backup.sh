#!/bin/bash
set -euo pipefail

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

main() {
    if [[ $# -lt 1 ]]; then
        echo "Error: Please provide a source folder." >&2
        exit 1
    fi

    local source_folder="$1"

    if [[ ! -d "$source_folder" ]]; then
        echo "Error: Folder '$source_folder' does not exist." >&2
        exit 1
    fi

    local backup_dir="$HOME/devops/backups"
    mkdir -p "$backup_dir"

    local timestamp
    timestamp=$(date '+%Y-%m-%d-%H%M')

    local backup_file="$backup_dir/backup-$timestamp.tar.gz"

    log "Starting backup of $source_folder"

    tar -czf "$backup_file" -C "$(dirname "$source_folder")" "$(basename "$source_folder")"

    log "Backup created successfully: $backup_file"
}

main "$@"

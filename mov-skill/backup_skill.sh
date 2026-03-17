#!/bin/bash
# Backup Script for Cinematic Director System (mov-skill)
# Creates a timestamped backup of the critical skill files.

# Set Directory (Relative to script location)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="${SCRIPT_DIR}/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Ensure backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "Created backup directory: $BACKUP_DIR"
fi

# Define files to backup
FILES=("SKILL.md" "story_vault.md")

echo "Starting backup for mov-skill..."

for file in "${FILES[@]}"; do
    if [ -f "${SCRIPT_DIR}/${file}" ]; then
        cp "${SCRIPT_DIR}/${file}" "${BACKUP_DIR}/${file}_${TIMESTAMP}.bak"
        echo "Backed up ${file} to ${BACKUP_DIR}/${file}_${TIMESTAMP}.bak"
    else
        echo "Warning: ${file} not found in ${SCRIPT_DIR}"
    fi
done

echo "Backup process complete."
ls -l "$BACKUP_DIR" | grep "$TIMESTAMP"

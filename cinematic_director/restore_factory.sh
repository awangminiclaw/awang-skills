#!/bin/bash
# Cinematic Director System - Factory Reset Script
# Use this to restore the strictly defined V9.7 logic if the main SKILL.md gets corrupted or edited accidently.

SKILL_DIR="/home/awang/.config/Antigravity/skills/cinematic_director"
BACKUP_FILE="$SKILL_DIR/backups/SKILL_V9.7_GOLDEN_MASTER.md"
TARGET_FILE="$SKILL_DIR/SKILL.md"

if [ -d "$SKILL_DIR/backups" ]; then
    if [ -f "$BACKUP_FILE" ]; then
        echo "Filesystem Check: Golden Master found."
        echo "Restoring V9.7 Industrial Spec..."
        cp "$BACKUP_FILE" "$TARGET_FILE"
        echo "SUCCESS: Cinematic Director System restored to Factory Settings (V9.7)."
    else
        echo "CRITICAL ERROR: Golden Master backup not found at $BACKUP_FILE"
        exit 1
    fi
else
    echo "ERROR: Backups directory missing. Creating it..."
    mkdir -p "$SKILL_DIR/backups"
    echo "Please place the Golden Master file in the backups directory."
    exit 1
fi

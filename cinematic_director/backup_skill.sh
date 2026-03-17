#!/bin/bash
# 自動備份當前的 SKILL.md 到 backups 資料夾並加上時間戳記
# Auto-backup current SKILL.md to backups folder with timestamp

SKILL_DIR="/home/awang/.config/Antigravity/skills/cinematic_director"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_PATH="$SKILL_DIR/backups/SKILL_$TIMESTAMP.md"

cp "$SKILL_DIR/SKILL.md" "$BACKUP_PATH"
echo "Backup created (備份已建立): $BACKUP_PATH"

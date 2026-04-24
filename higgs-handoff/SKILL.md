---
name: higgs-handoff
description: "HIGGS團隊交接管道 — 喝姐寫規格書到共享目錄，小書自動讀取產出提示詞"
version: 1.0.0
author: 小書
---

# HIGGS Handoff — 團隊交接管道

## 代碼
`HANDOFF` = 規格書已存，接手方讀取

## 共享目錄
`/home/awang/memory-backup/shared/higgs-handoff/`

## 喝姐（寫端）
出完規格書 → 寫入 `spec.md` 到共享目錄 → 在群組發 `HANDOFF`

## 小書（讀端）
收到指令或cron觸發 → 讀取 `spec.md` → 照imageex技能寫prompt → 寫到 `output.md`

## 檔案格式
- `spec.md` — 喝姐的規格書（小書讀）
- `output.md` — 小書的prompt輸出（喝姐/老闆看）
- `.status` — 狀態檔：`PENDING` / `DONE`
---
name: higgs-handoff
description: "HIGGS團隊交接管道 — 喝姐與小書的代碼通信系統"
version: 2.0.0
author: 小書
---

# HIGGS Handoff — 交接代碼系統

## 共享目錄
`/home/awang/memory-backup/shared/higgs-handoff/`

## 代碼對照表

| 代碼 | 喝姐→小書 | 小書→喝姐 |
|------|----------|----------|
| `HC` | 規格書好了，讀spec寫prompt | prompt寫好了，讀output |
| `HR` | 要改，讀revise.md改output | 改好了，讀output |
| `HN` | 新流程，清空目錄重來 | OK |
| `HA` | 有附件/參考，讀ref.md | OK |

## 代碼格式
`HC` `HR` `HN` `HA` — 一個代碼兩個字母，收到就知道做什麼

## 檔案約定
- `spec.md` — 喝姐的規格書
- `output.md` — 小書的prompt輸出  
- `revise.md` — 修改需求
- `ref.md` — 參考資料
- `.status` — 狀態：SPEC_READY / OUTPUT_READY / REVISE / IDLE

## 流程
1. 喝姐寫 spec.md → 群組發 `HC`
2. 小書收到HC → 讀spec → 寫output.md → .status=OUTPUT_READY → 群組回 `HC`
3. 要改 → 喝姐寫revise.md → 群組發 `HR`
4. 小書收到HR → 讀revise → 改output → 回 `HC`
5. 新流程 → 喝姐清空目錄寫新spec → 群組發 `HN` 再發 `HC`
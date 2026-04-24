---
name: higgs-handoff
description: "HIGGS團隊短碼通信表 — 兩個字母搞定所有協作狀況"
version: 3.0.0
author: 小書
---

# HIGGS 短碼通信表

共享目錄：`/home/awang/memory-backup/shared/higgs-handoff/`

## 完整短碼表

| 短碼 | 意義 | 動作 |
|------|------|------|
| HS | 規格書好了 | 寫spec.md → 發HS → 讀spec寫prompt |
| HO | Prompt好了 | 寫output.md → 發HO → 讀output驗收 |
| HR | 要改 | 寫revise.md → 發HR → 讀revise改output |
| HN | 新流程 | 清空目錄 → 發HN → 等新spec |
| HA | 有附件 | 寫ref.md → 發HA → 讀ref參考 |
| HP | 暫停 | 全暫停等待 | 收到後停止動作 |
| HC | 繼續 | 恢復工作 | 收到後繼續上次進度 |
| HD | 完成 | 整個流程結束 | 歸檔清空 |
| HW | 等等 | 需要時間思考 | 不動等下一步 |
| HF | 失敗 | 出錯了 | 讀error.md看原因 |

## 檔案約定

```
higgs-handoff/
├── spec.md      # 規格書（喝姐寫）
├── output.md    # Prompt輸出（小書寫）
├── revise.md    # 修改需求（喝姐寫）
├── ref.md       # 參考資料（任一方寫）
├── error.md     # 錯誤記錄（出錯時寫）
└── .status      # 狀態：IDLE / SPEC_READY / OUTPUT_READY / REVISE / DONE / ERROR
```

## 誰做什麼

**喝姐（寫端）：** 選主題→挑故事→定方向→出規格書→寫spec.md→發HS
**小書（讀端）：** 收到HS→讀spec→照imageex技能寫prompt→寫output.md→發HO

## 流程範例

1. 喝姐出規格書 → 寫spec.md → 群組發 `HS`
2. 小書收到HS → 讀spec.md → 寫output.md → 群組回 `HO`
3. 老闆/喝姐要改 → 寫revise.md → 群組發 `HR`
4. 小書收到HR → 讀revise.md → 改output → 回 `HO`
5. 完成 → 喝姐發 `HD` → 歸檔
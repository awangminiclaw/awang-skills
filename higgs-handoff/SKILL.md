---
name: higgs-handoff
description: "HIGGS團隊交接 — 一個代碼HX，看新來源→處理→殺掉"
version: 4.0.0
author: 小書
---

# HIGGS Handoff

## 代碼
`HX` — 有新東西，去看

## 流程
1. 喝姐寫完規格書/修改/參考 → 存成NLM來源 → 群組敲 `HX`
2. 小書收到HX → 去NLM查新來源 → 讀取 → 處理 → 刪掉該來源
3. 下次喝姐再敲HX → 小書又去看新來源 → 處理 → 殺掉

## 為什麼看完要殺
NLM來源字數有限（20萬字），用完就殺不佔空間。東西已經處理完寫進output了，留著浪費。

## 小書收到HX後的動作
1. `nlm source list <小書NLM notebook ID>` 查新來源
2. 讀取新來源內容（規格書/修改/參考）
3. 照內容處理（寫prompt/改prompt/參考）
4. `nlm delete source <notebook> <source_id>` 殺掉該來源
5. 群組回處理結果

## NLM Notebook IDs
- 小書: 7ab784b2-5207-4604-8845-eb435139ec0d
- 喝姐: c8795f80-c61b-4feb-abb3-e7f470b3ce8b

## 共享目錄（備用）
`/home/awang/memory-backup/shared/higgs-handoff/`
- NLM為主，共享目錄為輔
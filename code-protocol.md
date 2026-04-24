---
name: code-protocol
description: 跨Agent代碼協議 — 單一短碼GO，NLM存任務用完即刪，零浪費。
trigger: 需要指揮小書執行任務時，或提到代碼協議/GO protocol
---

# 跨Agent代碼協議 v2.0

## 核心概念
一個代碼：GO。喝妹出完規格書存進小書NLM，標題固定「🔄 待處理」，發GO，小書讀完做完刪掉source，零浪費。

## 代碼
**GO** — 唯一短碼，收到就去NLM找「🔄 待處理」source，讀完執行完刪掉，交付成品。

## 流程
1. 喝妹出大綱+規格書 → 存入小書NLM（notebook `7ab784b2-5207-4604-8845-eb435139ec0d`），標題固定「🔄 待處理」
2. 執行 `ping-xiaoshu GO`（/home/awang/.local/bin/ping-xiaoshu）
3. 小書透過API server（localhost:8780）收到GO → 去NLM找「🔄 待處理」→ 讀取內容 → 產出 → **刪掉該source** → 成品自動貼群組

## 重要：為什麼不經Telegram
Telegram bot看不到其他bot發的訊息（privacy mode），GO代碼走Telegram行不通。
正確做法是透過小書的API server直連觸發，成品再用小書bot token貼群組。

---

## 分工接力協議（Blackboard Pattern）

核心概念：NLM是共用黑板，每個人做完自己的部分，半成品存回NLM給下一位，成品往群組丟。

### 流程
```
喝妹出規格書 → 存NLM（🔄 待處理）→ 訊號給小書
小書讀NLM → 產出提示詞 → 是成品？→ 往群組丟
                                    ↓ 是半成品？
                               存NLM（🔄 待處理）→ 訊號給下一位
```

### 三個動作循環
1. **收到訊號** → 去NLM看分工和資料
2. **做事**
   - 做完是**成品** → 往群組丟，刪NLM來源
   - 做完是**半成品** → 存回NLM（🔄 待處理）→ 發訊號給下一階的人
3. **下一階的人** 重複步驟1

### 訊號方式
- 喝妹→小書：`ping-xiaoshu GO`（API server直連）
- 未來加人：每個agent有自己的API server，互相觸發
- 所有訊號統一用GO，NLM標題用「🔄 待處理」

### 優點
- 不用老闆介入
- 不用知道其他agent的細節，只要知道去NLM拿資料
- 半成品不會丟失，都在NLM
- 成品統一往群組丟，所有人都看得到

## 存任務到NLM
```bash
source /home/awang/.hermes/profiles/xiaoshu/.env
export PATH="/home/awang/.local/bin:$PATH"
nlm source add 7ab784b2-5207-4604-8845-eb435139ec0d \
  --text "類型：IMGEX（影像提示詞產出）
主題：XXX
題綱：XXX
規格書：XXX" \
  --title "🔄 待處理"
```

## 發送GO
```bash
HEME_TOKEN=$(grep TELEGRAM_BOT_TOKEN /home/awang/.hermes/.env | head -1 | cut -d= -f2)
curl -s -X POST "https://api.telegram.org/bot${HEME_TOKEN}/sendMessage" \
  -d chat_id="-5183772255" \
  -d text="📚 GO"
```

注意：必須用**喝妹的bot token**（HEME_TOKEN）發送，不能用小書的bot token。因為Telegram bot看不到自己發的訊息。

## 🔑 重大教訓：Telegram Bot隱私模式
Telegram bot預設開啟Group Privacy Mode，**看不到其他bot發的訊息**。只看得到真人用戶的訊息。

修復方法：去 @BotFather → `/mybots` → 選小書bot → Bot Settings → Group Privacy → **Turn off**

不改這個設定，喝妹發GO小書永遠接收不到。

## 小書SOUL.md設定
小書的SOUL.md必須包含GO指令說明，她才知道收到GO要做什麼：
```
⚠️ 收到「GO」→立刻去自己NLM（notebook 7ab784b2-5207-4604-8845-eb435139ec0d）找標題「🔄 待處理」的source→讀完執行→完成後刪掉該source→交付成品。找不到就回報「沒有新任務」。不回覆收到，直接做。
```

路徑：`/home/awang/.hermes/profiles/xiaoshu/SOUL.md`

改完SOUL.md後要重啟小書gateway：
```bash
# 殺掉舊進程
kill -9 $(pgrep -f "profile xiaoshu")
# 重啟
cd /home/awang/.hermes/hermes-agent && source venv/bin/activate && \
nohup python -m hermes_cli.main --profile xiaoshu gateway run --replace \
  >> /home/awang/.hermes/profiles/xiaoshu/logs/gateway.log 2>&1 &
```

## 規格書內容格式
存進NLM的「🔄 待處理」source文字格式：
```
類型：IMGEX（影像提示詞產出）
主題：一句話描述

題綱：場景描述

規格書：
風格：...
防火牆：...
字符：IMAGE≤1500 VIDEO≤1200
必含：...
淘汰：...
放開：...
```

## 備份（可選）
除了小書NLM，規格書也可存一份到共同NLM（`53dcc3cd-b755-45e1-b9f0-aebebf5c0275`）和喝妹NLM（`c8795f80-c61b-4feb-abb3-e7f470b3ce8b`）做備份，但小書那份是工作流程的核心。

## 刪除NLM source指令
```bash
nlm source delete <source_id> <notebook_id> -y
```

## NLM配額
- 每個notebook 50個source配額
- 字數200萬（1億字），非常充足
- 不需要省source，但用完即刪是紀律也是好習慣
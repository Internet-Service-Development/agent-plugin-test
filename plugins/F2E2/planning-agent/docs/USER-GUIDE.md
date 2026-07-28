# Planning Agent 使用手冊

## 這是什麼

Planning agent 是接在「資料蒐集（data-gathering）」之後的下一階段。它會讀取已經蒐集好的需求資料（Jira 描述、Figma 設計稿、Confluence 文件、現有程式碼），自動整理成一份完整的「實作規劃文件」，貼在 Issue 底下讓你 review、來回調整；你核准後，規劃結果會交給下一階段的 agent（coding-agent）實際動手寫程式。

---

## 安裝方式

(待補充)

---

## 使用前，你需要準備什麼

1. **一個已經跑過 data-gathering 的 GitHub Issue。**
   Planning 只接手「資料已經蒐集好」的 issue。如果這個 issue 還沒跑過 data-gathering，planning 會直接留言請你先跑，不會硬著頭皮生規劃。
2. **Issue 要有指派人（assignee）。**
   規劃過程中如果需要有人確認或補資料，agent 會 tag 這個人。沒有指派人的話，會改 tag issue 的建立者。
3. **（可選）觸發時想強調的方向。**
   你可以在 `@claude planning` 底下多寫一行，例如：

   ```
   @claude planning
   只做手機版，桌面版之後再排
   ```

   這類補充只會影響「規劃時怎麼取捨」（順序、範圍、強調重點），**不會**偷改需求本身（例如驗收清單、API 是否已就緒等）。如果你寫的方向跟正式需求對不上，agent 不會默默照做，而是會把衝突寫進規劃文件裡，讓你在 review 時自己確認。

---

## 怎麼觸發

在 GitHub Issue 留言：

```
@claude planning
```

即可開始執行。

---

## 執行時會發生什麼

1. **檢查資料夠不夠**
   - 資料完全沒有 → 留言請 assignee 先跑 data-gathering，之後留言 `@claude planning` 重跑。
   - 資料有缺口但補得出來（例如某個 Figma 節點沒解析、某段 API 沒寫清楚）→ agent 自己從既有資料推論，並在規劃文件裡標註「這裡是推論出來的」。
   - 缺口補不出來 → 留言列出「缺什麼、為什麼需要、影響規劃的哪個部分」，請 assignee 補齊後重跑 data-gathering。
2. **檢查現有程式碼寫法跟團隊規範是否衝突**
   預設照團隊規範走，不會把舊寫法沿用到新規劃裡；真的沒辦法判斷時才會留言請人類裁決。
3. **產出規劃文件**
   整理成一份完整規劃，貼在 Issue 底下的「## Planning Document」留言。
4. **等你 review**
   貼出規劃後，agent 會暫停並 tag assignee，請回覆下列三種之一：

   | 回覆方式                         | 意思                                       |
   | -------------------------------- | ------------------------------------------ |
   | `answer: approve`                | 同意，進入下一階段（實作）                 |
   | `answer: adjust: <你想改的地方>` | 要求調整，agent 修改後重新貼出，再等你確認 |
   | `answer: question: <你的問題>`   | 有疑問，agent 回答後再等你確認             |

   若你要調整的範圍很大（例如整個功能方向變了），一樣用 `adjust` 說明；agent 判斷是重大範圍變動時，會重新從「檢查資料夠不夠」整個跑一輪。

5. **完成**
   你回覆 `approve` 後，agent 做最後確認，保存規劃結果，並留言通知：規劃完成，可以留言 `@claude coding-agent` 開始實作。

---

## 最終輸出

你會在 Issue 看到一則「## Planning Document」留言，固定包含以下段落：

| 段落                           | 內容（人話版）                                                         |
| ------------------------------ | ---------------------------------------------------------------------- |
| External References            | 這次規劃引用的原始連結：Figma、Jira、Confluence、GitHub                |
| Handoff Quality                | 每個資料來源（Figma / Confluence / 程式碼）齊不齊全，缺的部分怎麼補的  |
| Codebase Context               | 可以重用的現有元件、專案慣例、建議的檔案結構                           |
| Routes                         | 這個功能會落在哪些頁面路徑                                             |
| API Layer Strategy             | 要接真的 API，還是先用假資料（mock）開發；用假資料的話附範例資料       |
| Layout Section                 | 畫面版面結構（從設計稿或截圖推導出來）                                 |
| Features                       | 每個功能點的驗收條件，寫成「情境 → 操作 → 結果」，方便對照你原本的需求 |
| Implementation Plan            | 要新增／修改哪些檔案、實作的先後順序                                   |
| Post-Implementation Deviations | 空白區，留給實作完成後記錄「跟計畫不一樣的地方」                       |

核准後，這份文件會被完整保存下來（交給下一階段的 coding-agent 使用）。你在 Issue 上看到的內容，跟系統保存的版本完全一致——之後隨時可以回到 Issue 上查看這份規劃。

---

## 常見狀況

- **回覆時忘了加 `answer: ...`，只打了 `@claude planning`** → agent 會提醒你要在下一行用 `answer:` 開頭才算有效回覆，並重新等你回覆。
- **Issue 沒有指派人** → 通知會改發給 issue 的建立者。
- **想追加需求或大改方向** → 用 `answer: adjust: <說明>`；若判斷是重大範圍變更，會重新檢查一次資料完整性再繼續規劃。
- **規範跟現有程式碼寫法衝突，agent 判斷不出來** → 會留言列出「現有寫法 / 規範怎麼寫 / 影響哪個段落」，請你回覆 `answer: standard`（照規範）、`answer: codebase`（照現有寫法）或說明你的考量。

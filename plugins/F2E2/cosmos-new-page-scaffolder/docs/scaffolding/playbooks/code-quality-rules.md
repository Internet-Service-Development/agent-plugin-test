# Code Quality Rules

適用於實作的統一品質規範。

## 必須（Must）

- 事件處理器命名使用 `handle + Verb + Noun`
- API 函式內不得新增 try/catch（由攔截器處理）
- JSX return 內不得放資料轉換與業務邏輯
- 未經核准不得修改 `libs/shared` 或其他共享檔
- UI 只用 `@eysoos/prisma`；icon 只用 `@eysoos/icons`
- 優先重用 `@eysoos/utils`
- 逐項檢查 naming、typing、side effect

## 參考文件

- `../references/code-quality-examples.md`

## 常見錯誤

- handler 命名顛倒（如 `handleTicketCreate`）
- 未確認就修改 shared 元件造成跨功能影響
- 在 JSX 內臨時做資料清洗導致行為不可測

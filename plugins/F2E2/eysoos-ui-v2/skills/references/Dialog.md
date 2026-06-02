# Dialog 組件

## Dialog

對話框組件，用於顯示模態視窗內容，支援覆蓋層和關閉功能，適用於確認對話框、表單彈窗等場景。

### 支援的 Props

| 名稱      | 型別       | 必填 | 預設值 | 用途                   |
| --------- | ---------- | ---- | ------ | ---------------------- |
| open      | boolean    | 是   |        | 控制對話框的開啟狀態   |
| children  | ReactNode  | 否   |        | 對話框的內容           |
| className | string     | 否   |        | 自訂 CSS 樣式類別      |
| onClose   | () => void | 否   |        | 對話框關閉時的回調函數 |

### 引入方式

```js
import { Dialog, type DialogProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Dialog open={isOpen} onClose={() => setIsOpen(false)}>
  <Dialog.Title>確認操作</Dialog.Title>
  <Dialog.Description>您確定要執行此操作嗎？</Dialog.Description>
  <div>
    <Button onClick={() => setIsOpen(false)}>取消</Button>
    <Button onClick={handleConfirm}>確認</Button>
  </div>
</Dialog>
```

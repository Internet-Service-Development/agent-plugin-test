# PageCountSelector 組件

## PageCountSelector

頁數選擇器組件，提供每頁顯示項目數量的選擇功能，適用於分頁場景中的項目數量控制。

### 支援的 Props

| 名稱              | 型別                    | 必填 | 預設值            | 用途                       |
| ----------------- | ----------------------- | ---- | ----------------- | -------------------------- |
| className         | string                  | 否   |                   | 自訂 CSS 樣式類別          |
| pageCount         | number                  | 否   |                   | 目前選中的頁數（受控模式） |
| label             | string                  | 否   | 'Items per page:' | 標籤文字                   |
| pageCountOptions  | number[]                | 否   | [10, 15, 20]      | 可選擇的頁數選項           |
| onPageCountChange | (count: number) => void | 否   |                   | 頁數改變時的回調函數       |

### 引入方式

```js
import { PageCountSelector, type PageCountSelectorProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<PageCountSelector
  label="每頁顯示："
  pageCount={currentPageCount}
  pageCountOptions={[5, 10, 20, 50]}
  onPageCountChange={count => {
    setCurrentPageCount(count);
    // 重新載入資料
    fetchData(1, count);
  }}
/>
```

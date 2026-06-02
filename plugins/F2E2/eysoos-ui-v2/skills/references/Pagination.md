# Pagination 組件

## Pagination

分頁組件，用於大量資料的分頁導航，支援頁碼跳轉和禁用狀態，適用於表格、列表等資料分頁場景。

### 支援的 Props

| 名稱        | 型別                                                | 必填 | 預設值 | 用途                 |
| ----------- | --------------------------------------------------- | ---- | ------ | -------------------- |
| className   | string                                              | 否   |        | 自訂 CSS 樣式類別    |
| count       | number                                              | 否   |        | 總頁數               |
| defaultPage | number                                              | 否   |        | 預設頁碼             |
| disabled    | boolean                                             | 否   |        | 是否禁用分頁器       |
| onChange    | (event: ChangeEvent<unknown>, page: number) => void | 否   |        | 頁碼改變時的回調函數 |
| page        | number                                              | 否   |        | 當前頁碼（受控模式） |

### 引入方式

```js
import { Pagination, type PaginationProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Pagination
  count={10}
  defaultPage={1}
  onChange={(event, page) => console.log('切換到頁碼:', page)}
/>
```

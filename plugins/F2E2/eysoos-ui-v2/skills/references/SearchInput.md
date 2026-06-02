# SearchInput 組件

## SearchInput

搜尋輸入框組件，提供帶有搜尋圖示和清除功能的輸入框，適用於搜尋功能、過濾器等場景。

### 支援的 Props

| 名稱           | 型別                                           | 必填 | 預設值 | 用途                         |
| -------------- | ---------------------------------------------- | ---- | ------ | ---------------------------- |
| className      | string                                         | 否   |        | 自訂 CSS 樣式類別            |
| fullWidth      | boolean                                        | 否   | false  | 是否將寬度設為 100%          |
| placeholder    | string                                         | 否   |        | 佔位文字                     |
| value          | string                                         | 否   |        | 輸入框的值（受控模式）       |
| defaultValue   | string                                         | 否   |        | 輸入框的預設值（非受控模式） |
| onChange       | (event: ChangeEvent<HTMLInputElement>) => void | 否   |        | 值改變時的回調函數           |
| onClear        | () => void                                     | 否   |        | 清除按鈕點擊時的回調函數     |
| hideClear      | boolean                                        | 否   | false  | 是否隱藏清除按鈕             |
| hideSearchIcon | boolean                                        | 否   | false  | 是否隱藏搜尋圖示             |

### 引入方式

```js
import { SearchInput, type SearchInputProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<SearchInput
  placeholder="搜尋內容..."
  value={searchValue}
  onChange={e => setSearchValue(e.target.value)}
  onClear={() => setSearchValue('')}
  fullWidth={true}
/>
```

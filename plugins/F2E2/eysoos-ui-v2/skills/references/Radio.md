# Radio 組件

## Radio

單選按鈕組件，用於讓使用者從多個選項中選擇一個，支援受控和非受控模式，適用於單選場景。

### 支援的 Props

| 名稱           | 型別                                           | 必填 | 預設值   | 用途                                 |
| -------------- | ---------------------------------------------- | ---- | -------- | ------------------------------------ |
| className      | string                                         | 否   |          | 自訂 CSS 樣式類別                    |
| size           | 'small' \| 'medium'                            | 否   | 'medium' | 單選按鈕的尺寸大小                   |
| htmlSize       | number                                         | 否   |          | 原生 HTML input 元素的 size 屬性     |
| checked        | boolean                                        | 否   |          | 單選按鈕的選中狀態（受控模式）       |
| defaultChecked | boolean                                        | 否   |          | 單選按鈕的預設選中狀態（非受控模式） |
| onChange       | (event: ChangeEvent<HTMLInputElement>) => void | 否   |          | 選中狀態改變時的回調函數             |
| value          | string \| number                               | 否   |          | 單選按鈕的值                         |
| name           | string                                         | 否   |          | 單選按鈕組的名稱                     |
| disabled       | boolean                                        | 否   |          | 是否禁用單選按鈕                     |

### 引入方式

```js
import { Radio, type RadioProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Radio
  value="option1"
  checked={selectedValue === 'option1'}
  onChange={e => setSelectedValue(e.target.value)}
/>
```

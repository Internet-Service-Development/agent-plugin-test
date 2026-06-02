# Textarea 組件

## Textarea

文字區域組件，提供多行文字輸入功能，支援自動調整高度和字數限制，適用於長文字輸入場景。

### 支援的 Props

| 名稱         | 型別                                              | 必填 | 預設值   | 用途                           |
| ------------ | ------------------------------------------------- | ---- | -------- | ------------------------------ |
| className    | string                                            | 否   |          | 自訂 CSS 樣式類別              |
| size         | 'small' \| 'medium'                               | 否   | 'medium' | 文字區域的尺寸大小             |
| placeholder  | string                                            | 否   |          | 佔位文字                       |
| value        | string                                            | 否   |          | 文字區域的值（受控模式）       |
| defaultValue | string                                            | 否   |          | 文字區域的預設值（非受控模式） |
| onChange     | (event: ChangeEvent<HTMLTextAreaElement>) => void | 否   |          | 值改變時的回調函數             |
| rows         | number                                            | 否   | 3        | 顯示的行數                     |
| maxLength    | number                                            | 否   |          | 最大字數限制                   |
| autoResize   | boolean                                           | 否   | false    | 是否自動調整高度               |
| disabled     | boolean                                           | 否   | false    | 是否禁用                       |
| readOnly     | boolean                                           | 否   | false    | 是否為唯讀模式                 |
| error        | boolean                                           | 否   | false    | 是否顯示錯誤狀態               |
| fullWidth    | boolean                                           | 否   | false    | 是否將寬度設為 100%            |

### 引入方式

```js
import { Textarea, type TextareaProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Textarea
  placeholder="請輸入內容"
  rows={4}
  maxLength={500}
  autoResize={true}
  onChange={e => console.log(e.target.value)}
/>
```

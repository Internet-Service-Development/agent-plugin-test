# Input 組件

## Input

輸入框組件，提供文字輸入功能，支援多種尺寸、錯誤狀態和全寬度設定，適用於表單輸入場景。

### 支援的 Props

| 名稱         | 型別                                           | 必填 | 預設值   | 用途                             |
| ------------ | ---------------------------------------------- | ---- | -------- | -------------------------------- |
| className    | string                                         | 否   |          | 自訂 CSS 樣式類別                |
| type         | string                                         | 否   | 'text'   | 輸入框的類型                     |
| value        | string \| number                               | 否   |          | 輸入框的值（受控模式）           |
| defaultValue | string \| number                               | 否   |          | 輸入框的預設值（非受控模式）     |
| onChange     | (event: ChangeEvent<HTMLInputElement>) => void | 否   |          | 值改變時的回調函數               |
| size         | 'small' \| 'medium'                            | 否   | 'medium' | 輸入框的尺寸大小                 |
| htmlSize     | number                                         | 否   |          | 原生 HTML input 元素的 size 屬性 |
| error        | boolean                                        | 否   | false    | 是否顯示錯誤狀態                 |
| fullWidth    | boolean                                        | 否   | false    | 是否將寬度設為 100%              |
| placeholder  | string                                         | 否   |          | 輸入框的佔位文字                 |
| disabled     | boolean                                        | 否   |          | 是否禁用輸入框                   |
| readOnly     | boolean                                        | 否   |          | 是否為唯讀模式                   |

### 引入方式

```js
import { Input, type InputProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Input
  placeholder="請輸入文字"
  size="medium"
  onChange={e => console.log(e.target.value)}
/>
```

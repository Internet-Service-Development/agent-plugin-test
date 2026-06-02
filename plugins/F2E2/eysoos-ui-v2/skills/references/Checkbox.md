# Checkbox 組件

## Checkbox

核取方塊組件，用於讓使用者進行多選操作，支援受控和非受控模式，以及不確定狀態顯示。

### 支援的 Props

| 名稱           | 型別                                           | 必填 | 預設值   | 用途                                 |
| -------------- | ---------------------------------------------- | ---- | -------- | ------------------------------------ |
| className      | string                                         | 否   |          | 自訂 CSS 樣式類別                    |
| size           | 'small' \| 'medium'                            | 否   | 'medium' | 核取方塊的尺寸大小                   |
| htmlSize       | number                                         | 否   |          | 原生 HTML input 元素的 size 屬性     |
| checked        | boolean                                        | 否   |          | 核取方塊的選中狀態（受控模式）       |
| defaultChecked | boolean                                        | 否   |          | 核取方塊的預設選中狀態（非受控模式） |
| indeterminate  | boolean                                        | 否   |          | 是否顯示不確定狀態                   |
| onChange       | (event: ChangeEvent<HTMLInputElement>) => void | 否   |          | 選中狀態改變時的回調函數             |
| disabled       | boolean                                        | 否   |          | 是否禁用核取方塊                     |

### 引入方式

```js
import { Checkbox, type CheckboxProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Checkbox
  size="medium"
  defaultChecked={true}
  onChange={e => console.log(e.target.checked)}
/>
```

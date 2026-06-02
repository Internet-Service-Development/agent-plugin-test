# ControlLabel 組件

## ControlLabel

控制項標籤組件，用於為表單控制項（如 Checkbox、Radio 等）提供標籤文字，支援標籤位置設定和禁用狀態。

### 支援的 Props

| 名稱      | 型別                           | 必填 | 預設值   | 用途                   |
| --------- | ------------------------------ | ---- | -------- | ---------------------- |
| children  | ReactNode                      | 否   |          | 標籤的文字內容         |
| className | string                         | 否   |          | 自訂 CSS 樣式類別      |
| control   | ReactElement                   | 是   |          | 要關聯的表單控制項元素 |
| placement | 'start' \| 'end'               | 否   | 'start'  | 標籤相對於控制項的位置 |
| disabled  | boolean                        | 否   |          | 是否禁用標籤和控制項   |
| size      | 'small' \| 'medium' \| 'large' | 否   | 'medium' | 標籤的尺寸大小         |

### 引入方式

```js
import { ControlLabel, type ControlLabelProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<ControlLabel control={<Checkbox />} placement="start">
  同意服務條款
</ControlLabel>
```

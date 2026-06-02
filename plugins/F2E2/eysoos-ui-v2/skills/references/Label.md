# Label 組件

## Label

標籤組件，用於為表單元素提供標籤文字，支援必填標示和不同尺寸，適用於表單欄位標籤。

### 支援的 Props

| 名稱      | 型別                | 必填 | 預設值   | 用途                   |
| --------- | ------------------- | ---- | -------- | ---------------------- |
| children  | ReactNode           | 否   |          | 標籤的文字內容         |
| className | string              | 否   |          | 自訂 CSS 樣式類別      |
| required  | boolean             | 否   |          | 是否顯示必填標示（\*） |
| size      | 'small' \| 'medium' | 否   | 'medium' | 標籤的尺寸大小         |
| htmlFor   | string              | 否   |          | 關聯的表單元素 ID      |

### 引入方式

```js
import { Label, type LabelProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Label required={true} htmlFor="username" size="medium">
  使用者名稱
</Label>
```

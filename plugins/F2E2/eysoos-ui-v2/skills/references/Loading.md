# Loading 組件

## Loading

載入組件，用於顯示載入狀態，提供旋轉動畫效果，適用於資料載入、操作處理等等待場景。

### 支援的 Props

| 名稱      | 型別                | 必填 | 預設值   | 用途               |
| --------- | ------------------- | ---- | -------- | ------------------ |
| className | string              | 否   |          | 自訂 CSS 樣式類別  |
| size      | 'medium' \| 'small' | 否   | 'medium' | 載入圖示的尺寸大小 |

### 引入方式

```js
import { Loading, type LoadingProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Loading size="medium" />
```

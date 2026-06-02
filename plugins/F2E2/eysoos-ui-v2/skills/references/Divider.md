# Divider 組件

## Divider

分隔線組件，用於在介面中創建視覺分隔，支援水平和垂直方向，適用於內容區塊分隔、選單項目分隔等場景。

### 支援的 Props

| 名稱        | 型別                       | 必填 | 預設值       | 用途              |
| ----------- | -------------------------- | ---- | ------------ | ----------------- |
| className   | string                     | 否   |              | 自訂 CSS 樣式類別 |
| orientation | 'horizontal' \| 'vertical' | 否   | 'horizontal' | 分隔線的方向      |

### 引入方式

```js
import { Divider, type DividerProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Divider orientation="horizontal" style={{ margin: '40px 0' }} />
```

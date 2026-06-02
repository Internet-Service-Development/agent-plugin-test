# Progress 組件

## Progress

進度條組件，以圓形進度條的形式顯示任務完成進度，支援自訂顏色和動畫效果，適用於載入進度、任務完成度等場景。

### 支援的 Props

| 名稱          | 型別                          | 必填 | 預設值    | 用途               |
| ------------- | ----------------------------- | ---- | --------- | ------------------ |
| className     | string                        | 否   |           | 自訂 CSS 樣式類別  |
| progress      | number                        | 是   |           | 進度值（0-100）    |
| size          | number                        | 否   | 105       | 進度條的尺寸大小   |
| strokeWidth   | number                        | 否   | 16        | 進度條的線條寬度   |
| startColor    | string                        | 否   | '#a5d6fe' | 漸變起始顏色       |
| endColor      | string                        | 否   | '#006ce1' | 漸變結束顏色       |
| strokeLinecap | 'butt' \| 'round' \| 'square' | 否   | 'round'   | 線條端點樣式       |
| hideText      | boolean                       | 否   | false     | 是否隱藏百分比文字 |

### 引入方式

```js
import { Progress, type ProgressProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Progress progress={75} size={120} startColor="#ff6b6b" endColor="#4ecdc4" />
```

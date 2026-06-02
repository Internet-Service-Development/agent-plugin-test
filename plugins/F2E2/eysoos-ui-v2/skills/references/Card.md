# Card 組件

## Card

卡片組件，用於將相關內容組織在一個容器中，提供多種視覺樣式變體，適用於內容展示、資訊分組等場景。

### 支援的 Props

| 名稱      | 型別                                                                                     | 必填 | 預設值   | 用途               |
| --------- | ---------------------------------------------------------------------------------------- | ---- | -------- | ------------------ |
| children  | ReactNode                                                                                | 否   |          | 卡片內的子元素內容 |
| className | string                                                                                   | 否   |          | 自訂 CSS 樣式類別  |
| variant   | 'dialog' \| 'normal' \| 'hover' \| 'strongHover' \| 'suspension' \| 'bgGray' \| 'border' | 否   | 'normal' | 卡片的樣式變體     |

### 引入方式

```js
import { Card, type CardProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Card variant="normal">
  <h3>標題</h3>
  <p>這是卡片內容</p>
</Card>
```

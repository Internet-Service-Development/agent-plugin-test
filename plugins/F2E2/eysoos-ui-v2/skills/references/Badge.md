# Badge 組件

## Badge

徽章組件，用於在其他元素上顯示小型的狀態指示器或計數器，常用於通知數量、狀態標示等。

### 支援的 Props

| 名稱         | 型別                                                         | 必填 | 預設值      | 用途                                                      |
| ------------ | ------------------------------------------------------------ | ---- | ----------- | --------------------------------------------------------- |
| className    | string                                                       | 否   |             | 自訂 CSS 樣式類別                                         |
| badgeContent | ReactNode                                                    | 否   |             | 徽章內顯示的內容                                          |
| children     | ReactNode                                                    | 否   |             | 被徽章裝飾的子元素                                        |
| max          | number                                                       | 否   | 99          | 當 badgeContent 為數字時的最大顯示值，超過時顯示為 "max+" |
| placement    | 'top-left' \| 'top-right' \| 'bottom-left' \| 'bottom-right' | 否   | 'top-right' | 徽章相對於子元素的位置                                    |

### 引入方式

```js
import { Badge, type BaseBadgeProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Badge badgeContent={5} placement="top-right">
  <button>訊息</button>
</Badge>
```

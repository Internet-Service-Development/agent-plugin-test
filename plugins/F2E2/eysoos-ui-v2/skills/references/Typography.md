# Typography 組件

## Typography

排版組件，提供統一的文字樣式和層級，支援多種文字層級，適用於內容排版、標題顯示等場景。

### 支援的 Props

| 名稱      | 型別                       | 必填 | 預設值 | 用途                                   |
| --------- | -------------------------- | ---- | ------ | -------------------------------------- |
| children  | ReactNode                  | 否   |        | 文字內容                               |
| className | string                     | 否   |        | 自訂 CSS 樣式類別                      |
| level     | 1 \| 2 \| 3 \| 4 \| 5 \| 6 | 否   | 1      | 文字的層級（對應不同的字體大小和樣式） |

### 子組件

#### Typography.Heading

標題組件，用於顯示各級標題。

### 引入方式

```js
import { Typography, type TypographyProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
{
  /* 基本文字 */
}
<Typography level={1}>這是第一級文字</Typography>;

{
  /* 標題 */
}
<Typography.Heading level={2}>這是二級標題</Typography.Heading>;

{
  /* 不同層級的文字 */
}
<Typography level={3}>這是第三級文字，通常用於副標題</Typography>;
```

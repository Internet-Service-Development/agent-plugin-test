# Avatar 組件

## Avatar

頭像組件，用於顯示使用者頭像，支援圖片、文字或預設圖示，適用於使用者資訊展示。

### 支援的 Props

| 名稱      | 型別                           | 必填 | 預設值   | 用途                                           |
| --------- | ------------------------------ | ---- | -------- | ---------------------------------------------- |
| children  | ReactNode                      | 否   |          | 頭像的子元素內容，通常為文字或圖示             |
| className | string                         | 否   |          | 自訂 CSS 樣式類別                              |
| size      | 'small' \| 'medium' \| 'large' | 否   | 'medium' | 頭像的尺寸大小                                 |
| src       | string                         | 否   |          | 頭像圖片的來源網址                             |
| alt       | string                         | 否   |          | 圖片的替代文字，當無圖片時也會作為文字內容顯示 |

### 引入方式

```js
import { Avatar, type AvatarProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Avatar size="large" src="/path/to/image.jpg" alt="使用者頭像">
  JC
</Avatar>
```

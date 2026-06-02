# IconButton 組件

## IconButton

圖示按鈕組件，提供僅包含圖示的按鈕樣式，支援不同尺寸和靜音模式，適用於工具列、操作按鈕等場景。

### 支援的 Props

| 名稱      | 型別                                           | 必填 | 預設值   | 用途                           |
| --------- | ---------------------------------------------- | ---- | -------- | ------------------------------ |
| children  | ReactNode                                      | 否   |          | 按鈕內的圖示元素               |
| className | string                                         | 否   |          | 自訂 CSS 樣式類別              |
| size      | 'small' \| 'medium'                            | 否   | 'medium' | 按鈕的尺寸大小                 |
| quiet     | boolean                                        | 否   |          | 是否使用靜音樣式（較低對比度） |
| onClick   | (event: MouseEvent<HTMLButtonElement>) => void | 否   |          | 點擊按鈕時的回調函數           |
| disabled  | boolean                                        | 否   |          | 是否禁用按鈕                   |

### 引入方式

```js
import { IconButton, type IconButtonProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<IconButton size="medium" onClick={() => console.log('編輯')}>
  <EditIcon />
</IconButton>

<IconButton size="small" quiet={true}>
  <DeleteIcon />
</IconButton>

<IconButton disabled={true}>
  <SaveIcon />
</IconButton>
```

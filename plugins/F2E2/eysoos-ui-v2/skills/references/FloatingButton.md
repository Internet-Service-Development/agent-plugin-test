# FloatingButton 組件

## FloatingButton

浮動按鈕組件，提供懸浮在介面上的操作按鈕，支援圓形和延伸兩種樣式，適用於主要操作、快速動作等場景。

### 支援的 Props

| 名稱      | 型別                                           | 必填 | 預設值     | 用途                           |
| --------- | ---------------------------------------------- | ---- | ---------- | ------------------------------ |
| children  | ReactNode                                      | 否   |            | 按鈕的內容（通常是圖示或文字） |
| className | string                                         | 否   |            | 自訂 CSS 樣式類別              |
| variant   | 'circular' \| 'extended'                       | 否   | 'circular' | 按鈕的樣式變體                 |
| onClick   | (event: MouseEvent<HTMLButtonElement>) => void | 否   |            | 點擊按鈕時的回調函數           |
| disabled  | boolean                                        | 否   |            | 是否禁用按鈕                   |
| type      | 'button' \| 'submit' \| 'reset'                | 否   |            | 按鈕的 HTML type 屬性          |

### 引入方式

```js
import { FloatingButton, type FloatingButtonProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<FloatingButton variant="circular" onClick={() => console.log('新增')}>
  <PlusIcon />
</FloatingButton>

<FloatingButton variant="extended">
  <EditIcon />
  編輯
</FloatingButton>

<FloatingButton disabled={true}>
  <SaveIcon />
</FloatingButton>
```

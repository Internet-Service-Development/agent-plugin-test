# CloseButton 組件

## CloseButton

關閉按鈕組件，提供標準化的關閉操作按鈕，內建關閉圖示，適用於對話框、彈出視窗等需要關閉功能的場景。

### 支援的 Props

| 名稱      | 型別                                           | 必填 | 預設值   | 用途                  |
| --------- | ---------------------------------------------- | ---- | -------- | --------------------- |
| className | string                                         | 否   |          | 自訂 CSS 樣式類別     |
| size      | 'medium' \| 'large'                            | 否   | 'medium' | 關閉按鈕的尺寸大小    |
| type      | 'button' \| 'submit' \| 'reset'                | 否   | 'button' | 按鈕的 HTML type 屬性 |
| white     | boolean                                        | 否   | false    | 是否使用白色樣式      |
| onClick   | (event: MouseEvent<HTMLButtonElement>) => void | 否   |          | 點擊按鈕時的回調函數  |
| disabled  | boolean                                        | 否   |          | 是否禁用按鈕          |

### 引入方式

```js
import { CloseButton, type CloseButtonProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<CloseButton size="medium" onClick={() => console.log('關閉')} />
```

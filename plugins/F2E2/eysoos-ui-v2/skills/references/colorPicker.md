# ColorPicker 組件

## ColorPicker

顏色選擇器組件，提供直觀的顏色選擇介面，支援色彩環、色彩輸入框等功能，適用於需要顏色設定的場景。

### 支援的 Props

| 名稱          | 型別                    | 必填 | 預設值 | 用途                 |
| ------------- | ----------------------- | ---- | ------ | -------------------- |
| className     | string                  | 否   |        | 自訂 CSS 樣式類別    |
| color         | string                  | 否   | ''     | 目前選中的顏色值     |
| disabled      | boolean                 | 否   |        | 是否禁用顏色選擇器   |
| onColorChange | (color: string) => void | 否   |        | 顏色改變時的回調函數 |

### 引入方式

```js
import { ColorPicker, type ColorPickerProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<ColorPicker
  color="#ff0000"
  onColorChange={color => console.log('選中顏色:', color)}
/>
```

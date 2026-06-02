# TextLink 組件

## TextLink

文字連結組件，提供帶有圖示和下劃線選項的連結樣式，適用於導航連結、外部連結等場景。

### 支援的 Props

| 名稱         | 型別                        | 必填 | 預設值                 | 用途                 |
| ------------ | --------------------------- | ---- | ---------------------- | -------------------- |
| children     | ReactNode                   | 否   |                        | 連結的文字內容       |
| className    | string                      | 否   |                        | 自訂 CSS 樣式類別    |
| href         | string                      | 否   |                        | 連結的目標 URL       |
| target       | string                      | 否   |                        | 連結的開啟方式       |
| rel          | string                      | 否   | 'noreferrer noopenner' | 連結的關係屬性       |
| isUnderline  | boolean                     | 否   | false                  | 是否顯示下劃線       |
| icon         | ReactNode                   | 否   |                        | 連結的圖示           |
| iconPosition | 'left' \| 'right'           | 否   | 'right'                | 圖示的位置           |
| onClick      | (event: MouseEvent) => void | 否   |                        | 點擊連結時的回調函數 |

### 引入方式

```js
import { TextLink, type TextLinkProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<TextLink
  href="https://example.com"
  target="_blank"
  isUnderline={true}
  icon={<ExternalLinkIcon />}
  iconPosition="right"
>
  前往外部網站
</TextLink>
```

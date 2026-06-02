# Switch 組件

## Switch

開關組件，提供開啟/關閉的切換功能，支援不同尺寸和禁用狀態，適用於設定開關、功能切換等場景。

### 支援的 Props

| 名稱           | 型別                       | 必填 | 預設值   | 用途                         |
| -------------- | -------------------------- | ---- | -------- | ---------------------------- |
| className      | string                     | 否   |          | 自訂 CSS 樣式類別            |
| size           | 'small' \| 'medium'        | 否   | 'medium' | 開關的尺寸大小               |
| checked        | boolean                    | 否   |          | 開關的狀態（受控模式）       |
| defaultChecked | boolean                    | 否   |          | 開關的預設狀態（非受控模式） |
| onChange       | (checked: boolean) => void | 否   |          | 狀態改變時的回調函數         |
| disabled       | boolean                    | 否   | false    | 是否禁用開關                 |

### 引入方式

```js
import { Switch, type SwitchProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Switch
  size="medium"
  checked={isEnabled}
  onChange={checked => setIsEnabled(checked)}
/>
```

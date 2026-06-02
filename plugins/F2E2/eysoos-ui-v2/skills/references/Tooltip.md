# Tooltip 組件

## Tooltip

提示框組件，當使用者懸停或聚焦在元素上時顯示額外資訊，支援多種位置和尺寸，適用於提供輔助說明。

### 支援的 Props

| 名稱          | 型別                                   | 必填 | 預設值   | 用途                               |
| ------------- | -------------------------------------- | ---- | -------- | ---------------------------------- |
| children      | ReactNode                              | 是   |          | 觸發提示框的元素                   |
| className     | string                                 | 否   |          | 自訂 CSS 樣式類別                  |
| title         | ReactNode                              | 是   |          | 提示框顯示的內容                   |
| placement     | 'top' \| 'bottom' \| 'left' \| 'right' | 否   | 'bottom' | 提示框的顯示位置                   |
| size          | 'small' \| 'medium' \| 'large'         | 否   |          | 提示框的尺寸大小                   |
| open          | boolean                                | 否   |          | 控制提示框的顯示狀態（受控模式）   |
| defaultOpen   | boolean                                | 否   |          | 提示框的預設顯示狀態（非受控模式） |
| onOpenChange  | (open: boolean) => void                | 否   |          | 顯示狀態改變時的回調函數           |
| delayDuration | number                                 | 否   | 500      | 滑鼠進入後延遲顯示的時間（毫秒）   |
| noFade        | boolean                                | 否   |          | 是否禁用淡入淡出動畫               |

### 引入方式

```js
import { Tooltip, type TooltipProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Tooltip title="這是一個提示訊息" placement="top">
  <Button>懸停顯示提示</Button>
</Tooltip>
```

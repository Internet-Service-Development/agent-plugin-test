# Popover 組件

## Popover

彈出框組件，提供相對於錨點元素的浮動內容容器，支援多種定位選項，適用於下拉選單、詳細資訊展示等場景。

### 支援的 Props

| 名稱                | 型別                                                                                   | 必填 | 預設值                                     | 用途                             |
| ------------------- | -------------------------------------------------------------------------------------- | ---- | ------------------------------------------ | -------------------------------- |
| children            | ReactNode                                                                              | 否   |                                            | 彈出框的內容                     |
| className           | string                                                                                 | 否   |                                            | 自訂 CSS 樣式類別                |
| open                | boolean                                                                                | 是   |                                            | 控制彈出框的顯示狀態             |
| anchorEl            | Element \| null                                                                        | 否   |                                            | 錨點元素，彈出框相對於此元素定位 |
| anchorOrigin        | { vertical: 'top' \| 'center' \| 'bottom', horizontal: 'left' \| 'center' \| 'right' } | 否   | { vertical: 'bottom', horizontal: 'left' } | 錨點的對齊位置                   |
| transformOrigin     | { vertical: 'top' \| 'center' \| 'bottom', horizontal: 'left' \| 'center' \| 'right' } | 否   |                                            | 彈出框的變換原點                 |
| onClose             | (event: {}, reason: 'backdropClick' \| 'escapeKeyDown') => void                        | 否   |                                            | 彈出框關閉時的回調函數           |
| disableAutoFocus    | boolean                                                                                | 否   |                                            | 是否禁用自動聚焦                 |
| disableEnforceFocus | boolean                                                                                | 否   |                                            | 是否禁用強制聚焦                 |
| disablePortal       | boolean                                                                                | 否   |                                            | 是否禁用 Portal 渲染             |

### 引入方式

```js
import { Popover, type PopoverProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Popover
  open={isOpen}
  anchorEl={anchorElement}
  onClose={() => setIsOpen(false)}
  anchorOrigin={{
    vertical: 'bottom',
    horizontal: 'left',
  }}
>
  <div style={{ padding: '16px' }}>彈出框內容</div>
</Popover>
```

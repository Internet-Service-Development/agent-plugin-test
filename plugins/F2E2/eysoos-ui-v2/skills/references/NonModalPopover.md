# NonModalPopover 組件

## NonModalPopover

非模態彈出框組件，基於 Ant Design 的 Popover 組件封裝，提供非阻塞式的內容展示，適用於提示資訊、選單等場景。

### 支援的 Props

| 名稱                 | 型別                                                                                                                                                           | 必填 | 預設值        | 用途                           |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---- | ------------- | ------------------------------ |
| children             | ReactNode                                                                                                                                                      | 否   |               | 觸發彈出框的元素               |
| className            | string                                                                                                                                                         | 否   |               | 自訂 CSS 樣式類別              |
| content              | ReactNode                                                                                                                                                      | 否   |               | 彈出框的內容                   |
| open                 | boolean                                                                                                                                                        | 否   |               | 控制彈出框的顯示狀態           |
| placement            | 'top' \| 'topLeft' \| 'topRight' \| 'bottom' \| 'bottomLeft' \| 'bottomRight' \| 'left' \| 'leftTop' \| 'leftBottom' \| 'right' \| 'rightTop' \| 'rightBottom' | 否   | 'bottomRight' | 彈出框的顯示位置               |
| trigger              | 'hover' \| 'focus' \| 'click' \| 'contextMenu'                                                                                                                 | 否   | 'click'       | 觸發彈出框的方式               |
| onOpenChange         | (open: boolean) => void                                                                                                                                        | 否   |               | 顯示狀態改變時的回調函數       |
| align                | object                                                                                                                                                         | 否   |               | 對齊配置                       |
| destroyTooltipOnHide | boolean                                                                                                                                                        | 否   | true          | 隱藏時是否銷毀彈出框           |
| getPopupContainer    | (triggerNode: HTMLElement) => HTMLElement                                                                                                                      | 否   |               | 彈出框渲染的容器               |
| mouseEnterDelay      | number                                                                                                                                                         | 否   |               | 滑鼠移入後延遲顯示的時間（秒） |
| mouseLeaveDelay      | number                                                                                                                                                         | 否   |               | 滑鼠移出後延遲隱藏的時間（秒） |

### 特色功能

- 自動處理視窗大小變化時的位置調整
- 預設的對齊偏移量設定
- 支援多種觸發方式和位置
- 非阻塞式顯示，不影響背景操作

### 引入方式

```js
import { NonModalPopover, type NonModalPopoverProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<NonModalPopover
  placement="bottomRight"
  content={
    <div style={{ padding: '12px' }}>
      <p>這是彈出框的內容</p>
      <Button size="small">操作按鈕</Button>
    </div>
  }
  trigger="click"
  onOpenChange={open => console.log('彈出框狀態:', open)}
>
  <Button>點擊顯示彈出框</Button>
</NonModalPopover>
```

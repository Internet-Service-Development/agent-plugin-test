# RangePicker 組件

## RangePicker

日期範圍選擇器組件，提供日期範圍選擇功能，支援多種格式和自訂操作，適用於日期區間選擇場景。

### 支援的 Props

| 名稱            | 型別                                                                             | 必填 | 預設值              | 用途                       |
| --------------- | -------------------------------------------------------------------------------- | ---- | ------------------- | -------------------------- |
| className       | string                                                                           | 否   |                     | 自訂 CSS 樣式類別          |
| inputClassName  | string                                                                           | 否   |                     | 輸入框的自訂樣式類別       |
| popupClassName  | string                                                                           | 否   |                     | 彈出框的自訂樣式類別       |
| size            | 'small' \| 'medium'                                                              | 否   |                     | 組件的尺寸大小             |
| label           | ReactNode                                                                        | 否   |                     | 欄位標籤                   |
| labelPosition   | 'vertical' \| 'horizontal'                                                       | 否   |                     | 標籤的位置                 |
| helperText      | string                                                                           | 否   |                     | 輔助說明文字               |
| value           | [DateTimePickerValue, DateTimePickerValue] \| null                               | 否   |                     | 日期範圍值                 |
| onChange        | (dateRange: RangePickerValue, dateStringRange: [string, string] \| null) => void | 否   |                     | 值改變時的回調函數         |
| format          | string                                                                           | 否   | 'YYYY/MM/DD'        | 日期格式（dayjs 格式）     |
| placeholder     | string                                                                           | 否   | 'Select date range' | 佔位文字                   |
| disabled        | boolean                                                                          | 否   | false               | 是否禁用                   |
| error           | boolean                                                                          | 否   | false               | 是否顯示錯誤狀態           |
| fullWidth       | boolean                                                                          | 否   | false               | 是否將寬度設為 100%        |
| width           | string                                                                           | 否   |                     | 自訂寬度                   |
| open            | boolean                                                                          | 否   |                     | 控制彈出框的顯示狀態       |
| onOpenChange    | (open: boolean) => void                                                          | 否   |                     | 彈出框狀態改變時的回調函數 |
| clearButton     | boolean                                                                          | 否   | false               | 是否顯示清除按鈕           |
| customActionBar | ReactNode                                                                        | 否   |                     | 自訂操作欄                 |
| isUnixSecond    | boolean                                                                          | 否   | false               | 值是否為 Unix 秒時間戳     |

### 引入方式

```js
import { RangePicker, type RangePickerProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<RangePicker
  label="選擇日期範圍"
  value={dateRange}
  onChange={(range, stringRange) => {
    setDateRange(range);
    console.log('字串格式:', stringRange);
  }}
  format="YYYY-MM-DD"
  placeholder="請選擇日期範圍"
  clearButton={true}
/>
```

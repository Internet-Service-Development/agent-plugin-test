# TimePicker 組件

## TimePicker

時間選擇器組件，提供時間選擇功能，支援多種格式和操作按鈕，適用於時間輸入場景。

### 支援的 Props

| 名稱            | 型別                                 | 必填 | 預設值        | 用途                       |
| --------------- | ------------------------------------ | ---- | ------------- | -------------------------- |
| className       | string                               | 否   |               | 自訂 CSS 樣式類別          |
| inputClassName  | string                               | 否   |               | 輸入框的自訂樣式類別       |
| popupClassName  | string                               | 否   |               | 彈出框的自訂樣式類別       |
| size            | 'small' \| 'medium'                  | 否   | 'medium'      | 組件的尺寸大小             |
| label           | ReactNode                            | 否   |               | 欄位標籤                   |
| labelPosition   | 'vertical' \| 'horizontal'           | 否   | 'vertical'    | 標籤的位置                 |
| helperText      | string                               | 否   |               | 輔助說明文字               |
| value           | string \| number \| Date \| null     | 否   |               | 時間值                     |
| onChange        | (value: DateTimePickerValue) => void | 否   |               | 值改變時的回調函數         |
| format          | string                               | 否   | 'HH:mm'       | 時間格式（dayjs 格式）     |
| placeholder     | string                               | 否   | 'Select time' | 佔位文字                   |
| disabled        | boolean                              | 否   | false         | 是否禁用                   |
| error           | boolean                              | 否   | false         | 是否顯示錯誤狀態           |
| fullWidth       | boolean                              | 否   | false         | 是否將寬度設為 100%        |
| width           | string                               | 否   |               | 自訂寬度                   |
| open            | boolean                              | 否   |               | 控制彈出框的顯示狀態       |
| onOpenChange    | (open: boolean) => void              | 否   |               | 彈出框狀態改變時的回調函數 |
| minuteStep      | number                               | 否   | 30            | 分鐘的步進值               |
| nowButton       | boolean                              | 否   | true          | 是否顯示「現在」按鈕       |
| clearButton     | boolean                              | 否   | true          | 是否顯示清除按鈕           |
| okButton        | boolean                              | 否   | true          | 是否顯示確認按鈕           |
| customActionBar | ReactNode                            | 否   |               | 自訂操作欄                 |
| isUnixSecond    | boolean                              | 否   | false         | 值是否為 Unix 秒時間戳     |

### 引入方式

```js
import { TimePicker, type TimePickerProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<TimePicker
  label="選擇時間"
  value={selectedTime}
  onChange={time => setSelectedTime(time)}
  format="HH:mm:ss"
  minuteStep={15}
  placeholder="請選擇時間"
/>
```

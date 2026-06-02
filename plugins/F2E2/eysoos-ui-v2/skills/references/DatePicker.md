# DatePicker 組件

## DatePicker

日期選擇器組件，提供直觀的日期和時間選擇介面，支援多種日期格式、自訂按鈕和驗證功能，適用於表單中的日期輸入場景。

### 支援的 Props

| 名稱            | 型別                                               | 必填 | 預設值                              | 用途                             |
| --------------- | -------------------------------------------------- | ---- | ----------------------------------- | -------------------------------- |
| className       | string                                             | 否   |                                     | 自訂 CSS 樣式類別                |
| inputClassName  | string                                             | 否   |                                     | 輸入框的自訂 CSS 樣式類別        |
| popupClassName  | string                                             | 否   |                                     | 彈出面板的自訂 CSS 樣式類別      |
| size            | 'small' \| 'medium'                                | 否   | 'medium'                            | 組件的尺寸大小                   |
| label           | ReactNode                                          | 否   |                                     | 標籤文字                         |
| labelPosition   | 'vertical' \| 'horizontal'                         | 否   | 'vertical'                          | 標籤的位置                       |
| helperText      | string                                             | 否   |                                     | 輔助說明文字                     |
| value           | string \| number \| Date \| null                   | 否   |                                     | 日期選擇器的值                   |
| onChange        | (value: DateTimePickerValue) => void               | 否   |                                     | 值改變時的回調函數               |
| format          | string                                             | 否   | 'YYYY/MM/DD HH:mm'                  | 日期格式字串                     |
| todayButton     | boolean                                            | 否   | true                                | 是否顯示「今天」按鈕             |
| clearButton     | boolean                                            | 否   | true                                | 是否顯示清除按鈕                 |
| okButton        | boolean                                            | 否   | true                                | 是否顯示確認按鈕                 |
| fullWidth       | boolean                                            | 否   | false                               | 是否將寬度設為 100%              |
| error           | boolean                                            | 否   | false                               | 是否顯示錯誤狀態                 |
| width           | string                                             | 否   |                                     | 自訂寬度                         |
| customActionBar | ReactNode                                          | 否   |                                     | 自訂操作按鈕區域                 |
| isUnixSecond    | boolean                                            | 否   | false                               | 值是否為 Unix 秒時間戳           |
| picker          | 'date' \| 'week' \| 'month' \| 'quarter' \| 'year' | 否   | 'date'                              | 選擇器類型                       |
| placeholder     | string                                             | 否   | 'Select date'                       | 輸入框佔位文字                   |
| disabled        | boolean                                            | 否   | false                               | 是否禁用                         |
| open            | boolean                                            | 否   |                                     | 是否打開彈出面板（受控模式）     |
| onOpenChange    | (open: boolean) => void                            | 否   |                                     | 彈出面板開關狀態改變時的回調函數 |
| showTime        | object \| boolean                                  | 否   | { format: 'HH:mm', minuteStep: 30 } | 時間選擇器設定                   |
| disabledDate    | (current: Dayjs) => boolean                        | 否   |                                     | 禁用日期的判斷函數               |
| disabledTime    | (current: Dayjs) => object                         | 否   |                                     | 禁用時間的判斷函數               |

### 引入方式

```js
import { DatePicker, type DatePickerProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<DatePicker
  label="選擇日期"
  value={selectedDate}
  onChange={(date) => setSelectedDate(date)}
  placeholder="請選擇日期"
/>
```

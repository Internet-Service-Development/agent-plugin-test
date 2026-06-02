# Compact 組件

## Compact

緊湊組件，用於將多個相關的表單控制項組合在一起，提供統一的視覺樣式和焦點狀態管理，適用於複合輸入場景。

### 支援的 Props

| 名稱      | 型別                | 必填 | 預設值 | 用途                                                                                          |
| --------- | ------------------- | ---- | ------ | --------------------------------------------------------------------------------------------- |
| children  | ReactNode           | 否   |        | 要組合的子組件（支援 Button、Select、Input、InputGroup、TimePicker、DatePicker、RangePicker） |
| className | string              | 否   |        | 自訂 CSS 樣式類別                                                                             |
| fullWidth | boolean             | 否   | false  | 是否將組件寬度設為 100%                                                                       |
| error     | boolean             | 否   | false  | 是否顯示錯誤狀態                                                                              |
| size      | 'small' \| 'medium' | 否   |        | 統一設定子組件的尺寸大小                                                                      |

### 引入方式

```js
import { Compact, type CompactProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Compact fullWidth={true} size="medium">
  <Select options={selectOptions} placeholder="選擇" />
  <Input placeholder="輸入內容1" />
  <Input placeholder="輸入內容2" />
</Compact>
```

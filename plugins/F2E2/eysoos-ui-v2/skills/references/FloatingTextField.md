# FloatingTextField 組件

## FloatingTextField

浮動文字欄位組件，提供可編輯的文字顯示，支援點擊編輯和浮動編輯模式，適用於即時編輯、標籤編輯等場景。

### 支援的 Props

| 名稱         | 型別                                        | 必填 | 預設值              | 用途                 |
| ------------ | ------------------------------------------- | ---- | ------------------- | -------------------- |
| className    | string                                      | 否   |                     | 自訂 CSS 樣式類別    |
| error        | boolean                                     | 否   | false               | 是否顯示錯誤狀態     |
| disabled     | boolean                                     | 否   | false               | 是否禁用編輯功能     |
| readOnly     | boolean                                     | 否   | false               | 是否為唯讀模式       |
| editing      | boolean                                     | 否   | false               | 是否處於編輯狀態     |
| variant      | 'field' \| 'tab'                            | 否   | 'field'             | 組件的樣式變體       |
| orientation  | 'vertical' \| 'horizontal'                  | 否   | 'horizontal'        | 編輯框的方向         |
| size         | 'small' \| 'medium'                         | 否   | 'medium'            | 組件的尺寸大小       |
| placeholder  | string                                      | 否   | 'Please input text' | 佔位文字             |
| defaultValue | string                                      | 否   |                     | 預設值（非受控模式） |
| value        | string                                      | 否   |                     | 文字值（受控模式）   |
| onChange     | (val: string) => void                       | 否   |                     | 值改變時的回調函數   |
| onClick      | (event: MouseEvent<HTMLDivElement>) => void | 否   |                     | 點擊時的回調函數     |

### 引入方式

```js
import { FloatingTextField, type FloatingTextFieldProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<FloatingTextField
  defaultValue="點擊編輯"
  placeholder="請輸入文字"
  onChange={(value) => console.log('新值:', value)}
/>

<FloatingTextField
  value={text}
  variant="tab"
  orientation="vertical"
  size="small"
  onChange={setText}
/>

<FloatingTextField
  readOnly={true}
  value="唯讀文字"
/>
```

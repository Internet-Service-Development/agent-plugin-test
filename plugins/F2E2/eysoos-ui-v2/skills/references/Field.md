# Field 組件

## Field

欄位組件，提供表單欄位的統一容器，支援標籤、輔助文字和圖示提示，適用於表單佈局和欄位組織。

### 支援的 Props

| 名稱                  | 型別                       | 必填 | 預設值     | 用途                                                   |
| --------------------- | -------------------------- | ---- | ---------- | ------------------------------------------------------ |
| children              | ReactNode                  | 否   |            | 欄位的主要內容（通常是輸入控制項）                     |
| className             | string                     | 否   |            | 自訂 CSS 樣式類別                                      |
| label                 | ReactNode                  | 否   |            | 欄位的標籤文字                                         |
| fullWidth             | boolean                    | 否   | false      | 是否將寬度設為 100%                                    |
| orientation           | 'vertical' \| 'horizontal' | 否   | 'vertical' | 標籤和內容的排列方向                                   |
| labelProps            | LabelProps                 | 否   |            | 當標籤為字串或數字時，傳遞給 Label 組件的屬性          |
| helperText            | ReactNode                  | 否   |            | 輔助說明文字                                           |
| helperTextProps       | HelperTextProps            | 否   |            | 當輔助文字為字串或數字時，傳遞給 HelperText 組件的屬性 |
| helperTextOrientation | 'vertical' \| 'horizontal' | 否   | 'vertical' | 輔助文字的排列方向                                     |
| iconTooltipContent    | ReactNode                  | 否   |            | 圖示提示的內容                                         |

### 引入方式

```js
import { Field, type FieldProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Field
  label="使用者名稱"
  helperText="請輸入您的使用者名稱"
  orientation="vertical"
>
  <Input placeholder="輸入使用者名稱" />
</Field>

<Field
  label="密碼"
  fullWidth={true}
  iconTooltipContent="密碼必須包含至少 8 個字元"
>
  <Input type="password" />
</Field>

<Field orientation="horizontal">
  <Checkbox />
  <span>同意服務條款</span>
</Field>
```

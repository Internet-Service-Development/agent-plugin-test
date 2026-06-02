# OptionGroup 組件

## OptionGroup

選項群組組件，提供選項的群組化佈局，支援標籤、輔助文字和多種排列方向，適用於單選、多選等選項組織場景。

### 支援的 Props

| 名稱                  | 型別                       | 必填 | 預設值     | 用途                                       |
| --------------------- | -------------------------- | ---- | ---------- | ------------------------------------------ |
| children              | ReactNode                  | 否   |            | 選項群組的內容（通常是 Radio 或 Checkbox） |
| className             | string                     | 否   |            | 自訂 CSS 樣式類別                          |
| label                 | ReactNode                  | 否   |            | 群組標籤                                   |
| labelProps            | LabelProps                 | 否   |            | 標籤組件的屬性                             |
| labelOrientation      | 'vertical' \| 'horizontal' | 否   |            | 標籤的排列方向                             |
| optionOrientation     | 'vertical' \| 'horizontal' | 否   | 'vertical' | 選項的排列方向                             |
| helperText            | ReactNode                  | 否   |            | 輔助說明文字                               |
| helperTextProps       | HelperTextProps            | 否   |            | 輔助文字組件的屬性                         |
| helperTextOrientation | 'vertical' \| 'horizontal' | 否   | 'vertical' | 輔助文字的排列方向                         |
| required              | boolean                    | 否   | false      | 是否為必填欄位                             |
| error                 | boolean                    | 否   | false      | 是否顯示錯誤狀態                           |
| fullWidth             | boolean                    | 否   | false      | 是否將寬度設為 100%                        |

### 引入方式

```js
import { OptionGroup, type OptionGroupProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
{
  /* 垂直排列的單選群組 */
}
<OptionGroup
  label="選擇性別"
  required={true}
  optionOrientation="vertical"
  helperText="請選擇一個選項"
>
  <Radio name="gender" value="male">
    男性
  </Radio>
  <Radio name="gender" value="female">
    女性
  </Radio>
  <Radio name="gender" value="other">
    其他
  </Radio>
</OptionGroup>;

{
  /* 水平排列的多選群組 */
}
<OptionGroup
  label="興趣愛好"
  optionOrientation="horizontal"
  helperText="可選擇多個選項"
>
  <Checkbox value="reading">閱讀</Checkbox>
  <Checkbox value="music">音樂</Checkbox>
  <Checkbox value="sports">運動</Checkbox>
</OptionGroup>;
```

# HelperText 組件

## HelperText

輔助文字組件，用於提供額外的說明或錯誤訊息，支援不同尺寸和錯誤狀態，適用於表單欄位說明、驗證訊息等場景。

### 支援的 Props

| 名稱      | 型別                | 必填 | 預設值  | 用途              |
| --------- | ------------------- | ---- | ------- | ----------------- |
| children  | ReactNode           | 否   |         | 輔助文字的內容    |
| className | string              | 否   |         | 自訂 CSS 樣式類別 |
| error     | boolean             | 否   | false   | 是否顯示錯誤狀態  |
| size      | 'small' \| 'medium' | 否   | 'small' | 文字的尺寸大小    |

### 引入方式

```js
import { HelperText, type HelperTextProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<HelperText size="small">
  請輸入有效的電子郵件地址
</HelperText>

<HelperText error={true} size="medium">
  此欄位為必填項目
</HelperText>

<HelperText>
  密碼必須包含至少 8 個字元
</HelperText>
```

# AlertBanner 組件

## AlertBanner

警告橫幅組件，用於顯示重要的系統訊息、通知或警告資訊，支援多種狀態樣式和可關閉功能。

### 支援的 Props

| 名稱      | 型別                                                  | 必填 | 預設值        | 用途                               |
| --------- | ----------------------------------------------------- | ---- | ------------- | ---------------------------------- |
| children  | ReactNode                                             | 否   |               | 警告橫幅的內容文字                 |
| className | string                                                | 否   |               | 自訂 CSS 樣式類別                  |
| variant   | 'informative' \| 'positive' \| 'notice' \| 'negative' | 否   | 'informative' | 警告橫幅的樣式變體，決定顏色和圖示 |
| onClose   | () => void                                            | 否   |               | 點擊關閉按鈕時的回調函數           |
| closable  | boolean                                               | 否   | false         | 是否顯示關閉按鈕                   |

### 引入方式

```js
import { AlertBanner, type AlertBannerProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<AlertBanner variant="positive" closable onClose={() => console.log('關閉')}>
  來源已成功新增，恭喜您的網路載入了您的請求。
</AlertBanner>
```

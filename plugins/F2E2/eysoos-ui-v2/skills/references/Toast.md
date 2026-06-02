# Toast 組件

## Toast

吐司通知組件，提供非阻塞式的訊息通知功能，支援多種類型和位置，適用於操作反饋、系統通知等場景。

### 支援的 Props

#### ToastContainer Props

| 名稱      | 型別                                                                                            | 必填 | 預設值          | 用途                       |
| --------- | ----------------------------------------------------------------------------------------------- | ---- | --------------- | -------------------------- |
| className | string                                                                                          | 否   |                 | 自訂 CSS 樣式類別          |
| position  | 'top-left' \| 'top-center' \| 'top-right' \| 'bottom-left' \| 'bottom-center' \| 'bottom-right' | 否   | 'bottom-center' | 通知顯示的位置             |
| duration  | number                                                                                          | 否   | 5000            | 通知自動消失的時間（毫秒） |
| gap       | number                                                                                          | 否   | 14              | 通知之間的間距             |
| offset    | string                                                                                          | 否   | '40px'          | 距離螢幕邊緣的偏移量       |

#### displayToast 函數參數

| 名稱         | 型別                                        | 必填 | 預設值   | 用途                           |
| ------------ | ------------------------------------------- | ---- | -------- | ------------------------------ |
| variant      | 'info' \| 'success' \| 'warning' \| 'error' | 是   |          | 通知的類型                     |
| type         | 'normal' \| 'emphasis'                      | 否   | 'normal' | 通知的樣式類型                 |
| title        | string                                      | 是   |          | 通知的標題                     |
| description  | ReactNode                                   | 否   |          | 通知的詳細描述                 |
| actionButton | ReactNode                                   | 否   |          | 操作按鈕                       |
| position     | ToastPosition                               | 否   |          | 單個通知的位置（覆蓋全域設定） |
| persistent   | boolean                                     | 否   | false    | 是否持續顯示（不自動消失）     |

### 引入方式

```js
import {
  ToastContainer,
  displayToast,
  type ToastContainerProps,
} from '@eysoos/prisma';
```

### 組件使用範例

```tsx
// 在應用根部添加 ToastContainer
<ToastContainer position="top-right" duration={3000} />;

// 顯示通知
displayToast({
  variant: 'success',
  title: '操作成功',
  description: '您的資料已成功儲存',
  actionButton: <Button size="small">查看</Button>,
});
```

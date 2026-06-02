# Status 組件

## Status

狀態組件，用於顯示不同類型的狀態資訊，支援文字和按鈕兩種樣式，適用於狀態指示、分類標記等場景。

### 支援的 Props

| 名稱      | 型別                                                                         | 必填 | 預設值        | 用途                           |
| --------- | ---------------------------------------------------------------------------- | ---- | ------------- | ------------------------------ |
| children  | ReactNode                                                                    | 否   |               | 狀態顯示的內容                 |
| className | string                                                                       | 否   |               | 自訂 CSS 樣式類別              |
| variant   | 'text' \| 'button'                                                           | 是   |               | 狀態組件的樣式變體             |
| status    | 'informative' \| 'positive' \| 'notice' \| 'negative' \| 'neutral' \| string | 否   | 'informative' | 狀態類型（支援內建和自訂狀態） |
| size      | 'small' \| 'medium'                                                          | 否   | 'medium'      | 組件尺寸（僅 text 變體支援）   |
| disabled  | boolean                                                                      | 否   | false         | 是否禁用狀態                   |
| onClick   | (event: MouseEvent) => void                                                  | 否   |               | 點擊事件（僅 button 變體支援） |

### 狀態類型說明

- **informative**: 資訊狀態（藍色）
- **positive**: 正面狀態（綠色）
- **notice**: 注意狀態（橙色）
- **negative**: 負面狀態（紅色）
- **neutral**: 中性狀態（灰色）
- **自訂狀態**: 可傳入任意字串作為自訂狀態類型

### 引入方式

```js
import { Status, type StatusProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
{
  /* 文字狀態 */
}
<Status variant="text" status="positive" size="medium">
  已完成
</Status>;

{
  /* 按鈕狀態 */
}
<Status
  variant="button"
  status="informative"
  onClick={() => console.log('狀態點擊')}
>
  處理中
</Status>;

{
  /* 自訂狀態 */
}
<Status variant="text" status="custom-status">
  自訂狀態
</Status>;
```

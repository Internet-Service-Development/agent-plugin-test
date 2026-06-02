# NoResult 組件

## NoResult

無結果組件，用於顯示空狀態或無資料的情況，支援自訂圖示和描述文字，適用於搜尋無結果、列表為空等場景。

### 支援的 Props

| 名稱          | 型別                | 必填 | 預設值       | 用途               |
| ------------- | ------------------- | ---- | ------------ | ------------------ |
| className     | string              | 否   |              | 自訂 CSS 樣式類別  |
| Icon          | React.ComponentType | 否   | NotAddedIcon | 顯示的圖示組件     |
| description   | ReactNode           | 否   |              | 主要描述文字       |
| supplementary | ReactNode           | 否   |              | 補充說明或操作按鈕 |

### 子組件

#### NoResult.Content

內容組件，可單獨使用來自訂佈局。

### 引入方式

```js
import { NoResult, type NoResultProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
{
  /* 基本使用 */
}
<NoResult
  description="沒有找到相關資料"
  supplementary={<Button onClick={() => handleRefresh()}>重新載入</Button>}
/>;

{
  /* 自訂圖示 */
}
<NoResult
  Icon={SearchIcon}
  description="搜尋無結果"
  supplementary="請嘗試其他關鍵字"
/>;

{
  /* 使用子組件 */
}
<div className="custom-layout">
  <NoResult.Content
    description="自訂佈局的無結果狀態"
    supplementary={<Button>新增項目</Button>}
  />
</div>;
```

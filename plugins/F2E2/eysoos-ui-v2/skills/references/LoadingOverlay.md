# LoadingOverlay 組件

## LoadingOverlay

載入覆蓋層組件，提供全屏或區域的載入遮罩效果，支援不同樣式變體，適用於資料載入、操作處理等場景。

### 支援的 Props

| 名稱    | 型別                                 | 必填 | 預設值    | 用途                 |
| ------- | ------------------------------------ | ---- | --------- | -------------------- |
| variant | 'default' \| 'background' \| 'table' | 否   | 'default' | 載入覆蓋層的樣式變體 |
| size    | 'small' \| 'default'                 | 否   | 'default' | 載入圖示的尺寸大小   |

### 樣式變體說明

- **default**: 預設樣式，適用於一般載入場景
- **background**: 背景樣式，適用於背景載入
- **table**: 表格樣式，適用於表格資料載入

### 注意事項

- 此組件標記為 **@deprecated**，建議使用新版本的 Loading 組件
- 組件會覆蓋整個父容器區域
- 使用絕對定位，需要父容器設定 `position: relative`

### 引入方式

```js
import { LoadingOverlay, type LoadingOverlayProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
{
  /* 基本使用 */
}
<div style={{ position: 'relative', height: '200px' }}>
  {isLoading && <LoadingOverlay />}
  <div>內容區域</div>
</div>;

{
  /* 表格載入 */
}
<div style={{ position: 'relative' }}>
  {isTableLoading && <LoadingOverlay variant="table" size="small" />}
  <Table>{/* 表格內容 */}</Table>
</div>;
```

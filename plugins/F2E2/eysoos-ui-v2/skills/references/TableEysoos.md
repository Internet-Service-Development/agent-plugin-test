# TableEysoos 組件

> ⚠️ **Deprecated / 即將淘汰**
>
> TableEysoos 為舊版表格元件，未來將逐步淘汰。新開發或重構頁面請**優先使用 `@eysoos/prisma` 的 `Table` 組件**；現有使用 TableEysoos 的頁面，建議在調整版型或需求時一併遷移至 `Table`。

## TableEysoos

Eysoos 表格組件，基於 Material-UI Table 封裝，提供自訂樣式和佈局選項，支援緊湊和寬鬆兩種模式，適用於資料展示和管理場景。

### 支援的 Props

| 名稱         | 型別                | 必填 | 預設值 | 用途                                  |
| ------------ | ------------------- | ---- | ------ | ------------------------------------- |
| children     | ReactNode           | 否   |        | 表格的內容（TableHead、TableBody 等） |
| className    | string              | 否   |        | 自訂 CSS 樣式類別                     |
| compact      | boolean             | 否   | false  | 是否使用緊湊模式                      |
| size         | 'small' \| 'medium' | 否   |        | 表格的尺寸大小                        |
| unitePadding | boolean             | 否   |        | 是否統一內邊距                        |
| stickyHeader | boolean             | 否   |        | 是否固定表頭                          |

### 子組件

#### TableContainerEysoos

表格容器組件，提供滾動和佈局支援。

### 樣式特色

- **緊湊模式**: 帶邊框的緊密佈局，適合資料密集展示
- **寬鬆模式**: 帶陰影的卡片式佈局，視覺層次更清晰
- **響應式尺寸**: 支援 small 和 medium 兩種尺寸
- **自訂主題**: 支援深色和淺色主題切換

### 引入方式

```js
import {
  TableEysoos,
  TableContainerEysoos,
  type TableEysoosProps,
} from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<TableContainerEysoos>
  <TableEysoos compact={false} size="medium">
    <TableHead>
      <TableRow>
        <TableCell>姓名</TableCell>
        <TableCell>年齡</TableCell>
        <TableCell>職位</TableCell>
        <TableCell>操作</TableCell>
      </TableRow>
    </TableHead>
    <TableBody>
      <TableRow>
        <TableCell>張三</TableCell>
        <TableCell>28</TableCell>
        <TableCell>前端工程師</TableCell>
        <TableCell>
          <Button size="small">編輯</Button>
        </TableCell>
      </TableRow>
    </TableBody>
  </TableEysoos>
</TableContainerEysoos>
```

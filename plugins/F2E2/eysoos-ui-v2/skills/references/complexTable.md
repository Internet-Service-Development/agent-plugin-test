# ComplexTable 組件

## ComplexTable

複雜表格組件，提供進階的表格功能，支援巢狀表格、即時編輯、多選操作和 Socket 資料同步，適用於複雜的資料管理場景。

### 支援的 Props

| 名稱                    | 型別                                             | 必填 | 預設值 | 用途                           |
| ----------------------- | ------------------------------------------------ | ---- | ------ | ------------------------------ |
| className               | string                                           | 否   |        | 自訂 CSS 樣式類別              |
| columns                 | ComplexTableColumnsTypeI[]                       | 是   |        | 表格欄位設定陣列               |
| data                    | ComplexTableDataTypeI[]                          | 是   |        | 表格資料陣列                   |
| socketData              | ExcelTableSocketData[]                           | 否   |        | Socket 即時資料                |
| filterItem              | SearchDataT                                      | 否   |        | 篩選項目設定                   |
| tableErrors             | TableErrorDataTypeT[]                            | 否   |        | 表格錯誤資料                   |
| disabledSelectColumns   | string[]                                         | 否   |        | 禁用選擇的欄位                 |
| onlineList              | Record<number, Array<string>>                    | 否   |        | 線上使用者清單                 |
| history                 | boolean                                          | 否   | false  | 是否啟用歷史記錄               |
| onBoxChecked            | (args: number) => void                           | 否   |        | 核取方塊選中時的回調函數       |
| showToastAlert          | () => void                                       | 否   |        | 顯示提示訊息的回調函數         |
| onTableSocketActions    | (actions: Array<ExcelTableSocketAction>) => void | 否   |        | 表格 Socket 操作的回調函數     |
| onTableDataChanged      | (changed: Array<ExcelTableSocketData>) => void   | 否   |        | 表格資料變更的回調函數         |
| onFilterClicked         | () => void                                       | 否   |        | 篩選按鈕點擊的回調函數         |
| onEditAreaClose         | () => void                                       | 否   |        | 編輯區域關閉的回調函數         |
| onTableBlur             | () => void                                       | 否   |        | 表格失去焦點的回調函數         |
| onEditAreaSelectClicked | () => void                                       | 否   |        | 編輯區域選擇點擊的回調函數     |
| onShowEditArea          | (shown: boolean) => void                         | 否   |        | 編輯區域顯示狀態變更的回調函數 |

### 引入方式

```js
import { ComplexTable, type ComplexTableProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<ComplexTable
  columns={tableColumns}
  data={tableData}
  history={false}
  onTableDataChanged={changed => console.log('資料變更:', changed)}
/>
```

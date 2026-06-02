# TableTagPicker 組件

## TableTagPicker

專為表格場景設計的標籤選擇器，基於 `TagPicker` 封裝，預設使用較小尺寸標籤、表格適配樣式與釘選能力，適合放在表格上方或欄位過濾器中，用於多選標籤條件。

### 與 TagPicker 的差異

- 自動套用表格用樣式（`tableStyle`）以貼合表格工具列
- 預設 `tagSize="small"`，在狹窄空間中顯示更多標籤
- 預設開啟 `pinnable`，支援釘選常用標籤
- Props 多數直接繼承自 `TagPicker`，開發者可沿用既有使用方式

### 支援的 Props

> TableTagPicker 僅開放 `TagPicker` 的部分屬性，完整 TagPicker 支援項目請參考 `TagPicker.md`。

| 名稱               | 型別                                                     | 必填 | 用途                             |
| ------------------ | -------------------------------------------------------- | ---- | -------------------------------- |
| className          | string                                                   | 否   | 自訂 CSS 樣式類別                |
| data               | TagPickerItem[]                                          | 是   | 可選擇的標籤資料                 |
| value              | TagPickerItem[]                                          | 否   | 選中的標籤（受控模式）           |
| defaultValue       | TagPickerItem[]                                          | 否   | 預設選中的標籤（非受控模式）     |
| defaultPinnedValue | TagPickerItem[]                                          | 否   | 預設被釘選的標籤                 |
| fullWidth          | boolean                                                  | 否   | 是否將寬度設為 100%              |
| limit              | number                                                   | 否   | 顯示在輸入框中的標籤數量上限     |
| isDisableTagDrag   | boolean                                                  | 否   | 是否禁用標籤拖拽                 |
| placeholder        | string                                                   | 否   | 佔位文字                         |
| disabled           | boolean                                                  | 否   | 是否禁用組件                     |
| onChange           | (selectedItems: TagPickerItem[]) => void                 | 否   | 選中項目改變時的回調函數         |
| onSelectItem       | (item: TagPickerItem, selected: TagPickerItem[]) => void | 否   | 點選單一標籤時的回調函數         |
| onSearch           | (value: string) => void                                  | 否   | 搜尋時的回調函數                 |
| renderValue        | (name: string) => ReactNode                              | 否   | 自訂渲染已選標籤的顯示內容       |
| renderOption       | (name: string, selected: boolean) => ReactNode           | 否   | 自訂渲染下拉選單中標籤選項的內容 |

### 引入方式

```ts
import {
  TableTagPicker,
  type TableTagPickerProps,
  type TagPickerItem,
} from '@eysoos/prisma';
```

### 組件使用範例

```tsx
const tagData: TagPickerItem[] = [
  { value: 1, label: '新品' },
  { value: 2, label: '熱門' },
  { value: 3, label: '折扣' },
];

const [selectedTags, setSelectedTags] = useState<TagPickerItem[]>([]);

<TableTagPicker
  data={tagData}
  value={selectedTags}
  placeholder="篩選標籤"
  fullWidth
  onChange={setSelectedTags}
/>;
```

### 建議使用情境

- 表格工具列中的標籤篩選器
- 需要以較小標籤形式呈現的多選條件
- 希望沿用 TagPicker 的資料結構與互動行為，但在視覺與尺寸上更適合表格場景

---

> 如需更進階的標籤管理能力（創建新標籤、拖拽排序、群組顯示等），請參考基礎元件 `TagPicker` 的完整說明。

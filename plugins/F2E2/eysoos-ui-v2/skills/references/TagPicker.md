# TagPicker 組件

## TagPicker

標籤選擇器組件，提供多選標籤功能，支援搜尋、創建新標籤和拖拽排序，適用於標籤管理、分類選擇等場景。

### 支援的 Props

| 名稱               | 型別                                                          | 必填 | 預設值   | 用途                         |
| ------------------ | ------------------------------------------------------------- | ---- | -------- | ---------------------------- |
| className          | string                                                        | 否   |          | 自訂 CSS 樣式類別            |
| data               | TagPickerItem[]                                               | 是   |          | 可選擇的標籤資料             |
| value              | TagPickerItem[]                                               | 否   |          | 選中的標籤（受控模式）       |
| defaultValue       | TagPickerItem[]                                               | 否   | []       | 預設選中的標籤（非受控模式） |
| creatable          | boolean                                                       | 否   | false    | 是否可以創建新標籤           |
| isDataAppendable   | boolean                                                       | 否   | true     | 資料變更時是否追加到選項中   |
| isExactSearch      | boolean                                                       | 否   | false    | 是否使用精確搜尋             |
| disabled           | boolean                                                       | 否   | false    | 是否禁用組件                 |
| disabledItemValues | TagPickerItem[]                                               | 否   | []       | 禁用的標籤項目               |
| isMenuGrouped      | boolean                                                       | 否   | false    | 是否按群組顯示選單           |
| placeholder        | string                                                        | 否   |          | 佔位文字                     |
| error              | boolean                                                       | 否   | false    | 是否顯示錯誤狀態             |
| isSearch           | boolean                                                       | 否   | false    | 是否顯示搜尋狀態             |
| fullWidth          | boolean                                                       | 否   | false    | 是否將寬度設為 100%          |
| tagSize            | 'small' \| 'medium'                                           | 否   | 'medium' | 標籤的尺寸大小               |
| isDisableTagDrag   | boolean                                                       | 否   | false    | 是否禁用標籤拖拽             |
| originX            | 'left' \| 'right'                                             | 否   | 'left'   | 彈出框的水平對齊方式         |
| originY            | 'top' \| 'bottom'                                             | 否   | 'bottom' | 彈出框的垂直對齊方式         |
| inputProps         | InputHTMLAttributes                                           | 否   |          | 輸入框的屬性                 |
| onChange           | (selectedItems: TagPickerItem[]) => void                      | 否   |          | 選中項目改變時的回調函數     |
| onOrderChange      | (selectedItems: TagPickerItem[]) => void                      | 否   |          | 標籤順序改變時的回調函數     |
| onCreate           | (newItem: TagPickerItem) => void                              | 否   |          | 創建新標籤時的回調函數       |
| onSearch           | (value: string) => void                                       | 否   |          | 搜尋時的回調函數             |
| onSelectItem       | (item: TagPickerItem, selectedItems: TagPickerItem[]) => void | 否   |          | 選擇項目時的回調函數         |
| renderValue        | (name: string) => ReactNode                                   | 否   |          | 自訂渲染標籤值的函數         |
| renderOption       | (name: string, selected: boolean) => ReactNode                | 否   |          | 自訂渲染選項的函數           |

### 型別定義

#### TagPickerItem

```typescript
interface TagPickerItem {
  value: string | number;
  label: string;
  group?: string;
  isSuggest?: boolean;
}
```

### 特色功能

- **多選標籤**: 支援選擇多個標籤
- **搜尋過濾**: 可搜尋和過濾標籤選項
- **創建新標籤**: 支援動態創建新的標籤
- **拖拽排序**: 可拖拽調整標籤順序
- **群組顯示**: 支援按群組組織標籤
- **建議標籤**: 支援顯示建議的標籤選項

### 引入方式

```js
import {
  TagPicker,
  type TagPickerProps,
  type TagPickerItem,
} from '@eysoos/prisma';
```

### 組件使用範例

```tsx
const tagData = [
  { value: 1, label: '前端開發', group: '技術' },
  { value: 2, label: '後端開發', group: '技術' },
  { value: 3, label: 'UI設計', group: '設計', isSuggest: true },
  { value: 4, label: 'UX設計', group: '設計' },
];

<TagPicker
  data={tagData}
  value={selectedTags}
  creatable={true}
  isMenuGrouped={true}
  placeholder="選擇或輸入標籤"
  tagSize="medium"
  onChange={tags => setSelectedTags(tags)}
  onCreate={newTag => console.log('新建標籤:', newTag)}
  onSearch={keyword => console.log('搜尋:', keyword)}
/>;
```

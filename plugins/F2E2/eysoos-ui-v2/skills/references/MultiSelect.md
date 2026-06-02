# MultiSelect 組件

## MultiSelect

多選下拉選單組件，基於 `Select` 能力擴充，支援一次選擇多個選項、搜尋過濾、全選 / 全不選、釘選常用項目與錯誤狀態顯示，適合在表單或篩選條中做多選條件使用。

### 支援的 Props

> 以下僅列出 MultiSelect 特有或較重要的屬性，其餘通用屬性（例如 `disabled`、`fullWidth` 等）可參考 `Select` 組件說明。

| 名稱                 | 型別                           | 必填 | 預設值              | 用途                                       |
| -------------------- | ------------------------------ | ---- | ------------------- | ------------------------------------------ |
| className            | string                         | 否   |                     | 自訂 CSS 樣式類別                          |
| options              | SelectOption<SelectValue>[]    | 是   |                     | 下拉選單選項資料陣列                       |
| value                | SelectValue[]                  | 否   |                     | 已選中的值（受控模式，多筆）               |
| defaultValue         | SelectValue[]                  | 否   | []                  | 預設選中的值（非受控模式）                 |
| open                 | boolean                        | 否   |                     | 是否打開下拉選單（受控模式）               |
| filterable           | boolean                        | 否   | false               | 是否啟用本地搜尋過濾                       |
| filterPlaceholder    | string                         | 否   | ''                  | 搜尋框佔位文字                             |
| isSearch             | boolean                        | 否   | false               | 是否顯示「搜尋中…」狀態                    |
| placeholder          | string                         | 否   |                     | 尚未選取任何項目時顯示的佔位文字           |
| originX              | 'left' \| 'right'              | 否   | 'left'              | 選單的水平對齊方式                         |
| originY              | 'bottom' \| 'top'              | 否   | 'bottom'            | 選單的垂直對齊方式                         |
| variant              | SelectVariant                  | 否   | 'outlined'          | 樣式變體，同 `Select`                      |
| confirmText          | ReactNode                      | 否   |                     | 下方確認按鈕文字                           |
| itemsEach            | string                         | 否   | ''                  | 顯示每頁 / 每組項目數量的說明文字          |
| assignButtonDisabled | boolean                        | 否   | false               | 是否禁用確認 / 指派按鈕                    |
| errorText            | string                         | 否   |                     | 錯誤訊息文字                               |
| errorIcon            | ReactNode                      | 否   | ExclamationMarkIcon | 自訂錯誤圖示                               |
| showError            | boolean                        | 否   | false               | 是否顯示錯誤狀態與錯誤文字                 |
| renderValue          | (name: string) => ReactNode    | 否   |                     | 自訂已選值在 Trigger 內的顯示方式          |
| renderOption         | (name: string) => ReactNode    | 否   |                     | 自訂選項在清單中的顯示方式                 |
| onChange             | (value: SelectValue[]) => void | 否   |                     | 已選值變更時的回調（含所有選中的值）       |
| onSelect             | (value: SelectValue[]) => void | 否   |                     | 單次點選選項後的回調（含最新選中的值陣列） |
| onMenuOpen           | () => void                     | 否   |                     | 選單打開時的回調                           |
| onMenuClose          | () => void                     | 否   |                     | 選單關閉時的回調                           |
| onSearch             | (value: SelectValue) => void   | 否   |                     | 搜尋輸入變更時的回調                       |
| onAssign             | () => void                     | 否   |                     | 點擊確認 / 指派按鈕時的回調                |

### 引入方式

```ts
import { MultiSelect, type MultiSelectProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
const options = [
  { name: '選項 A', value: 'A' },
  { name: '選項 B', value: 'B' },
  { name: '選項 C', value: 'C' },
];

const [values, setValues] = useState<SelectValue[]>([]);

<MultiSelect
  placeholder="請選擇多個項目"
  options={options}
  value={values}
  filterable
  confirmText="套用"
  onChange={setValues}
/>;
```

### 特色功能

- **多選能力**：一次選擇多個選項，回傳 `SelectValue[]`
- **全選 / 全不選**：內建「Select All」行為，快速勾選 / 清除所有項目
- **釘選常用項目**：已選項目會固定顯示在上方，方便再次操作
- **搜尋過濾 / 遠端搜尋**：`filterable` 搭配 `onSearch` 可支援本地或遠端搜尋
- **錯誤狀態**：透過 `showError`、`errorText`、`errorIcon` 顯示表單驗證錯誤

---

> MultiSelect 的選項與型別完全與 `Select` 共用，若已有 `Select` 的型別定義，可直接沿用現有的 `SelectOption`、`SelectValue` 設計。

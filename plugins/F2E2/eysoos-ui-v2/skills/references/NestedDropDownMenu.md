# NestedDropDownMenu 組件

## NestedDropDownMenu

巢狀下拉選單組件，提供多層級選項選擇功能，支援搜尋和標籤顯示，適用於複雜的分類選擇場景。

### 支援的 Props

| 名稱              | 型別                                            | 必填 | 預設值              | 用途                       |
| ----------------- | ----------------------------------------------- | ---- | ------------------- | -------------------------- |
| className         | string                                          | 否   |                     | 自訂 CSS 樣式類別          |
| options           | NestedDropDownMenuOption[]                      | 是   |                     | 巢狀選項資料               |
| value             | NestedDropDownMenuValue                         | 否   |                     | 選中的值（受控模式）       |
| defaultValue      | NestedDropDownMenuValue                         | 否   |                     | 預設選中的值（非受控模式） |
| open              | boolean                                         | 否   |                     | 控制下拉選單的顯示狀態     |
| placeholder       | string                                          | 否   |                     | 佔位文字                   |
| isSearch          | boolean                                         | 否   | false               | 是否處於搜尋狀態           |
| filterable        | boolean                                         | 否   | true                | 是否支援過濾搜尋           |
| filterPlaceholder | string                                          | 否   | 'Please Input Text' | 搜尋框的佔位文字           |
| originX           | 'left' \| 'right'                               | 否   | 'left'              | 主選單的水平對齊方式       |
| originY           | 'top' \| 'bottom'                               | 否   | 'bottom'            | 主選單的垂直對齊方式       |
| childrenOriginX   | 'left' \| 'right'                               | 否   | 'right'             | 子選單的水平對齊方式       |
| renderValue       | (value: string) => ReactNode                    | 否   |                     | 自訂渲染選中值的函數       |
| renderOption      | (option: NestedDropDownMenuOption) => ReactNode | 否   |                     | 自訂渲染選項的函數         |
| onChange          | (value: NestedDropDownMenuValue) => void        | 否   |                     | 值改變時的回調函數         |
| onSelect          | (value: NestedDropDownMenuValue) => void        | 否   |                     | 選項選擇時的回調函數       |
| onMenuOpen        | () => void                                      | 否   |                     | 選單開啟時的回調函數       |
| onMenuClose       | () => void                                      | 否   |                     | 選單關閉時的回調函數       |
| onSearch          | (keyword: string) => void                       | 否   |                     | 搜尋時的回調函數           |

### 型別定義

#### NestedDropDownMenuOption

```typescript
interface NestedDropDownMenuOption<T> {
  id: string;
  name: string;
  value: T;
  tagName?: string;
  children: NestedDropDownMenuOption<T>[];
}
```

#### NestedDropDownMenuValue

```typescript
type NestedDropDownMenuValue = string | number;
```

### 引入方式

```js
import {
  NestedDropDownMenu,
  type NestedDropDownMenuProps,
} from '@eysoos/prisma';
```

### 組件使用範例

```tsx
const nestedOptions = [
  {
    id: '1',
    name: '電子產品',
    value: 'electronics',
    tagName: 'E001',
    children: [
      {
        id: '1-1',
        name: '手機',
        value: 'phone',
        tagName: 'E001-1',
        children: [],
      },
      {
        id: '1-2',
        name: '筆電',
        value: 'laptop',
        tagName: 'E001-2',
        children: [],
      },
    ],
  },
];

<NestedDropDownMenu
  options={nestedOptions}
  placeholder="請選擇分類"
  filterable={true}
  value={selectedValue}
  onChange={value => setSelectedValue(value)}
  onSearch={keyword => console.log('搜尋:', keyword)}
/>;
```

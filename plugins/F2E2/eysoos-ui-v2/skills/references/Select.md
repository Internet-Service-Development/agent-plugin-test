# Select 組件

## Select

下拉選單組件，提供選項選擇功能，支援搜尋過濾、自訂渲染和多種樣式變體，適用於表單選擇場景。

### 支援的 Props

| 名稱              | 型別                         | 必填 | 預設值     | 用途                         |
| ----------------- | ---------------------------- | ---- | ---------- | ---------------------------- |
| className         | string                       | 否   |            | 自訂 CSS 樣式類別            |
| defaultValue      | SelectValue                  | 否   |            | 預設選中的值                 |
| filterable        | boolean                      | 否   | false      | 是否啟用搜尋過濾功能         |
| filterPlaceholder | string                       | 否   | ''         | 搜尋框的佔位文字             |
| filterButton      | boolean                      | 否   |            | 是否顯示篩選按鈕             |
| isSearch          | boolean                      | 否   |            | 是否處於搜尋狀態             |
| placeholder       | string                       | 否   |            | 選單的佔位文字               |
| open              | boolean                      | 否   |            | 是否打開下拉選單（受控模式） |
| options           | SelectOption<SelectValue>[]  | 是   |            | 選項資料陣列                 |
| originX           | 'left' \| 'right'            | 否   | 'left'     | 選單的水平對齊方式           |
| originY           | 'bottom' \| 'top'            | 否   | 'bottom'   | 選單的垂直對齊方式           |
| value             | SelectValue                  | 否   |            | 選中的值（受控模式）         |
| variant           | SelectVariant                | 否   | 'outlined' | 選單的樣式變體               |
| renderValue       | (name: string) => ReactNode  | 否   |            | 自訂選中值的渲染方式         |
| renderOption      | (name: string) => ReactNode  | 否   |            | 自訂選項的渲染方式           |
| size              | SelectSize                   | 否   |            | 選單的尺寸大小               |
| onChange          | (value: SelectValue) => void | 否   |            | 值改變時的回調函數           |
| onSelect          | (value: SelectValue) => void | 否   |            | 選項被選中時的回調函數       |
| onMenuOpen        | () => void                   | 否   |            | 選單打開時的回調函數         |
| onMenuClose       | () => void                   | 否   |            | 選單關閉時的回調函數         |
| onSearch          | (value: SelectValue) => void | 否   |            | 搜尋時的回調函數             |
| onFilterClicked   | () => void                   | 否   |            | 篩選按鈕點擊時的回調函數     |
| disabled          | boolean                      | 否   |            | 是否禁用選單                 |
| error             | boolean                      | 否   |            | 是否顯示錯誤狀態             |
| fullWidth         | boolean                      | 否   |            | 是否將寬度設為 100%          |

### 引入方式

```js
import { Select, type SelectProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Select
  placeholder="請選擇"
  options={[
    { name: '選項1', value: 1 },
    { name: '選項2', value: 2 },
    { name: '選項3', value: 3 },
  ]}
  onChange={value => console.log('選中:', value)}
/>
```

## 型別定義詳細說明

### SelectValue 型別

```typescript
export type SelectValue = string | number | boolean | null | undefined;
```

SelectValue 是一個聯合型別，支援多種資料型別以提供最大的彈性。

### SelectOption 型別

```typescript
export type SelectOption<T> = {
  name: string; // 顯示的文字
  value: T; // 實際的值，型別為 T（通常是 SelectValue）
  disabled?: boolean; // 是否禁用該選項
};
```

## 型別相容性和遷移指南

### 從 MUI Select 遷移

如果你從 MUI Select 遷移到 eysoos/prisma Select，可能會遇到 onChange 回調函數的型別不匹配問題。

**常見問題：**

```typescript
// 原有的 MUI Select handler
const handleChange = (value: string | number) => {
  // 處理邏輯
}

// eysoos/prisma Select 的 onChange 型別
onChange?: (value: SelectValue) => void  // SelectValue 包含更多型別
```

**解決方案：**

#### 方案 1：擴展 handler 型別（推薦）

```typescript
const handleChange = (value: SelectValue) => {
  // 型別守衛確保安全
  if (typeof value === 'string' || typeof value === 'number') {
    // 你的原有邏輯
    console.log('Selected:', value);
  } else {
    // 處理其他情況
    console.warn('Unexpected value type:', typeof value);
  }
};
```

#### 方案 2：使用包裝函數

```typescript
const originalHandler = (value: string | number) => {
  // 原有邏輯
};

const wrappedHandler = (value: SelectValue) => {
  if (typeof value === 'string' || typeof value === 'number') {
    originalHandler(value);
  }
};

<Select onChange={wrappedHandler} />;
```

#### 方案 3：型別斷言（需確保資料安全）

```typescript
const handleChange = (value: string | number) => {
  // 原有邏輯
};

<Select onChange={value => handleChange(value as string | number)} />;
```

### 最佳實踐建議

1. **優先使用方案 1**：擴展型別定義並加入型別守衛，這樣最安全且具備向前相容性
2. **避免直接型別斷言**：除非你完全確定資料來源的型別
3. **處理邊界情況**：考慮 null、undefined 等值的處理邏輯
4. **保持一致性**：在整個專案中使用相同的型別處理模式

### 型別安全檢查範例

```typescript
const isValidSelectValue = (value: SelectValue): value is string | number => {
  return typeof value === 'string' || typeof value === 'number';
};

const handleSelectChange = (value: SelectValue) => {
  if (isValidSelectValue(value)) {
    // 型別安全的處理
    processValue(value); // value 現在是 string | number
  } else {
    // 處理無效值
    console.error('Invalid select value:', value);
  }
};
```

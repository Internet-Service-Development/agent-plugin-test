# Tag 組件

## Tag

標籤組件，用於顯示分類、狀態或屬性標籤，支援選中狀態和刪除功能，適用於標籤選擇、內容分類等場景。

### 支援的 Props

| 名稱        | 型別                        | 必填 | 預設值    | 用途                   |
| ----------- | --------------------------- | ---- | --------- | ---------------------- |
| className   | string                      | 否   |           | 自訂 CSS 樣式類別      |
| variant     | 'default' \| 'label'        | 否   | 'default' | 標籤的樣式變體         |
| size        | 'small' \| 'medium'         | 否   | 'medium'  | 標籤的尺寸大小         |
| label       | string                      | 是   |           | 標籤顯示的文字         |
| value       | string \| number            | 是   |           | 標籤的值               |
| selected    | boolean                     | 否   |           | 是否為選中狀態         |
| deletable   | boolean                     | 否   | false     | 是否可刪除             |
| renderValue | (name: string) => ReactNode | 否   |           | 自訂渲染標籤內容的函數 |
| onDelete    | (e: MouseEvent) => void     | 否   |           | 刪除標籤時的回調函數   |
| onClick     | (e: MouseEvent) => void     | 否   |           | 點擊標籤時的回調函數   |

### 引入方式

```js
import { Tag, type TagProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Tag
  label="前端開發"
  value="frontend"
  size="medium"
  selected={selectedTags.includes('frontend')}
  deletable={true}
  onDelete={e => handleDeleteTag('frontend')}
  onClick={e => handleSelectTag('frontend')}
/>
```

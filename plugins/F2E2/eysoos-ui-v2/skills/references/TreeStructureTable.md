# TreeStructureTable 組件

## TreeStructureTable

樹狀結構表格組件，提供層級化的表格展示功能，支援展開收合、拖拽排序和動態載入，適用於複雜的層級資料展示場景。

### 支援的 Props

| 名稱               | 型別                                                         | 必填 | 預設值     | 用途                     |
| ------------------ | ------------------------------------------------------------ | ---- | ---------- | ------------------------ |
| className          | string                                                       | 否   |            | 自訂 CSS 樣式類別        |
| columns            | TreeStructureTableColumnTypeI[]                              | 是   |            | 表格欄位配置             |
| data               | TreeStructureTableDataTypeI[]                                | 是   |            | 樹狀結構的資料           |
| showToggle         | boolean                                                      | 否   | true       | 是否顯示展開收合按鈕     |
| defaultOpen        | boolean                                                      | 否   | false      | 預設是否展開             |
| actionType         | 'floating' \| 'freeze'                                       | 否   | 'floating' | 操作欄的類型             |
| hiddenHeaderLevels | number[]                                                     | 否   | []         | 隱藏的標題層級           |
| fixedActions       | boolean                                                      | 否   | false      | 是否固定操作欄           |
| onExpand           | (expand: boolean, item: TreeStructureTableDataTypeI) => void | 否   |            | 展開收合時的回調函數     |
| onLoadMore         | (location: string) => void                                   | 否   |            | 載入更多資料時的回調函數 |

### 型別定義

#### TreeStructureTableColumnTypeI

```typescript
interface TreeStructureTableColumnTypeI {
  key: string;
  name?: ReactNode;
  isAction?: boolean;
  render?: (param: any, item: any) => ReactElement;
  onSort?: () => void;
  direction?: 'asc' | 'desc';
  align?: CSSProperties['textAlign'];
  tooltip?: ReactNode;
  width?: string;
  mask?: boolean;
  level?: number;
  status?: 'normal' | 'loading' | 'error';
}
```

#### TreeStructureTableDataTypeI

```typescript
interface TreeStructureTableDataTypeI {
  [key: string]: any;
  key: number | string;
  level: number;
  id?: number | string;
  parentId?: number | string;
  menuId?: number;
  actionData?: TreeStructureTableActionTypeI[];
  childColumns?: TreeStructureTableColumnTypeI[];
  childData?: TreeStructureTableDataTypeI[];
  lazyLoad?: boolean;
}
```

#### TreeStructureTableActionTypeI

```typescript
interface TreeStructureTableActionTypeI {
  name: string;
  icon: ReactNode;
  onClick: () => void;
  collapsed?: boolean;
  disabled?: boolean;
  isDelete?: boolean;
}
```

### 特色功能

- **層級展示**: 支援多層級的樹狀表格結構
- **展開收合**: 可展開或收合子層級資料
- **拖拽排序**: 支援拖拽調整資料順序
- **動態載入**: 支援懶載入子資料
- **響應式設計**: 根據螢幕尺寸自動調整表格大小
- **固定操作欄**: 支援固定右側操作欄
- **自訂渲染**: 支援自訂欄位渲染函數
- **排序功能**: 支援欄位排序

### 引入方式

```js
import {
  TreeStructureTable,
  type TreeStructureTableProps,
} from '@eysoos/prisma';
```

### 組件使用範例

```tsx
const columns = [
  {
    key: 'name',
    name: '名稱',
    width: '200px',
    render: (value, item) => <span>{value}</span>,
  },
  {
    key: 'status',
    name: '狀態',
    align: 'center',
    render: value => <Badge>{value}</Badge>,
  },
  {
    key: 'actions',
    name: '操作',
    isAction: true,
    width: '120px',
  },
];

const treeData = [
  {
    key: 1,
    level: 0,
    id: 1,
    parentId: 0,
    name: '根節點',
    status: '啟用',
    actionData: [
      {
        name: '編輯',
        icon: <EditIcon />,
        onClick: () => console.log('編輯'),
      },
      {
        name: '刪除',
        icon: <DeleteIcon />,
        onClick: () => console.log('刪除'),
        isDelete: true,
      },
    ],
    childData: [
      {
        key: 2,
        level: 1,
        id: 2,
        parentId: 1,
        name: '子節點',
        status: '停用',
      },
    ],
  },
];

<TreeStructureTable
  columns={columns}
  data={treeData}
  showToggle={true}
  defaultOpen={false}
  actionType="floating"
  onExpand={(expand, item) => {
    console.log('展開狀態:', expand, '項目:', item);
  }}
  onLoadMore={location => {
    console.log('載入更多:', location);
  }}
/>;
```

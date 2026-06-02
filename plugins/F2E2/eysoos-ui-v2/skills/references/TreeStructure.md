# TreeStructure 組件

## TreeStructure

樹狀結構組件，提供層級化的資料展示和拖拽排序功能，支援多種互動元素，適用於選單管理、組織架構等場景。

### 支援的 Props

| 名稱               | 型別                                                                                                           | 必填 | 預設值 | 用途                 |
| ------------------ | -------------------------------------------------------------------------------------------------------------- | ---- | ------ | -------------------- |
| className          | string                                                                                                         | 否   |        | 自訂 CSS 樣式類別    |
| data               | TreeData[]                                                                                                     | 是   |        | 樹狀結構的資料       |
| dragDisabled       | boolean                                                                                                        | 否   | false  | 是否禁用拖拽功能     |
| canAddChildren     | boolean                                                                                                        | 否   | true   | 是否顯示展開切換按鈕 |
| canAddSiblings     | boolean                                                                                                        | 否   | true   | 是否顯示第一層按鈕   |
| topLevelAddButtons | AddButton[]                                                                                                    | 否   |        | 第一層的新增按鈕陣列 |
| onOrderChange      | Dispatch<SetStateAction<TreeData[]>> \| ((fullTreeData: TreeData[], currentLevelTreeData: TreeData[]) => void) | 否   |        | 拖拽結束時的回調函數 |

### 型別定義

#### TreeData

```typescript
interface TreeData {
  id: number;
  menuId?: number;
  parentId: number;
  switches?: Switch[];
  links?: Link[];
  image?: string;
  text?: string;
  otherText?: string;
  statusButtons?: StatusButton[];
  iconButtons?: IconButton[];
  level: number;
  children?: TreeData[];
  dragDisabled?: boolean;
  addButtons?: AddButton[];
  canAddChildren?: boolean;
}
```

#### Switch

```typescript
interface Switch {
  id: number;
  text?: string;
  onChange?: () => void;
  checked?: boolean;
}
```

#### Link

```typescript
interface Link {
  id: number;
  text?: string;
  target?: string;
  url?: string;
}
```

#### StatusButton

```typescript
interface StatusButton {
  id: number;
  text?: string;
  onClick?: () => void;
  textColor?: string;
  bgColor?: string;
  disabled?: boolean;
}
```

#### IconButton

```typescript
interface IconButton {
  id: number;
  icon: ReactNode;
  onClick?: () => void;
  link?: LinkProps;
  anchor?: HTMLProps<HTMLAnchorElement>;
}
```

#### AddButton

```typescript
interface AddButton {
  id: number;
  text?: string;
  onClick?: () => void;
  link?: LinkProps;
  anchor?: HTMLProps<HTMLAnchorElement>;
}
```

### 特色功能

- **層級展示**: 支援多層級的樹狀結構展示
- **拖拽排序**: 可拖拽調整節點順序和層級
- **多種元素**: 支援開關、連結、狀態按鈕、圖示按鈕等
- **動態新增**: 支援動態新增子節點和同級節點
- **視覺層級線**: 自動繪製層級連接線
- **禁用控制**: 可單獨禁用特定節點的拖拽功能

### 引入方式

```js
import {
  TreeStructure,
  type TreeStructureProps,
  type TreeData,
} from '@eysoos/prisma';
```

### 組件使用範例

```tsx
const treeData = [
  {
    id: 1,
    parentId: 0,
    level: 0,
    text: '主選單',
    switches: [
      {
        id: 1,
        text: '啟用',
        checked: true,
        onChange: () => console.log('切換'),
      },
    ],
    statusButtons: [
      {
        id: 1,
        text: '已發布',
        bgColor: '#4CAF50',
        onClick: () => console.log('狀態'),
      },
    ],
    iconButtons: [
      { id: 1, icon: <EditIcon />, onClick: () => console.log('編輯') },
    ],
    children: [
      {
        id: 2,
        parentId: 1,
        level: 1,
        text: '子選單',
        links: [{ id: 1, text: '查看', url: '/view', target: '_blank' }],
      },
    ],
  },
];

<TreeStructure
  data={treeData}
  dragDisabled={false}
  canAddChildren={true}
  canAddSiblings={true}
  topLevelAddButtons={[
    { id: 1, text: '新增選單', onClick: () => console.log('新增') },
  ]}
  onOrderChange={(fullData, currentLevel) => {
    console.log('順序變更:', fullData);
    setTreeData(fullData);
  }}
/>;
```

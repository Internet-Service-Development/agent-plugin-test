# DraggableList 組件

## DraggableList

可拖拽列表組件，提供表格式的拖拽排序功能，支援自訂欄位和渲染函數，適用於資料表格排序、清單管理等場景。

### 支援的 Props

| 名稱          | 型別                       | 必填 | 預設值 | 用途                 |
| ------------- | -------------------------- | ---- | ------ | -------------------- |
| className     | string                     | 否   |        | 自訂 CSS 樣式類別    |
| data          | DataType[]                 | 是   |        | 列表的資料陣列       |
| columns       | ColumnsType[]              | 是   |        | 欄位設定陣列         |
| disabled      | boolean                    | 否   | false  | 是否禁用拖拽功能     |
| onOrderChange | (args: DataType[]) => void | 否   |        | 順序改變時的回調函數 |

### 資料型別定義

```typescript
interface DataType {
  [key: string]: any;
  key: number | string;
}

interface ColumnsType {
  title?: string;
  key: string;
  align?: React.CSSProperties['textAlign'];
  width?: number;
  render?: (param: any, item: any) => React.ReactElement;
}
```

### 型別轉換與相容性

當你的資料來源具有特定型別（如 API 回應型別），而不是通用的 `DataType` 時，需要進行型別轉換以確保與 DraggableList 相容：

#### 問題場景

假設你有一個 API 型別 `ActivityPinItemT`：

```typescript
type ActivityPinItemT = {
  sort: number;
  status: StatusOptionE;
  endDate: string;
  imageURL: string;
  typeName: string;
  earnPoint: number;
  startDate: string;
  activityId: number;
  activityName: string;
};
```

#### 解決方案 1：資料轉換（推薦）

在傳入 DraggableList 之前，將資料轉換為包含 `key` 屬性的格式：

```typescript
// 原始資料
const [activityPinList, setActivityPinList] = useState<ActivityPinItemT[]>([]);

// 轉換為 DraggableList 可用的格式
const pinnedListData = activityPinList.map(item => ({
  ...item,
  key: item.activityId, // 使用 activityId 作為唯一 key
}));

// onOrderChange 處理函數需要將 DataType[] 轉回原始型別
const handleOrderChange = useCallback((newOrderData: DataType[]) => {
  // 重新映射排序順序
  const reorderedList = newOrderData.map((item, index) => ({
    ...item,
    sort: index + 1,
  }));
  setActivityPinList(reorderedList as ActivityPinItemT[]);
}, []);
```

#### 解決方案 2：型別擴展

如果你的型別已經有唯一識別字段，可以建立一個擴展型別：

```typescript
// 擴展原始型別以符合 DataType 要求
type ActivityPinDataType = ActivityPinItemT & {
  key: number | string;
};

// 在狀態中直接使用擴展型別
const [activityPinList, setActivityPinList] = useState<ActivityPinDataType[]>(
  []
);
```

#### 重要注意事項

1. **key 屬性是必需的**：每個資料項目必須有唯一的 `key` 屬性
2. **onOrderChange 型別**：回調函數接收的是 `DataType[]`，需要根據實際需求進行型別轉換
3. **欄位渲染**：在 `columns` 的 `render` 函數中，`item` 參數的型別是 `DataType`，可能需要型別斷言來存取特定屬性
4. **排序字段**：如果需要持久化排序，確保在 `onOrderChange` 中正確更新排序字段（如 `sort`）

### 引入方式

```js
import { DraggableList, type DraggableListProps } from '@eysoos/prisma';
```

### 組件使用範例

#### 基本使用

```tsx
const listData = [
  { key: 1, name: '項目 1', status: '進行中', priority: 'high' },
  { key: 2, name: '項目 2', status: '完成', priority: 'medium' },
];

const columns = [
  { title: '名稱', key: 'name', width: 200 },
  { title: '狀態', key: 'status', align: 'center' },
  {
    title: '優先級',
    key: 'priority',
    render: (value, item) => (
      <Badge variant={value === 'high' ? 'error' : 'default'}>{value}</Badge>
    ),
  },
];

<DraggableList
  data={listData}
  columns={columns}
  onOrderChange={newOrder => console.log('新順序:', newOrder)}
/>;
```

#### 實際專案範例：活動釘選列表

以下是一個完整的實際使用範例，展示如何處理 API 型別與 DraggableList 的整合：

```tsx
import React, { useState, useCallback, useMemo } from 'react';
import { DraggableList, IconButton } from '@eysoos/prisma';
import { StarSolidIcon, EditIcon } from '@eysoos/icons';

// API 回應型別
type ActivityPinItemT = {
  sort: number;
  status: string;
  endDate: string;
  imageURL: string;
  typeName: string;
  earnPoint: number;
  startDate: string;
  activityId: number;
  activityName: string;
};

const ActivityPinList = () => {
  // 使用原始 API 型別
  const [activityPinList, setActivityPinList] = useState<ActivityPinItemT[]>(
    []
  );

  // 處理順序變更
  const handleOrderChange = useCallback((newOrderData: DataType[]) => {
    // 將 DataType[] 轉換回原始型別並更新排序
    const reorderedList = newOrderData.map((item, index) => ({
      ...item,
      sort: index + 1,
    }));
    setActivityPinList(reorderedList as ActivityPinItemT[]);
  }, []);

  // 取消釘選
  const handleUnpin = useCallback((activityId: number) => {
    setActivityPinList(prev =>
      prev.filter(item => item.activityId !== activityId)
    );
  }, []);

  // 欄位配置
  const columns = useMemo(
    () => [
      {
        title: 'Activity Content',
        key: 'content',
        render: (_: any, item: ActivityPinItemT) => (
          <div>
            <h4>{item.activityName}</h4>
            <p>Points: {item.earnPoint}</p>
            <p>
              {item.startDate} - {item.endDate}
            </p>
          </div>
        ),
      },
      {
        title: 'Actions',
        key: 'actions',
        align: 'center' as const,
        width: 120,
        render: (_: any, item: ActivityPinItemT) => (
          <div style={{ display: 'flex', gap: '8px' }}>
            <IconButton onClick={() => handleUnpin(item.activityId)}>
              <StarSolidIcon />
            </IconButton>
            <IconButton>
              <EditIcon />
            </IconButton>
          </div>
        ),
      },
    ],
    [handleUnpin]
  );

  // 準備 DraggableList 需要的資料格式
  const pinnedListData = activityPinList.map(item => ({
    ...item,
    key: item.activityId, // 使用 activityId 作為唯一 key
  }));

  return (
    <DraggableList
      data={pinnedListData}
      columns={columns}
      onOrderChange={handleOrderChange}
      disabled={false}
    />
  );
};
```

#### 加入 Action Button（編輯、刪除等操作）

當需要在 DraggableList 中加入操作按鈕（如編輯、刪除）時，可以在 `columns` 的 `useMemo` 中使用 `render` 函數來實作：

```tsx
import { useMemo, useState } from 'react';
import { DeleteIcon, EditIcon } from '@eysoos/icons';
import { IconButton } from '@eysoos/prisma';

const TableWithActions = ({ data, permissions, onEdit, onDelete }) => {
  const [currentItem, setCurrentItem] = useState();

  const columns = useMemo(
    () => [
      {
        key: 'title', // 主要內容欄位
      },
      {
        key: 'edit',
        align: 'center',
        width: 52,
        render: (_, item) => (
          <IconButton
            disabled={!permissions.canEdit}
            onClick={() => {
              setCurrentItem(item);
              onEdit(item);
            }}
          >
            <EditIcon />
          </IconButton>
        ),
      },
      {
        key: 'remove',
        align: 'center',
        width: 52,
        render: (_, item) => (
          <IconButton
            disabled={!permissions.canDelete}
            onClick={() => {
              setCurrentItem(item);
              onDelete(item);
            }}
          >
            <DeleteIcon />
          </IconButton>
        ),
      },
    ],
    [permissions.canEdit, permissions.canDelete, onEdit, onDelete]
  );

  return (
    <DraggableList
      data={data}
      columns={columns}
      disabled={!permissions.canEdit}
      onOrderChange={handleOrderChange}
    />
  );
};
```

#### Action Button 實作要點

1. **使用 useMemo 包裝 columns**：確保 columns 配置在依賴項改變時才重新計算
2. **render 函數參數**：`render: (value, item) => ReactElement`
   - `value`：該欄位的值
   - `item`：整個資料項目
3. **IconButton 配置**：
   - 使用 `disabled` 屬性控制按鈕是否可用（通常根據權限）
   - 設定適當的 `width`（建議 52px）和 `align: 'center'`
4. **狀態管理**：使用 `useState` 管理當前選中的項目
5. **權限控制**：根據使用者權限動態啟用/禁用按鈕
6. **依賴項管理**：在 useMemo 的依賴陣列中包含所有相關的狀態和函數

### 常見問題與最佳實踐

#### Q: 為什麼 onOrderChange 接收的資料型別是 DataType[] 而不是我的原始型別？

A: DraggableList 是一個通用組件，設計為可處理任何型別的資料。`DataType` 是最小公約數型別，確保組件可以正常運作。你需要在回調函數中進行型別轉換。

```typescript
// ✅ 正確做法
const handleOrderChange = useCallback((newOrderData: DataType[]) => {
  const typedList = newOrderData as YourCustomType[];
  // 處理排序邏輯
}, []);

// ❌ 錯誤做法 - 直接假設型別
const handleOrderChange = useCallback((newOrderData: YourCustomType[]) => {
  // TypeScript 會報錯
}, []);
```

#### Q: 如何確保資料的唯一性？

A: 每個資料項目必須有唯一的 `key` 屬性。通常使用 ID 字段：

```typescript
// ✅ 使用唯一 ID
const data = items.map(item => ({
  ...item,
  key: item.id, // 或 item.activityId, item.userId 等
}));

// ❌ 使用非唯一值
const data = items.map((item, index) => ({
  ...item,
  key: index, // 索引不穩定，會導致渲染問題
}));
```

#### Q: render 函數中的 item 型別問題如何解決？

A: 在 render 函數中，item 的型別是 `DataType`。如需存取特定屬性，使用型別斷言：

```typescript
render: (_: any, item: DataType) => {
  const typedItem = item as YourCustomType;
  return <div>{typedItem.specificProperty}</div>;
};

// 或者直接在參數中進行型別斷言
render: (_: any, item: YourCustomType) => <div>{item.specificProperty}</div>;
```

#### 效能最佳化建議

1. **使用 useMemo 包裝 columns**：避免不必要的重新渲染
2. **使用 useCallback 包裝事件處理函數**：保持引用穩定性
3. **合理設定依賴項**：確保響應式更新的正確性
4. **避免在 render 中建立新物件**：使用穩定的樣式物件

```typescript
// ✅ 效能最佳化範例
const MyComponent = () => {
  // 穩定的樣式物件
  const actionButtonStyle = useMemo(
    () => ({
      display: 'flex',
      alignItems: 'center',
      gap: '8px',
    }),
    []
  );

  const columns = useMemo(
    () => [
      // columns 配置
    ],
    [
      /* 相關依賴 */
    ]
  );

  const handleOrderChange = useCallback(
    (newOrder: DataType[]) => {
      // 處理邏輯
    },
    [
      /* 相關依賴 */
    ]
  );

  return <DraggableList /* props */ />;
};
```

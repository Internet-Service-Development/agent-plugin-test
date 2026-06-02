# TransferList 組件

## TransferList

穿梭框組件，提供左右兩個列表之間的項目轉移功能，支援多選、刪除和自訂內容，適用於權限分配、項目選擇等場景。

### 支援的 Props

| 名稱                | 型別                                         | 必填 | 預設值            | 用途                   |
| ------------------- | -------------------------------------------- | ---- | ----------------- | ---------------------- |
| data                | TransferListData[]                           | 是   |                   | 左側列表的資料         |
| dataRight           | TransferListData[]                           | 否   | []                | 右側列表的資料         |
| deleteItem          | boolean                                      | 否   | false             | 是否顯示刪除按鈕       |
| btnHidden           | boolean                                      | 否   | false             | 是否隱藏中間的轉移按鈕 |
| leftTitle           | string                                       | 否   | 'Search Tag List' | 左側列表的標題         |
| rightTitle          | string                                       | 否   | 'Added Tag list'  | 右側列表的標題         |
| setCurrentLeftData  | Dispatch<SetStateAction<TransferListData[]>> | 否   |                   | 左側資料變更的回調函數 |
| setCurrentRightData | Dispatch<SetStateAction<TransferListData[]>> | 否   |                   | 右側資料變更的回調函數 |

### 型別定義

#### TransferListData

```typescript
interface TransferListData {
  id: number;
  title: string;
  disable?: boolean;
  checked?: boolean;
  linkName?: string;
  url?: string;
  component?: ReactNode;
  warning?: string;
  setData?: Dispatch<SetStateAction<TransferListData[]>>;
}
```

### 特色功能

- **雙向轉移**: 支援左右列表之間的項目轉移
- **多選操作**: 可同時選擇多個項目進行轉移
- **自訂內容**: 支援在項目中嵌入自訂組件
- **連結支援**: 項目可包含外部連結
- **禁用狀態**: 支援禁用特定項目
- **警告提示**: 可顯示項目的警告訊息
- **刪除功能**: 右側列表支援直接刪除項目

### 引入方式

```js
import {
  TransferList,
  type TransferListProps,
  type TransferListData,
} from '@eysoos/prisma';
```

### 組件使用範例

```tsx
const leftData = [
  {
    id: 1,
    title: '用戶管理',
    linkName: '查看詳情',
    url: '/users',
    warning: '需要管理員權限',
  },
  {
    id: 2,
    title: '系統設定',
    disable: true,
    component: <Badge>新功能</Badge>,
  },
];

const rightData = [
  {
    id: 3,
    title: '資料查看',
    checked: true,
  },
];

<TransferList
  data={leftData}
  dataRight={rightData}
  leftTitle="可用權限"
  rightTitle="已分配權限"
  deleteItem={true}
  setCurrentLeftData={setLeftData}
  setCurrentRightData={setRightData}
/>;
```

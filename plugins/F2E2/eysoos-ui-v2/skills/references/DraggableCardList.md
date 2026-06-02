# DraggableCardList 組件

## DraggableCardList

可拖拽卡片列表組件，提供拖拽排序功能的卡片式列表，支援自訂內容和操作按鈕，適用於任務管理、項目排序等場景。

### 支援的 Props

| 名稱                   | 型別                                        | 必填 | 預設值 | 用途                        |
| ---------------------- | ------------------------------------------- | ---- | ------ | --------------------------- |
| className              | string                                      | 否   |        | 自訂 CSS 樣式類別           |
| data                   | DraggableCardListDataType[]                 | 是   |        | 卡片列表的資料陣列          |
| disabled               | boolean                                     | 否   | false  | 是否禁用拖拽功能            |
| bordered               | boolean                                     | 否   | true   | 是否顯示卡片邊框            |
| shadowed               | boolean                                     | 否   | false  | 是否顯示卡片陰影            |
| cardContainerClassName | string                                      | 否   |        | 卡片容器的自訂 CSS 樣式類別 |
| onOrderChange          | (args: DraggableCardListDataType[]) => void | 否   |        | 順序改變時的回調函數        |

### 資料型別定義

```typescript
interface DraggableCardListDataType {
  key: number | string;
  renderContent: React.ReactNode;
  action?: IconButtonProps[] | React.ReactNode;
}
```

### 引入方式

```js
import { DraggableCardList, type DraggableCardListProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
const cardData = [
  {
    key: 1,
    renderContent: <div>卡片內容 1</div>,
    action: [
      { icon: <EditIcon />, onClick: () => console.log('編輯') },
      { icon: <DeleteIcon />, onClick: () => console.log('刪除') },
    ],
  },
  {
    key: 2,
    renderContent: <div>卡片內容 2</div>,
    action: <Button>自訂按鈕</Button>,
  },
];

<DraggableCardList
  data={cardData}
  bordered={true}
  shadowed={true}
  onOrderChange={newOrder => console.log('新順序:', newOrder)}
/>;
```

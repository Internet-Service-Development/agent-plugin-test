# DataTab 組件

## DataTab

資料標籤組件，用於展示統計數據和相關資訊，支援圖示、數字、名稱和篩選條件顯示，適用於儀表板和數據展示場景。

### 支援的 Props

| 名稱       | 型別       | 必填 | 預設值 | 用途                 |
| ---------- | ---------- | ---- | ------ | -------------------- |
| icon       | ReactNode  | 是   |        | 顯示的圖示元素       |
| dataNum    | number     | 否   |        | 顯示的數據數字       |
| dataName   | string     | 否   |        | 數據的名稱標籤       |
| dataFilter | string     | 否   |        | 數據的篩選條件描述   |
| onClick    | () => void | 否   |        | 點擊標籤時的回調函數 |
| active     | boolean    | 否   |        | 是否為啟用狀態       |
| fullWidth  | boolean    | 否   |        | 是否將寬度設為 100%  |

### 引入方式

```js
import { DataTab, type DataTabProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<DataTab
  icon={<AccountIcon />}
  dataNum={1234}
  dataName="使用者"
  dataFilter="本月新增"
  active={true}
  onClick={() => console.log('點擊資料標籤')}
/>
```

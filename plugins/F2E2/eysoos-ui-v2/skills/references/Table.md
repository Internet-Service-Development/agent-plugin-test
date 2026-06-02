# Table 組件

## Table

表格組件（@eysoos/prisma），提供資料展示的表格佈局，支援緊湊和寬鬆兩種樣式，適用於資料列表、報表展示等場景。

### 支援的 Props

| 名稱                  | 型別                              | 必填 | 預設值 | 用途                   |
| --------------------- | --------------------------------- | ---- | ------ | ---------------------- |
| data                  | TableTypeI[]                      | 否   |        | 表格資料               |
| columns               | TableColumnsTypeI[]               | 是   |        | 欄位定義               |
| compact               | boolean                           | 否   | false  | 是否使用緊湊樣式       |
| stickyHeader          | boolean                           | 否   |        | 是否固定表頭           |
| stickyTop             | string                            | 否   |        | 固定表頭的 top 位置    |
| size                  | 'small' \| 'medium'               | 否   |        | 表格尺寸               |
| resize                | boolean                           | 否   |        | 是否支援欄位調整寬度   |
| resizeBehavior        | 'constrained' \| 'flexible'       | 否   |        | 調整欄寬行為模式       |
| draggable             | boolean                           | 否   |        | 是否支援欄位拖曳排序   |
| draggableDisabled     | boolean                           | 否   |        | 是否禁用拖曳           |
| unitePadding          | boolean                           | 否   |        | 是否合併儲存格間距     |
| complex               | boolean                           | 否   |        | 複雜型表單模式         |
| dataList              | boolean                           | 否   |        | 資料型表單模式         |
| subheader             | ComplexSubheader \| ListSubheader | 否   |        | 次表頭設定             |
| stickyHeaderBgColor   | string                            | 否   |        | 固定表頭背景色         |
| noHeader              | boolean                           | 否   |        | 隱藏表頭               |
| noBorder              | boolean                           | 否   |        | 隱藏表格外框           |
| leftBorderPositions   | string[]                          | 否   |        | 指定欄位左側分隔線     |
| noResultDescription   | string                            | 否   |        | 無結果時的描述文字     |
| noResultSupplementary | string                            | 否   |        | 無結果時的補充說明     |
| noResultIcon          | React.ForwardRefExoticComponent   | 否   |        | 無結果時顯示的圖示     |
| quickLinkClassName    | string                            | 否   |        | 快速連結的自訂樣式類別 |
| scrollRef             | Element \| null                   | 否   |        | 滾動容器參考           |
| className             | string                            | 否   |        | 自訂 CSS 樣式類別      |
| onOrderChange         | (args: TableTypeI[]) => void      | 否   |        | 拖曳排序後的回調函數   |

### TableColumnsTypeI 欄位定義

| 屬性      | 型別                                    | 說明                            |
| --------- | --------------------------------------- | ------------------------------- |
| key       | string                                  | 欄位的唯一識別碼                |
| name      | ReactNode                               | 欄位標題                        |
| span      | number                                  | 欄位跨度                        |
| render    | (param: any, item: any) => ReactElement | 自訂渲染函數                    |
| onSort    | () => void                              | 排序回調函數                    |
| direction | 'asc' \| 'desc'                         | 排序方向                        |
| align     | CSSProperties['textAlign']              | 對齊方式                        |
| tooltip   | ReactNode                               | 欄位提示文字                    |
| width     | string \| number                        | 欄位寬度                        |
| minWidth  | number                                  | 最小寬度                        |
| mask      | boolean                                 | 是否遮罩資料                    |
| isAction  | boolean                                 | 是否為操作欄（支援凍結 action） |

### 注意事項

- 使用 @eysoos/prisma 的 Table 組件與相關子組件
- 組件內建滾動區域功能
- 支援緊湊模式和寬鬆模式兩種佈局樣式

### 引入方式

```ts
import {
  Table,
  TableTypeI,
  TableColumnsTypeI,
  ComplexSubheader,
  ListSubheader,
  type TableProps,
} from '@eysoos/prisma';
```

### 組件使用範例

#### 基本表格（支援排序、Tooltip）

```tsx
import { Table, TableColumnsTypeI, TableTypeI, Status } from '@eysoos/prisma';
import { EditIcon } from '@eysoos/icons';

const columnsLoose: TableColumnsTypeI[] = [
  {
    key: 'id',
    name: 'ID',
    align: 'left',
    width: '76px',
    onSort: () => console.log('sort'),
    direction: 'asc',
  },
  {
    key: 'name',
    name: 'Name',
    align: 'left',
    width: '230px',
    tooltip: 'Tooltip text',
    onSort: () => console.log('sort'),
  },
  {
    key: 'status',
    name: 'Status',
    align: 'left',
    width: '124px',
    render: (status, item) => (
      <Status variant="button" status="positive">
        {status}
      </Status>
    ),
  },
  {
    key: 'date',
    name: 'Date',
    align: 'left',
    onSort: () => console.log('sort'),
  },
];

const data: TableTypeI[] = [
  {
    key: 1,
    id: 11,
    name: 'ROG STRIX Z690-A',
    status: 'Online',
    date: '2022/04/27',
  },
  {
    key: 2,
    id: 22,
    name: 'ROG STRIX Z690-B',
    status: 'Online',
    date: '2022/04/28',
  },
];

<Table resize data={data} stickyHeader columns={columnsLoose} />;
```

#### 可拖曳排序表格

```tsx
<Table
  resize
  draggable
  data={data}
  stickyHeader
  columns={columnsLoose}
  onOrderChange={newOrder => console.log('新排序:', newOrder)}
/>
```

#### 緊湊模式（含 Checkbox 全選）

```tsx
import { Table, TableColumnsTypeI, Checkbox, Card } from '@eysoos/prisma';

const columnsCompact = (
  onCheckAll: () => void,
  isEachBoxChecked: boolean
): TableColumnsTypeI[] => [
  {
    name: <Checkbox onChange={onCheckAll} checked={isEachBoxChecked} />,
    key: 'checkbox',
    align: 'left',
    width: '80px',
    mask: false,
  },
  { key: 'id', name: 'ID', align: 'left', width: '80px' },
  { key: 'name', name: 'Name', align: 'left', width: '210px' },
];

<Card>
  <Table
    compact
    unitePadding
    data={data}
    columns={columnsCompact(onCheckAll, isEachBoxChecked)}
  />
</Card>;
```

#### 複雜型表單（多層次表頭）

```tsx
import {
  Table,
  TableColumnsTypeI,
  ComplexSubheader,
  Input,
} from '@eysoos/prisma';

const columnComplex: TableColumnsTypeI[] = [
  { key: 'category', name: 'Category', align: 'left', width: '40%', span: 2 },
  { key: 'field_name', name: 'Field Name', align: 'left', width: '20%' },
  { key: 'prefix', name: 'Prefix', align: 'left', width: '40%', span: 2 },
];

const subheaderComplex: ComplexSubheader = {
  category: [
    { name: 'Original', key: 'original', width: '300px' },
    {
      name: 'Localized',
      key: 'localized',
      width: '200px',
      render: (data, item) => <Input defaultValue={data} />,
    },
  ],
  field_name: [{ name: '', key: '', width: '102px' }],
  prefix: [
    { name: 'Original', key: 'original', width: '300px' },
    { name: 'Localized', key: 'localized', width: '200px' },
  ],
};

<Table
  complex
  compact
  stickyHeader
  data={complexData}
  columns={columnComplex}
  subheader={subheaderComplex}
  stickyHeaderBgColor="var(--eysoos-content-area-background-color)"
/>;
```

#### 資料型表單（DataList 模式）

```tsx
import { Table, TableColumnsTypeI, ListSubheader } from '@eysoos/prisma';

const columnDataList: TableColumnsTypeI[] = [
  { key: 'product', name: 'Product', align: 'left', width: '40%', span: 2 },
  { key: 'budget', name: 'Budget', align: 'left', width: '40%', span: 4 },
  { key: 'download', name: 'Download', align: 'left', width: '20%', span: 2 },
];

const subheaderDataList: ListSubheader = {
  product: [
    { name: 'ID', key: 'id', width: '5%' },
    { name: 'Product Name', key: 'product_name', width: '30%' },
  ],
  budget: [
    { name: 'Unit price', key: 'unit_price', width: '10%' },
    { name: 'Uom', key: 'uom', width: '5%' },
    { name: 'Width', key: 'width', width: '5%' },
    { name: 'Date', key: 'date', width: '13%' },
  ],
  download: [
    { name: 'Type', key: 'type', width: '5%' },
    { name: 'Size', key: 'size', width: '7%' },
  ],
};

<Table
  dataList
  compact
  leftBorderPositions={['unit_price', 'type']}
  data={dataListData}
  columns={columnDataList}
  subheader={subheaderDataList}
/>;
```

#### 無表頭、無邊框模式

```tsx
<Table
  dataList
  compact
  noHeader
  noBorder
  data={data}
  columns={columns}
  subheader={subheader}
/>
```

#### 小尺寸表格（size="small"）

```tsx
import { Table, TableColumnsTypeI, TextLink, IconButton } from '@eysoos/prisma';
import { EditIcon, VisibleIcon, BannerIcon } from '@eysoos/icons';

const smallColumns: TableColumnsTypeI[] = [
  { key: 'id', render: text => <TextLink>{text}</TextLink> },
  { key: 'name' },
  { key: 'content' },
  { key: 'date' },
  {
    key: 'actions',
    align: 'center',
    render: (icons, item) => (
      <Box display="flex" gap="8px">
        {icons.map((icon, index) => (
          <IconButton quiet size="small" key={index} disabled={index === 0}>
            {icon}
          </IconButton>
        ))}
      </Box>
    ),
  },
];

const smallData = [
  {
    key: '1',
    id: 15285,
    name: 'Product Name',
    date: '2022/04/27',
    content: 'Accessories',
    actions: [<EditIcon />, <VisibleIcon />, <BannerIcon />],
  },
];

<Table data={smallData} columns={smallColumns} size="small" />;
```

#### 搭配控制元件（Input、Status、IconButton）

```tsx
import { Table, Input, Status, IconButton, Tooltip } from '@eysoos/prisma';
import { DuplicateIcon, EditIcon } from '@eysoos/icons';

const dataWithControls = [
  {
    key: 0,
    id: 7483,
    product_name: 'ROG STRIX Z690-A GAMING',
    unit_price: '200.0 USD',
    uom: (
      <Input
        defaultValue="Please input text"
        style={{ height: '25px', width: '140px' }}
      />
    ),
    width: (
      <Status variant="button" status="positive">
        Online
      </Status>
    ),
    date: '2022/04/27 12:07:02',
    actions: (
      <Tooltip title="Actions" placement="top">
        <Box>
          <IconButton>
            <DuplicateIcon />
          </IconButton>
          <IconButton style={{ marginLeft: '10px' }}>
            <EditIcon />
          </IconButton>
        </Box>
      </Tooltip>
    ),
  },
];

<Table
  dataList
  compact
  noHeader
  data={dataWithControls}
  columns={columnDataList}
  subheader={subheaderControlDataList}
/>;
```

#### 無資料顯示

```tsx
<Table data={[]} columns={columnsLoose} />
```

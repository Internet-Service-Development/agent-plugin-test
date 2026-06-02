# Breadcrumbs 組件

## Breadcrumbs

麵包屑導航組件，用於顯示使用者當前位置的導航路徑，幫助使用者了解所在頁面層級並快速返回上層頁面。

### 支援的 Props

| 名稱      | 型別      | 必填 | 預設值 | 用途                         |
| --------- | --------- | ---- | ------ | ---------------------------- |
| children  | ReactNode | 否   |        | 麵包屑的子元素內容           |
| className | string    | 否   |        | 自訂 CSS 樣式類別            |
| separator | ReactNode | 否   |        | 自訂麵包屑項目之間的分隔符號 |

### 引入方式

```js
import { Breadcrumbs, type BreadcrumbsProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Breadcrumbs>
  <Breadcrumbs.Item>
    <a href="/home">首頁</a>
  </Breadcrumbs.Item>
  <Breadcrumbs.Item>產品分類</Breadcrumbs.Item>
  <Breadcrumbs.Item current>產品詳情</Breadcrumbs.Item>
</Breadcrumbs>
```

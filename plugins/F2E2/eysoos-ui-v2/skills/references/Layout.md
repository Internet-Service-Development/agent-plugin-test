# Layout 組件

## Layout

佈局組件集合，提供頁面結構和內容組織的標準化佈局，包含內容包裝器、段落標題和子段落等組件，適用於頁面佈局和內容結構化。

## 子組件

### ContentWrapper

內容包裝器組件，為頁面提供標準的內邊距和背景樣式。

#### Props

| 名稱     | 型別      | 必填 | 預設值 | 用途       |
| -------- | --------- | ---- | ------ | ---------- |
| children | ReactNode | 否   |        | 包裝的內容 |

### ParagraphMain

主段落組件，提供標題、描述和控制項的標準佈局。

#### Props

| 名稱        | 型別      | 必填 | 預設值 | 用途                         |
| ----------- | --------- | ---- | ------ | ---------------------------- |
| title       | ReactNode | 否   |        | 段落標題                     |
| description | ReactNode | 否   |        | 段落描述                     |
| controls    | ReactNode | 否   |        | 控制項元素                   |
| separate    | boolean   | 否   | false  | 是否將子元素分別包裝在卡片中 |
| children    | ReactNode | 否   |        | 段落內容                     |

### ParagraphPageTitle

頁面標題組件，提供頁面級別的標題佈局。

#### Props

| 名稱     | 型別      | 必填 | 預設值 | 用途       |
| -------- | --------- | ---- | ------ | ---------- |
| children | ReactNode | 是   |        | 標題內容   |
| controls | ReactNode | 否   |        | 控制項元素 |

### ParagraphSub

子段落組件，提供較小層級的段落佈局。

#### Props

| 名稱     | 型別      | 必填 | 預設值 | 用途       |
| -------- | --------- | ---- | ------ | ---------- |
| title    | ReactNode | 否   |        | 子段落標題 |
| controls | ReactNode | 否   |        | 控制項元素 |
| children | ReactNode | 否   |        | 子段落內容 |

### 引入方式

```js
import {
  ContentWrapper,
  ParagraphMain,
  ParagraphPageTitle,
  ParagraphSub,
} from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<ContentWrapper>
  <ParagraphPageTitle controls={<Button>操作</Button>}>
    頁面標題
  </ParagraphPageTitle>

  <ParagraphMain
    title="主要段落"
    description="這是段落的描述文字"
    controls={<Button>編輯</Button>}
    separate={true}
  >
    <div>內容區塊 1</div>
    <div>內容區塊 2</div>
  </ParagraphMain>

  <ParagraphSub title="子段落標題">子段落的內容文字</ParagraphSub>
</ContentWrapper>
```

# Drawer 組件

## Drawer

抽屜組件，提供從螢幕邊緣滑出的側邊面板，支援左右方向和自訂頁首頁尾，適用於導航選單、設定面板等場景。

### 支援的 Props

| 名稱      | 型別              | 必填 | 預設值  | 用途                 |
| --------- | ----------------- | ---- | ------- | -------------------- |
| children  | ReactNode         | 否   |         | 抽屜的主要內容       |
| anchor    | 'left' \| 'right' | 否   | 'right' | 抽屜出現的方向       |
| className | string            | 否   |         | 自訂 CSS 樣式類別    |
| open      | boolean           | 否   | false   | 控制抽屜的開啟狀態   |
| header    | ReactNode         | 否   |         | 抽屜的頁首內容       |
| footer    | ReactNode         | 否   |         | 抽屜的頁尾內容       |
| onClose   | () => void        | 否   |         | 抽屜關閉時的回調函數 |

### 引入方式

```js
// 從 @eysoos/prisma 引入
import { Drawer, type DrawerProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Drawer
  open={isOpen}
  anchor="right"
  header={<h2>設定</h2>}
  footer={<Button onClick={handleSave}>儲存</Button>}
  onClose={() => setIsOpen(false)}
>
  <div>抽屜內容</div>
</Drawer>

<Drawer open={showMenu} anchor="left">
  <Drawer.HiddenTitle />
  <Drawer.HiddenDescription />
  <nav>
    <a href="/home">首頁</a>
    <a href="/about">關於我們</a>
  </nav>
</Drawer>
```

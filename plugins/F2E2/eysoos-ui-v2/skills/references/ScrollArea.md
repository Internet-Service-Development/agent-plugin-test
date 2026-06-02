# ScrollArea 組件

## ScrollArea

滾動區域組件，提供自訂滾動條樣式的容器，支援多種顯示模式和滾動行為，適用於內容溢出時的滾動展示。

### 支援的 Props

| 名稱                 | 型別                                                              | 必填 | 預設值    | 用途                         |
| -------------------- | ----------------------------------------------------------------- | ---- | --------- | ---------------------------- |
| children             | ReactNode                                                         | 否   |           | 滾動區域的內容               |
| className            | string                                                            | 否   |           | 自訂 CSS 樣式類別            |
| variant              | 'default' \| 'page' \| 'always' \| 'hide'                         | 否   | 'default' | 滾動條的顯示模式             |
| onScroll             | (e: UIEvent) => void                                              | 否   |           | 滾動事件的回調函數           |
| onScrollableChange   | (orientation: 'vertical' \| 'horizontal', state: boolean) => void | 否   |           | 滾動狀態改變時的回調函數     |
| viewportScrollStyles | CSS.Properties                                                    | 否   |           | 當需要滾動時應用到視窗的樣式 |
| viewportRef          | MutableRefObject<HTMLDivElement \| null>                          | 否   |           | 視窗元素的 ref               |
| scrollbarHidden      | boolean                                                           | 否   | false     | 是否強制隱藏滾動條           |

### 滾動條模式說明

- **default**: 滑鼠懸停時顯示滾動條
- **page**: 滾動時顯示滾動條，滾動條較寬
- **always**: 始終顯示滾動條
- **hide**: 始終隱藏滾動條

### 引入方式

```js
import { ScrollArea, type ScrollAreaProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<ScrollArea
  variant="default"
  onScroll={e => console.log('滾動中')}
  viewportScrollStyles={{ paddingBottom: '20px' }}
>
  <div style={{ height: '1000px' }}>很長的內容...</div>
</ScrollArea>
```

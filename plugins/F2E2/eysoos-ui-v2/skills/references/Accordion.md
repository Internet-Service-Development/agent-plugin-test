# Accordion 組件

## Accordion

手風琴組件，用於顯示可展開和收合的內容區塊，適合用於常見問題、詳細資訊展示等場景。

### 支援的 Props

| 名稱             | 型別                                                           | 必填 | 預設值 | 用途                                                        |
| ---------------- | -------------------------------------------------------------- | ---- | ------ | ----------------------------------------------------------- |
| children         | ReactNode                                                      | 否   |        | 手風琴的子元素內容                                          |
| className        | string                                                         | 否   |        | 自訂 CSS 樣式類別                                           |
| expanded         | boolean                                                        | 否   |        | 控制手風琴的展開狀態，使組件變為受控組件                    |
| defaultExpanded  | boolean                                                        | 否   | false  | 設定手風琴的預設展開狀態                                    |
| defaultGap       | boolean                                                        | 否   | false  | 是否在 AccordionSummary 和 AccordionDetail 之間設定預設間距 |
| fullWidth        | boolean                                                        | 否   | false  | 是否將手風琴寬度設為 100%                                   |
| onExpandedChange | (event: MouseEvent<HTMLDivElement>, expanded: boolean) => void | 否   |        | 當展開/收合狀態改變時的回調函數                             |

### 引入方式

```js
import { Accordion, type AccordionProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Accordion defaultExpanded={true} defaultGap={true}>
  <Accordion.AccordionSummary>
    <h3>自訂規格內容</h3>
  </Accordion.AccordionSummary>
  <Accordion.AccordionDetail>
    <p>資料將從 00:15 開始每 2 小時同步一次。</p>
  </Accordion.AccordionDetail>
</Accordion>
```

# Stepper 組件

## Stepper

步驟器組件，用於顯示多步驟流程的進度，支援水平和垂直佈局，適用於表單嚮導、流程指引等場景。

### 支援的 Props

| 名稱           | 型別                           | 必填 | 預設值       | 用途                      |
| -------------- | ------------------------------ | ---- | ------------ | ------------------------- |
| className      | string                         | 否   |              | 自訂 CSS 樣式類別         |
| stepperData    | StepperData[]                  | 是   |              | 步驟資料陣列              |
| stepId         | number \| string               | 否   |              | 目前步驟 ID（受控模式）   |
| defaultStepId  | number \| string               | 否   |              | 預設步驟 ID（非受控模式） |
| onChange       | (id: number \| string) => void | 否   |              | 步驟改變時的回調函數      |
| onSelect       | (id: number \| string) => void | 否   |              | 步驟選擇時的回調函數      |
| fullWidth      | boolean                        | 否   | true         | 是否佔滿容器寬度          |
| labelDirection | 'horizontal' \| 'vertical'     | 否   | 'horizontal' | 標籤的排列方向            |

#### StepperData 介面

| 名稱   | 型別                | 必填 | 用途             |
| ------ | ------------------- | ---- | ---------------- |
| id     | number \| string    | 是   | 步驟的唯一識別碼 |
| num    | number \| string    | 否   | 步驟編號         |
| label  | string              | 否   | 步驟標籤         |
| status | 'success' \| 'fail' | 否   | 步驟狀態         |
| icon   | ReactNode           | 否   | 自訂圖示         |

### 引入方式

```js
import { Stepper, type StepperProps, type StepperData } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
const stepperData = [
  { id: 1, num: 1, label: '基本資訊', status: 'success' },
  { id: 2, num: 2, label: '詳細設定' },
  { id: 3, num: 3, label: '確認送出' },
];

<Stepper
  stepperData={stepperData}
  stepId={currentStep}
  onChange={id => setCurrentStep(id)}
  labelDirection="horizontal"
/>;
```

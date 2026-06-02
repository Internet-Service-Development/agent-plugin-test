# Button 組件

## Button

按鈕組件，提供多種樣式變體和尺寸選擇，支援載入狀態顯示，是使用者介面中最常用的互動元素。

### 支援的 Props

| 名稱      | 型別                                                   | 必填 | 預設值      | 用途                    |
| --------- | ------------------------------------------------------ | ---- | ----------- | ----------------------- |
| children  | ReactNode                                              | 否   |             | 按鈕的內容文字或元素    |
| className | string                                                 | 否   |             | 自訂 CSS 樣式類別       |
| variant   | 'contained' \| 'outlined' \| 'whiteOutlined' \| 'text' | 否   | 'contained' | 按鈕的樣式變體          |
| size      | 'small' \| 'medium' \| 'large' \| 'extraLarge'         | 否   | 'medium'    | 按鈕的尺寸大小          |
| loading   | boolean                                                | 否   | false       | 是否顯示載入狀態        |
| fullWidth | boolean                                                | 否   | false       | 是否將按鈕寬度設為 100% |
| type      | 'button' \| 'submit' \| 'reset'                        | 否   | 'button'    | 按鈕的 HTML type 屬性   |
| disabled  | boolean                                                | 否   |             | 是否禁用按鈕            |
| onClick   | (event: MouseEvent<HTMLButtonElement>) => void         | 否   |             | 點擊按鈕時的回調函數    |

### 引入方式

```js
import { Button, type ButtonProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<Button variant="contained" size="medium" loading={false}>
  確認
</Button>
```

## AIButton

AI 功能專用按鈕，具有獨特的漸層樣式設計，適合用於強調 AI 相關功能操作。

### 支援的 Props

| 名稱      | 型別                            | 必填 | 預設值      | 用途                    |
| --------- | ------------------------------- | ---- | ----------- | ----------------------- |
| children  | ReactNode                       | 否   |             | 按鈕的內容文字或元素    |
| className | string                          | 否   |             | 自訂 CSS 樣式類別       |
| variant   | 'contained' \| 'outlined'       | 否   | 'contained' | 按鈕的樣式變體          |
| size      | 'small' \| 'medium' \| 'large'  | 否   | 'medium'    | 按鈕的尺寸大小          |
| loading   | boolean                         | 否   | false       | 是否顯示載入狀態        |
| fullWidth | boolean                         | 否   | false       | 是否將按鈕寬度設為 100% |
| type      | 'button' \| 'submit' \| 'reset' | 否   | 'button'    | 按鈕的 HTML type 屬性   |
| disabled  | boolean                         | 否   |             | 是否禁用按鈕            |

> **注意**：AIButton 不支援 `variant: 'text'` 和 `'whiteOutlined'`，也不支援 `size: 'extraLarge'`。

### 引入方式

```js
import { Button } from '@eysoos/prisma';

// 使用 Button.AIButton
<Button.AIButton variant="contained">AI 生成</Button.AIButton>;
```

### 組件使用範例

```tsx
import { Button } from '@eysoos/prisma';
import { useState } from 'react';

function AIGenerateButton() {
  const [loading, setLoading] = useState(false);

  const handleGenerate = async () => {
    setLoading(true);
    await generateAIContent();
    setLoading(false);
  };

  return (
    <Button.AIButton loading={loading} onClick={handleGenerate}>
      AI 生成
    </Button.AIButton>
  );
}
```

## AuxiliaryButton

輔助按鈕，用於次要操作或輔助功能，支援選中狀態。

### 支援的 Props

| 名稱      | 型別                            | 必填 | 預設值     | 用途                  |
| --------- | ------------------------------- | ---- | ---------- | --------------------- |
| children  | ReactNode                       | 否   |            | 按鈕的內容文字或元素  |
| className | string                          | 否   |            | 自訂 CSS 樣式類別     |
| variant   | 'outlined' \| 'contained'       | 否   | 'outlined' | 按鈕的樣式變體        |
| size      | 'small' \| 'medium'             | 否   | 'small'    | 按鈕的尺寸大小        |
| selected  | boolean                         | 否   | false      | 是否為選中狀態        |
| disabled  | boolean                         | 否   |            | 是否禁用按鈕          |
| type      | 'button' \| 'submit' \| 'reset' | 否   | 'button'   | 按鈕的 HTML type 屬性 |

### 引入方式

```js
import { Button } from '@eysoos/prisma';

// 使用 Button.Auxiliary
<Button.Auxiliary variant="contained">
  <OriginDataIcon />
  Tools
</Button.Auxiliary>;
```

### 組件使用範例

```tsx
import { Button } from '@eysoos/prisma';
import { OriginDataIcon } from '@eysoos/icons';

function AuxiliaryButtonExample() {
  const [selected, setSelected] = useState(false);

  return (
    <Button.Auxiliary
      variant="outlined"
      size="small"
      selected={selected}
      onClick={() => setSelected(!selected)}
    >
      <OriginDataIcon />
      Tools
    </Button.Auxiliary>
  );
}
```

## AuxiliarySwitchButton

輔助切換按鈕，提供左右兩個圖示按鈕的切換功能，適用於模式切換場景。

### 支援的 Props

| 名稱           | 型別                | 必填 | 預設值   | 用途               |
| -------------- | ------------------- | ---- | -------- | ------------------ |
| className      | string              | 否   |          | 自訂 CSS 樣式類別  |
| size           | 'small' \| 'medium' | 否   | 'medium' | 按鈕的尺寸大小     |
| selected       | 'left' \| 'right'   | 否   | 'left'   | 選中的按鈕位置     |
| leftIcon       | ReactNode           | 是   |          | 左側按鈕的圖示     |
| rightIcon      | ReactNode           | 是   |          | 右側按鈕的圖示     |
| onLeftClicked  | () => void          | 否   |          | 點擊左側按鈕的回調 |
| onRightClicked | () => void          | 否   |          | 點擊右側按鈕的回調 |

### 引入方式

```js
import { Button } from '@eysoos/prisma';

// 使用 Button.AuxiliarySwitch
<Button.AuxiliarySwitch leftIcon={<GridIcon />} rightIcon={<ListIcon />} />;
```

### 組件使用範例

```tsx
import { Button } from '@eysoos/prisma';
import { GridListIcon, ViewListIcon } from '@eysoos/icons';

function ViewSwitcher() {
  const [viewMode, setViewMode] = useState<'left' | 'right'>('left');

  return (
    <Button.AuxiliarySwitch
      size="medium"
      selected={viewMode}
      leftIcon={<GridListIcon />}
      rightIcon={<ViewListIcon />}
      onLeftClicked={() => setViewMode('left')}
      onRightClicked={() => setViewMode('right')}
    />
  );
}
```

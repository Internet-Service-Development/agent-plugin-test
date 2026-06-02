# AIButton 組件

## AIButton

`AIButton` 是專為 AI 相關功能設計的按鈕組件，提供漸層樣式和 loading 狀態支援，適合用於各種 AI 觸發操作，例如內容生成、圖片處理或智慧搜尋等。

### 支援的 Props

| 屬性        | 類型                              | 預設值        | 說明               |
| ----------- | --------------------------------- | ------------- | ------------------ |
| `variant`   | `'contained' \| 'outlined'`       | `'contained'` | 按鈕變體樣式       |
| `size`      | `'small' \| 'medium' \| 'large'`  | `'medium'`    | 按鈕尺寸           |
| `loading`   | `boolean`                         | `false`       | 是否顯示載入狀態   |
| `fullWidth` | `boolean`                         | `false`       | 是否佔滿父容器寬度 |
| `disabled`  | `boolean`                         | `false`       | 是否禁用按鈕       |
| `type`      | `'button' \| 'submit' \| 'reset'` | `'button'`    | 按鈕類型           |
| `className` | `string`                          | -             | 自訂 CSS 類別      |
| `children`  | `ReactNode`                       | -             | 按鈕內容           |

> **注意**：AIButton 的 `variant` 不支援 `'text'` 和 `'whiteOutlined'`，`size` 不支援 `'extraLarge'`。

### 引入方式

```tsx
import { Button, type AIButtonProps } from '@eysoos/prisma';

// 使用 Button.AIButton
<Button.AIButton onClick={() => console.log('AI 功能啟動')}>
  AI 生成
</Button.AIButton>;
```

### 組件使用範例

```tsx
import { Button } from '@eysoos/prisma';

function MyComponent() {
  return (
    <Button.AIButton onClick={() => console.log('AI 功能啟動')}>
      AI 生成
    </Button.AIButton>
  );
}
```

#### 不同變體

```tsx
import { Button } from '@eysoos/prisma';

function VariantExamples() {
  return (
    <div>
      <Button.AIButton variant="contained">Contained</Button.AIButton>
      <Button.AIButton variant="outlined">Outlined</Button.AIButton>
    </div>
  );
}
```

#### 不同尺寸

```tsx
import { Button } from '@eysoos/prisma';

function SizeExamples() {
  return (
    <div>
      <Button.AIButton size="small">Small</Button.AIButton>
      <Button.AIButton size="medium">Medium</Button.AIButton>
      <Button.AIButton size="large">Large</Button.AIButton>
    </div>
  );
}
```

#### Loading 狀態

```tsx
import { Button } from '@eysoos/prisma';
import { useState } from 'react';

function LoadingExample() {
  const [loading, setLoading] = useState(false);

  const handleGenerate = async () => {
    setLoading(true);
    // 模擬 AI 生成操作
    await new Promise(resolve => setTimeout(resolve, 2000));
    setLoading(false);
  };

  return (
    <Button.AIButton loading={loading} onClick={handleGenerate}>
      AI 生成內容
    </Button.AIButton>
  );
}
```

#### 全寬按鈕

```tsx
import { Button } from '@eysoos/prisma';

function FullWidthExample() {
  return (
    <div style={{ width: '300px' }}>
      <Button.AIButton fullWidth>開始 AI 分析</Button.AIButton>
    </div>
  );
}
```

### 使用情境

- AI 內容生成功能
- AI 圖片處理功能
- AI 搜尋功能
- 任何需要突出 AI 功能的操作按鈕

### 注意事項

- `Button.AIButton` 具有獨特的漸層樣式，適合用於強調 AI 相關功能
- 當 `loading` 為 `true` 時，按鈕內容會被替換為 `LoadingIcon`
- 繼承自標準 HTML `button` 元素的所有屬性
- 不支援 `variant: 'text'` 和 `'whiteOutlined'`
- 不支援 `size: 'extraLarge'`

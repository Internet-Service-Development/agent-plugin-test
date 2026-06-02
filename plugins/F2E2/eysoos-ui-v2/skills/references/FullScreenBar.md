# FullScreenBar

## 概述

`FullScreenBar` 是用於全螢幕編輯頁面的頂部工具列組件，提供返回、儲存、預覽、發佈等常用操作按鈕。

## 匯入

```tsx
import { FullScreenBar } from '@eysoos/prisma';
```

## 基本用法

```tsx
import { FullScreenBar } from '@eysoos/prisma';

function EditorPage() {
  return (
    <FullScreenBar
      title="文章編輯"
      backTitle="返回"
      onBackButtonClicked={() => navigate(-1)}
      onSaveButtonClicked={() => handleSave()}
      onPreviewButtonClicked={() => handlePreview()}
      onPublishButtonClicked={() => handlePublish()}
    />
  );
}
```

## Props

| 屬性                     | 類型         | 預設值   | 說明                       |
| ------------------------ | ------------ | -------- | -------------------------- |
| `title`                  | `string`     | -        | 標題文字                   |
| `backTitle`              | `string`     | `'Back'` | 返回按鈕文字               |
| `subTitle`               | `string`     | -        | 副標題文字                 |
| `titleStatus`            | `string`     | -        | 標題狀態標籤               |
| `isBackButtonDisabled`   | `boolean`    | `false`  | 是否禁用返回按鈕           |
| `isSaveDisabled`         | `boolean`    | `false`  | 是否禁用儲存按鈕           |
| `isPreviewDisabled`      | `boolean`    | `false`  | 是否禁用預覽按鈕           |
| `isPublishDisabled`      | `boolean`    | `false`  | 是否禁用發佈按鈕           |
| `onBackButtonClicked`    | `() => void` | -        | 返回按鈕點擊回調           |
| `onSaveButtonClicked`    | `() => void` | -        | 儲存按鈕點擊回調           |
| `onPreviewButtonClicked` | `() => void` | -        | 預覽按鈕點擊回調           |
| `onPublishButtonClicked` | `() => void` | -        | 發佈按鈕點擊回調           |
| `textField`              | `ReactNode`  | -        | 自訂文字輸入區域           |
| `icon`                   | `ReactNode`  | -        | 自訂圖示                   |
| `select`                 | `ReactNode`  | -        | 自訂選擇器                 |
| `restRight`              | `ReactNode`  | -        | 右側額外內容               |
| `restRightDivider`       | `boolean`    | `true`   | 右側額外內容是否顯示分隔線 |
| `customizeRight`         | `ReactNode`  | -        | 完全自訂右側區域           |
| `customizedLeft`         | `ReactNode`  | -        | 自訂左側區域               |
| `className`              | `string`     | -        | 自訂 CSS 類別              |

## 範例

### 標準編輯器工具列

```tsx
import { FullScreenBar } from '@eysoos/prisma';

function ArticleEditor() {
  const handleSave = async () => {
    // 儲存邏輯
  };

  const handlePreview = () => {
    // 開啟預覽
  };

  const handlePublish = async () => {
    // 發佈邏輯
  };

  return (
    <div>
      <FullScreenBar
        title="編輯文章"
        subTitle="草稿"
        titleStatus="未發佈"
        backTitle="返回列表"
        onBackButtonClicked={() => navigate('/articles')}
        onSaveButtonClicked={handleSave}
        onPreviewButtonClicked={handlePreview}
        onPublishButtonClicked={handlePublish}
      />
      {/* 編輯器內容 */}
    </div>
  );
}
```

### 帶狀態控制的工具列

```tsx
import { FullScreenBar } from '@eysoos/prisma';
import { useState } from 'react';

function ControlledToolbar() {
  const [isSaving, setIsSaving] = useState(false);
  const [hasChanges, setHasChanges] = useState(false);

  return (
    <FullScreenBar
      title="專案設定"
      onBackButtonClicked={() => navigate(-1)}
      onSaveButtonClicked={async () => {
        setIsSaving(true);
        await saveProject();
        setIsSaving(false);
        setHasChanges(false);
      }}
      isSaveDisabled={!hasChanges || isSaving}
    />
  );
}
```

### 自訂右側區域

```tsx
import { FullScreenBar, Select } from '@eysoos/prisma';

function CustomRightArea() {
  return (
    <FullScreenBar
      title="頁面編輯"
      onBackButtonClicked={() => navigate(-1)}
      select={
        <Select
          options={[
            { value: 'draft', label: '草稿' },
            { value: 'published', label: '已發佈' },
          ]}
          defaultValue="draft"
        />
      }
      restRight={<span style={{ color: '#666' }}>最後儲存: 10:30</span>}
    />
  );
}
```

## 響應式行為

`FullScreenBar` 會根據螢幕寬度自動調整按鈕尺寸：

- 當螢幕寬度小於 breakpoint L 時，按鈕尺寸會自動縮小為 `small`
- 在較大螢幕上，按鈕尺寸為 `medium`

## 使用情境

- 文章/內容編輯頁面
- 表單編輯頁面
- 設定頁面
- 任何需要全螢幕編輯的場景

## 注意事項

- 只有提供對應的 `on*Clicked` 回調函數時，該按鈕才會顯示
- 返回按鈕使用 `TextLink` 組件，帶有左側箭頭圖示
- 組件會自動套用主題樣式，支援深色模式

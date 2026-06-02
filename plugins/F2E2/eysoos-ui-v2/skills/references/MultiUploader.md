# MultiUploader 組件

## MultiUploader

多檔案上傳組件，提供拖拽上傳、檔案驗證和進度顯示功能，支援多種檔案格式和尺寸限制，適用於批量檔案上傳場景。

### 支援的 Props

| 名稱             | 型別                                        | 必填 | 預設值         | 用途                       |
| ---------------- | ------------------------------------------- | ---- | -------------- | -------------------------- |
| className        | string                                      | 否   |                | 自訂 CSS 樣式類別          |
| title            | string                                      | 否   | 'Upload Files' | 上傳區域的標題             |
| accept           | AcceptedExtension[]                         | 否   |                | 接受的檔案類型陣列         |
| maxSize          | string                                      | 否   |                | 最大檔案大小（如 '10MB'）  |
| minSize          | string                                      | 否   |                | 最小檔案大小（如 '1KB'）   |
| maxFiles         | number                                      | 否   |                | 最大檔案數量               |
| multiple         | boolean                                     | 否   | true           | 是否支援多檔案選擇         |
| disabled         | boolean                                     | 否   | false          | 是否禁用上傳功能           |
| required         | boolean                                     | 否   | false          | 是否為必填欄位             |
| defaultFileState | FileWithID<File>[]                          | 否   |                | 預設的檔案狀態             |
| uploadStatus     | UploadStatus                                | 否   |                | 檔案上傳狀態物件           |
| limitedMaxSize   | { width?: number, height?: number }         | 否   |                | 圖片最大尺寸限制           |
| limitedMinSize   | { width?: number, height?: number }         | 否   |                | 圖片最小尺寸限制           |
| limitedSize      | { width?: number, height?: number }         | 否   |                | 圖片固定尺寸限制           |
| onDrop           | (acceptedFiles: FileWithID<File>[]) => void | 否   |                | 檔案拖拽放置時的回調函數   |
| onDelete         | (file: FileWithID<File>) => void            | 否   |                | 刪除檔案時的回調函數       |
| onRetry          | (file: FileWithID<File>) => void            | 否   |                | 重試上傳時的回調函數       |
| onCancel         | (file: FileWithID<File>) => void            | 否   |                | 取消上傳時的回調函數       |
| onDisableAction  | () => void                                  | 否   |                | 禁用狀態下操作時的回調函數 |

### 型別定義

#### FileWithID<T>

```typescript
interface FileWithID<T> {
  id: string;
  item: T;
  timestamp: number;
}
```

#### UploadStatus

```typescript
interface UploadStatus {
  [id: string]: {
    progress: number;
    error?: boolean;
    uploadedUrl?: string;
  };
}
```

### 引入方式

```js
import { MultiUploader, type MultiUploaderProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<MultiUploader
  title="上傳圖片"
  accept={['.jpg', '.png', '.gif']}
  maxSize="5MB"
  maxFiles={10}
  limitedMaxSize={{ width: 1920, height: 1080 }}
  uploadStatus={uploadProgress}
  onDrop={files => handleFileDrop(files)}
  onDelete={file => handleFileDelete(file)}
  onRetry={file => handleFileRetry(file)}
/>
```

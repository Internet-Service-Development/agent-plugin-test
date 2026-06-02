# ImageUploader 組件

## ImageUploader

圖片上傳組件，提供拖拽上傳和點擊上傳功能，支援圖片預覽、格式驗證和自訂驗證器，適用於圖片上傳場景。

### 支援的 Props

| 名稱           | 型別                                                                      | 必填 | 預設值 | 用途                     |
| -------------- | ------------------------------------------------------------------------- | ---- | ------ | ------------------------ |
| className      | string                                                                    | 否   |        | 自訂 CSS 樣式類別        |
| accept         | ('jpeg' \| 'png' \| 'gif' \| 'svg+xml' \| 'webp')[]                       | 否   |        | 接受的圖片格式           |
| previewUrl     | string                                                                    | 否   |        | 預覽圖片的 URL           |
| validator      | (file: File, ratio: Ratio) => FileError \| null                           | 否   |        | 自訂檔案驗證器           |
| onDrop         | (acceptedFile: File, rejectFile: FileRejection, event: DropEvent) => void | 否   |        | 檔案拖拽放置時的回調函數 |
| onDropAccepted | (acceptedFile: File, event: DropEvent) => void                            | 否   |        | 檔案接受時的回調函數     |
| onDropRejected | (rejectedFile: FileRejection, event: DropEvent) => void                   | 否   |        | 檔案拒絕時的回調函數     |
| onDelete       | () => void                                                                | 否   |        | 刪除圖片時的回調函數     |
| minSize        | number                                                                    | 否   |        | 檔案最小尺寸限制         |
| maxSize        | number                                                                    | 否   |        | 檔案最大尺寸限制         |
| disabled       | boolean                                                                   | 否   |        | 是否禁用上傳功能         |

### 引入方式

```js
import { ImageUploader, type ImageUploaderProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<ImageUploader
  accept={['jpeg', 'png']}
  validator={(file, ratio) => {
    if (ratio.originalWidth > 500) return null;
    return { code: 'under size', message: 'width too small' };
  }}
  onDropAccepted={file => console.log('檔案上傳成功:', file)}
  onDropRejected={rejection => console.log('檔案上傳失敗:', rejection)}
/>
```

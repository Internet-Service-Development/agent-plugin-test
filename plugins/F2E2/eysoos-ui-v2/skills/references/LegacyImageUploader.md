# LegacyImageUploader 組件

## LegacyImageUploader

舊版圖片上傳組件，提供圖片和檔案上傳功能，支援多種檔案格式和尺寸限制，適用於圖片和文件上傳場景。

### 支援的 Props

| 名稱                | 型別                                    | 必填 | 預設值  | 用途                     |
| ------------------- | --------------------------------------- | ---- | ------- | ------------------------ |
| width               | string                                  | 否   | '100px' | 上傳區域的寬度           |
| height              | string                                  | 否   | '100px' | 上傳區域的高度           |
| showLimit           | boolean                                 | 否   | false   | 是否顯示限制資訊         |
| imageUrl            | string                                  | 否   |         | 已上傳的圖片 URL         |
| backgroundImageSize | CSSProperties['backgroundSize']         | 否   | 'cover' | 背景圖片的尺寸模式       |
| errorMessage        | string                                  | 否   |         | 錯誤訊息                 |
| disabled            | boolean                                 | 否   | false   | 是否禁用上傳功能         |
| viewable            | boolean                                 | 否   |         | 是否可預覽               |
| limitedWidth        | number                                  | 否   |         | 限制圖片寬度             |
| limitedHeight       | number                                  | 否   |         | 限制圖片高度             |
| limitedMaxWidth     | number                                  | 否   |         | 限制圖片最大寬度         |
| limitedMaxHeight    | number                                  | 否   |         | 限制圖片最大高度         |
| limitedMinWidth     | number                                  | 否   |         | 限制圖片最小寬度         |
| limitedMinHeight    | number                                  | 否   |         | 限制圖片最小高度         |
| limitedResolution   | string                                  | 否   |         | 限制圖片解析度           |
| limitedFileSize     | string                                  | 否   |         | 限制檔案大小             |
| limitedMinFileSize  | string                                  | 否   |         | 限制最小檔案大小         |
| limitedFormat       | string[]                                | 否   |         | 限制檔案格式             |
| recommendWidth      | number                                  | 否   |         | 建議圖片寬度             |
| recommendHeight     | number                                  | 否   |         | 建議圖片高度             |
| onExceedSizeLimit   | (reason?: string) => void               | 否   |         | 超出尺寸限制時的回調函數 |
| onViewableChange    | (viewable: boolean) => void             | 否   |         | 預覽狀態改變時的回調函數 |
| onEdit              | (file: File, fileName?: string) => void | 否   |         | 編輯檔案時的回調函數     |
| onDelete            | () => void                              | 否   |         | 刪除檔案時的回調函數     |

### 支援的檔案格式

- 圖片格式：jpg, png, gif, svg 等
- 文件格式：pdf, doc, docx, xls, xlsx, csv
- 影片格式：mp4

### 注意事項

- 此組件為舊版實作，建議使用新版的 ImageUploader 或 MultiUploader 組件
- 支援拖拽上傳功能
- 不同檔案類型會顯示對應的預覽圖示

### 引入方式

```js
import {
  LegacyImageUploader,
  type LegacyImageUploaderProps,
} from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<LegacyImageUploader
  width="200px"
  height="200px"
  showLimit={true}
  limitedMaxWidth={1920}
  limitedMaxHeight={1080}
  limitedFileSize="5MB"
  limitedFormat={['.jpg', '.png', '.pdf']}
  imageUrl={uploadedImageUrl}
  onEdit={(file, fileName) => handleFileUpload(file, fileName)}
  onDelete={() => handleFileDelete()}
  onExceedSizeLimit={reason => console.error(reason)}
/>
```

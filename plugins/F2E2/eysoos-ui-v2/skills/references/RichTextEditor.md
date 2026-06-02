# RichTextEditor 組件

## RichTextEditor

富文本編輯器組件，基於 TinyMCE 提供豐富的文字編輯功能，支援多種格式和自訂配置，適用於內容編輯場景。

### 支援的 Props

| 名稱        | 型別                                | 必填 | 預設值 | 用途                     |
| ----------- | ----------------------------------- | ---- | ------ | ------------------------ |
| className   | string                              | 否   |        | 自訂 CSS 樣式類別        |
| outlined    | boolean                             | 否   | false  | 是否顯示邊框樣式         |
| error       | boolean                             | 否   | false  | 是否顯示錯誤狀態         |
| EditorProps | Omit<IAllProps, 'tinymceScriptSrc'> | 否   |        | TinyMCE 編輯器的配置屬性 |

### EditorProps 常用屬性

| 名稱           | 型別                                      | 用途                 |
| -------------- | ----------------------------------------- | -------------------- |
| value          | string                                    | 編輯器的內容值       |
| onEditorChange | (content: string, editor: Editor) => void | 內容改變時的回調函數 |
| init           | object                                    | TinyMCE 的初始化配置 |
| plugins        | string[]                                  | 啟用的插件列表       |
| toolbar        | string                                    | 工具列配置           |

### 預設配置

- **插件**: lists, charmap, link, code
- **工具列**: undo redo, bold italic underline, fontsize blocks, alignleft aligncenter, numlist bullist, removeformat, charmap, link
- **高度**: 500px
- **字體**: Roboto, sans-serif

### 引入方式

```js
import { RichTextEditor, type RichTextEditorProps } from '@eysoos/prisma';
```

### 組件使用範例

```tsx
<RichTextEditor
  outlined={true}
  EditorProps={{
    value: content,
    onEditorChange: newContent => setContent(newContent),
    init: {
      height: 400,
      plugins: ['lists', 'link', 'image', 'code'],
      toolbar: 'undo redo | bold italic | alignleft aligncenter | link image',
    },
  }}
/>
```

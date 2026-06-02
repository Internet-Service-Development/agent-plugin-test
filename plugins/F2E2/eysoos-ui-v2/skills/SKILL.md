---
name: eysoos-ui-v2
description: "@eysoos/prisma 是 ASUS CMS 設計系統的 React UI 元件庫（第二代），提供豐富的 UI 組件用於建構 CMS 頁面。使用本技能時，請優先參考對應文件並沿用既有元件。"
metadata:
  author: asus-cms
  version: "1.0"
---

# @eysoos/prisma Skill

此技能提供 `@eysoos/prisma` UI 元件庫的元件索引與使用指南，方便在建置 CMS 頁面時快速查詢。

## 套件資訊

| 套件             | 用途                               | 入口文件                         |
| ---------------- | ---------------------------------- | -------------------------------- |
| `@eysoos/prisma` | ASUS 內部 React UI 組件庫 (第二代) | [ui-v2_intro.md](ui-v2_intro.md) |

## @eysoos/prisma 元件索引

| component               | description                                                                    | document file                                                          |
| ----------------------- | ------------------------------------------------------------------------------ | ---------------------------------------------------------------------- |
| `Accordion`             | 手風琴組件，用於顯示可展開和收合的內容區塊。                                   | [references/Accordion.md](references/Accordion.md)                     |
| `AlertBanner`           | 警告橫幅組件，用於顯示通知或警告訊息。                                         | [references/AlertBanner.md](references/AlertBanner.md)                 |
| `AIButton`              | AI 專用按鈕組件 (Button.AIButton)。                                            | [references/AIButton.md](references/AIButton.md)                       |
| `Avatar`                | 頭像組件，支援圖片、文字或預設圖示。                                           | [references/Avatar.md](references/Avatar.md)                           |
| `AuxiliaryButton`       | 輔助按鈕組件 (Button.AuxiliaryButton)。                                        | [references/Button.md](references/Button.md)                           |
| `AuxiliarySwitchButton` | 輔助切換按鈕組件 (Button.AuxiliarySwitch)。**Deprecated：請改用 `TabTools`。** | [references/Button.md](references/Button.md)                           |
| `Badge`                 | 徽章組件，用於顯示狀態指示或計數。                                             | [references/Badge.md](references/Badge.md)                             |
| `Breadcrumbs`           | 麵包屑導航組件。                                                               | [references/Breadcrumbs.md](references/Breadcrumbs.md)                 |
| `Button`                | 按鈕組件，支援多種樣式變體。                                                   | [references/Button.md](references/Button.md)                           |
| `Card`                  | 卡片容器組件。                                                                 | [references/Card.md](references/Card.md)                               |
| `Checkbox`              | 核取方塊組件。                                                                 | [references/Checkbox.md](references/Checkbox.md)                       |
| `CloseButton`           | 關閉按鈕組件。                                                                 | [references/closeButton.md](references/closeButton.md)                 |
| `ColorPicker`           | 顏色選擇器組件。                                                               | [references/colorPicker.md](references/colorPicker.md)                 |
| `Compact`               | 緊湊佈局組件。                                                                 | [references/compact.md](references/compact.md)                         |
| `ComplexTable`          | 複雜表格組件。                                                                 | [references/complexTable.md](references/complexTable.md)               |
| `ControlLabel`          | 控制項標籤組件。                                                               | [references/ControlLabel.md](references/ControlLabel.md)               |
| `DataTab`               | 資料標籤組件。                                                                 | [references/DataTab.md](references/DataTab.md)                         |
| `DatePicker`            | 日期選擇器組件。                                                               | [references/DatePicker.md](references/DatePicker.md)                   |
| `Dialog`                | 對話框組件。                                                                   | [references/Dialog.md](references/Dialog.md)                           |
| `Divider`               | 分隔線組件。                                                                   | [references/Divider.md](references/Divider.md)                         |
| `DraggableCardList`     | 可拖拽卡片列表組件。                                                           | [references/DraggableCardList.md](references/DraggableCardList.md)     |
| `DraggableList`         | 可拖拽列表組件。                                                               | [references/DraggableList.md](references/DraggableList.md)             |
| `Drawer`                | 抽屜組件。                                                                     | [references/Drawer.md](references/Drawer.md)                           |
| `Field`                 | 欄位容器組件。                                                                 | [references/Field.md](references/Field.md)                             |
| `FloatingButton`        | 浮動按鈕組件。                                                                 | [references/FloatingButton.md](references/FloatingButton.md)           |
| `FloatingTextField`     | 浮動文字欄位組件。                                                             | [references/FloatingTextField.md](references/FloatingTextField.md)     |
| `FullScreenBar`         | 全螢幕編輯器頂部導航列組件。                                                   | [references/FullScreenBar.md](references/FullScreenBar.md)             |
| `HelperText`            | 輔助文字組件。                                                                 | [references/HelperText.md](references/HelperText.md)                   |
| `IconButton`            | 圖示按鈕組件。                                                                 | [references/IconButton.md](references/IconButton.md)                   |
| `ImageUploader`         | 圖片上傳組件。                                                                 | [references/ImageUploader.md](references/ImageUploader.md)             |
| `Input`                 | 輸入框組件。                                                                   | [references/Input.md](references/Input.md)                             |
| `Label`                 | 標籤組件。                                                                     | [references/Label.md](references/Label.md)                             |
| `Layout`                | 版面佈局組件。                                                                 | [references/Layout.md](references/Layout.md)                           |
| `LegacyImageUploader`   | 舊版圖片上傳組件。                                                             | [references/LegacyImageUploader.md](references/LegacyImageUploader.md) |
| `Loading`               | 載入指示器。                                                                   | [references/Loading.md](references/Loading.md)                         |
| `LoadingOverlay`        | 載入覆蓋層。                                                                   | [references/LoadingOverlay.md](references/LoadingOverlay.md)           |
| `MultiSelect`           | 多選下拉選單組件。                                                             | [references/MultiSelect.md](references/MultiSelect.md)                 |
| `MultiUploader`         | 多檔案上傳組件。                                                               | [references/MultiUploader.md](references/MultiUploader.md)             |
| `NestedDropDownMenu`    | 巢狀下拉選單組件。                                                             | [references/NestedDropDownMenu.md](references/NestedDropDownMenu.md)   |
| `NonModalPopover`       | 非模態彈出框組件。                                                             | [references/NonModalPopover.md](references/NonModalPopover.md)         |
| `NoResult`              | 無結果顯示組件。                                                               | [references/NoResult.md](references/NoResult.md)                       |
| `OptionGroup`           | 選項群組組件。                                                                 | [references/OptionGroup.md](references/OptionGroup.md)                 |
| `PageCountSelector`     | 每頁數量選擇器。                                                               | [references/PageCountSelector.md](references/PageCountSelector.md)     |
| `Pagination`            | 分頁組件。                                                                     | [references/Pagination.md](references/Pagination.md)                   |
| `Popover`               | 彈出框組件。                                                                   | [references/Popover.md](references/Popover.md)                         |
| `Progress`              | 進度條組件。                                                                   | [references/Progress.md](references/Progress.md)                       |
| `Radio`                 | 單選按鈕組件。                                                                 | [references/Radio.md](references/Radio.md)                             |
| `RangePicker`           | 日期範圍選擇器。                                                               | [references/RangePicker.md](references/RangePicker.md)                 |
| `RichTextEditor`        | 富文本編輯器組件。                                                             | [references/RichTextEditor.md](references/RichTextEditor.md)           |
| `ScrollArea`            | 滾動區域組件。                                                                 | [references/ScrollArea.md](references/ScrollArea.md)                   |
| `SearchInput`           | 搜尋輸入框組件。                                                               | [references/SearchInput.md](references/SearchInput.md)                 |
| `Select`                | 下拉選單組件。                                                                 | [references/Select.md](references/Select.md)                           |
| `Status`                | 狀態指示組件。                                                                 | [references/Status.md](references/Status.md)                           |
| `Stepper`               | 步驟器組件。                                                                   | [references/Stepper.md](references/Stepper.md)                         |
| `Switch`                | 開關切換組件。                                                                 | [references/Switch.md](references/Switch.md)                           |
| `TabTools`              | 分頁工具切換按鈕群組（可作為 AuxiliarySwitchButton 的替代方案）。              | [references/Button.md](references/Button.md)                           |
| `Tabs`                  | 標籤頁組件。                                                                   | [references/Tabs.md](references/Tabs.md)                               |
| `Table`                 | 表格組件。                                                                     | [references/Table.md](references/Table.md)                             |
| `TableEysoos`           | 進階表格樣式 (Eysoos)。**Deprecated：請改用 `Table`。**                        | [references/TableEysoos.md](references/TableEysoos.md)                 |
| `TableTagPicker`        | 供表格使用的標籤篩選/選擇組件。                                                | [references/TableTagPicker.md](references/TableTagPicker.md)           |
| `Tag`                   | 標籤組件。                                                                     | [references/Tag.md](references/Tag.md)                                 |
| `TagPicker`             | 標籤選擇器。                                                                   | [references/TagPicker.md](references/TagPicker.md)                     |
| `Textarea`              | 多行文字輸入組件。                                                             | [references/Textarea.md](references/Textarea.md)                       |
| `TextLink`              | 文字連結組件。                                                                 | [references/TextLink.md](references/TextLink.md)                       |
| `ThemeProvider`         | 主題提供者組件。                                                               | [references/ThemeProvider.md](references/ThemeProvider.md)             |
| `TimePicker`            | 時間選擇器。                                                                   | [references/TimePicker.md](references/TimePicker.md)                   |
| `Toast`                 | 吐司通知組件。                                                                 | [references/Toast.md](references/Toast.md)                             |
| `Tooltip`               | 提示框組件。                                                                   | [references/Tooltip.md](references/Tooltip.md)                         |
| `TransferList`          | 穿梭框組件。                                                                   | [references/TransferList.md](references/TransferList.md)               |
| `TreeStructure`         | 樹狀結構組件。                                                                 | [references/TreeStructure.md](references/TreeStructure.md)             |
| `TreeStructureTable`    | 樹狀結構表格組件。                                                             | [references/TreeStructureTable.md](references/TreeStructureTable.md)   |
| `Typography`            | 排版組件。                                                                     | [references/Typography.md](references/Typography.md)                   |

## 近期變更備註 (ui-v2/feature/2443)

- 移除 `react-router-dom` peer dependency，TreeStructure/TreeStructureTable 不再使用 `LinkProps`。
- TreeStructure/TreeStructureTable 的 `AddButton` 與 TreeStructure 的 `IconButton` 改以 `render?: (children) => ReactNode` 注入自訂連結/包裝；如需 `<a>`，請用 `anchor`。
- `render` 內容會在內部用 `id` 作為 key 包在 Fragment 內，請確保每個 AddButton/IconButton 的 `id` 唯一。

## 常用型別定義

### TableColumnsTypeI（Table 欄位定義）

```ts
import { TableColumnsTypeI } from "@eysoos/prisma";
```

| 屬性      | 型別                                    | 說明                            |
| --------- | --------------------------------------- | ------------------------------- |
| key       | string                                  | 欄位的唯一識別碼                |
| name      | ReactNode                               | 欄位標題                        |
| span      | number                                  | 欄位跨度                        |
| render    | (param: any, item: any) => ReactElement | 自訂渲染函數                    |
| onSort    | () => void                              | 排序回調函數                    |
| direction | 'asc' \| 'desc'                         | 排序方向                        |
| align     | CSSProperties['textAlign']              | 對齊方式                        |
| tooltip   | ReactNode                               | 欄位提示文字                    |
| width     | string \| number                        | 欄位寬度                        |
| minWidth  | number                                  | 最小寬度                        |
| mask      | boolean                                 | 是否遮罩資料                    |
| isAction  | boolean                                 | 是否為操作欄（支援凍結 action） |

#### 使用範例

```tsx
const columns: TableColumnsTypeI[] = [
  { key: "name", name: "姓名", align: "left", width: "40%" },
  { key: "age", name: "年齡", align: "center", width: "20%" },
  {
    key: "status",
    name: "狀態",
    render: (value) => <Status variant={value}>{value}</Status>,
  },
  {
    key: "action",
    name: "操作",
    isAction: true,
    render: (_, item) => <Button onClick={() => handleEdit(item)}>編輯</Button>,
  },
];
```

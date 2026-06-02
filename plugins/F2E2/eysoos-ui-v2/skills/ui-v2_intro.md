# @eysoos/prisma

## 📦 套件資訊

**版本**: 0.17.1  
**套件名稱**: `@eysoos/prisma`  
**描述**: ASUS 內部使用的 React UI 組件庫 (第二代)

## 🎯 概述

`@eysoos/prisma` 是專為 ASUS 內部系統設計的現代化 React UI 組件庫，提供超過 60 個精心設計的組件。這是第二代 UI 組件庫，採用最新的設計系統和技術架構，為 ASUS 的各個內部平台提供一致且優質的用戶體驗。

## ✨ 特性

- **豐富的組件庫**: 60+ 個精心設計的 UI 組件
- **現代化技術棧**: 基於 React 18、TypeScript、Radix UI
- **主題系統**: 支援深色模式與自訂主題
- **樣式方案**: 使用 class-variance-authority 實現靈活的樣式變體
- **拖拽功能**: 集成 @hello-pangea/dnd 支援拖拽操作
- **豐富編輯器**: 內建 TinyMCE 富文本編輯器
- **動畫效果**: 使用 motion 庫提供流暢動畫
- **完整文檔**: 集成 Storybook 提供互動式組件文檔
- **狀態管理**: 內建 Zustand 和 Immer 支援

## 📦 安裝

```bash
npm install @eysoos/prisma
# 或
yarn add @eysoos/prisma
```

## 🔧 技術規格

### 核心依賴

```json
{
  "@eysoos/icons": "^1.5.0",
  "@hello-pangea/dnd": "^16.5.0",
  "@mui/material": "^5.8.2",
  "@radix-ui/react-dialog": "^1.1.4",
  "@radix-ui/react-scroll-area": "^0.1.4",
  "@radix-ui/react-tooltip": "^1.1.8",
  "@tinymce/tinymce-react": "^4.3.0",
  "antd": "^5.6.2",
  "dayjs": "^1.11.1",
  "class-variance-authority": "^0.7.0",
  "motion": "^12.15.0",
  "zustand": "^4.4.1"
}
```

### Peer Dependencies

```json
{
  "react": "^18.1.0",
  "react-dom": "^18.1.0",
  "react-router-dom": "^6.3.0",
  "@emotion/react": "^11.9.3",
  "@emotion/styled": "^11.9.3"
}
```

### 發布配置

- **Registry**: https://npm.pkg.github.com/
- **Access**: restricted

## 🧩 組件分類

### 1. **基礎輸入組件** (Form Components)

#### 文字輸入

- `Input` - 基礎輸入框
- `Textarea` - 多行文字輸入
- `FloatingTextField` - 浮動標籤文字輸入框
- `SearchInput` - 搜尋輸入框
- `RichTextEditor` - 富文本編輯器 (TinyMCE)

#### 選擇器

- `Select` - 下拉選單
- `MultiSelect` - 多選下拉選單
- `Radio` - 單選按鈕
- `Checkbox` - 複選框
- `Switch` - 開關切換
- `TagPicker` - 標籤選擇器
- `TableTagPicker` - 表格內標籤選擇器
- `ColorPicker` - 顏色選擇器

#### 日期時間

- `DatePicker` - 日期選擇器
- `RangePicker` - 日期範圍選擇器
- `TimePicker` - 時間選擇器

#### 檔案上傳

- `ImageUploader` - 圖片上傳器
- `MultiUploader` - 多檔案上傳器
- `LegacyImageUploader` - 舊版圖片上傳器 (遷移用)

### 2. **按鈕與互動組件** (Buttons & Actions)

- `Button` - 基礎按鈕（支援 extraLarge 尺寸）
- `AIButton` - AI 功能按鈕（漸層樣式，支援 loading 狀態）
- `AuxiliaryButton` - 輔助按鈕（支援選中狀態）
- `AuxiliarySwitchButton` - 輔助切換按鈕（左右切換模式）
- `IconButton` - 圖標按鈕
- `CloseButton` - 關閉按鈕
- `FloatingButton` - 浮動按鈕

### 3. **資料展示組件** (Data Display)

#### 表格

- `Table` - 基礎表格
- `ComplexTableData` - 複雜表格
- `ExcelTable` - Excel 風格表格
- `TreeStructureTable` - 樹狀結構表格

#### 列表與卡片

- `Card` - 卡片組件
- `DraggableList` - 可拖拽列表
- `DraggableCardList` - 可拖拽卡片列表
- `TransferList` - 穿梭框
- `TreeStructure` - 樹狀結構

#### 標籤與徽章

- `Tag` - 標籤
- `Badge` - 徽章
- `Avatar` - 頭像
- `Status` - 狀態指示器

#### 其他展示

- `Accordion` - 折疊面板
- `Tabs` - 分頁標籤
- `DataTab` - 資料分頁
- `Typography` - 文字排版
- `NoResult` - 無結果顯示

### 4. **導航組件** (Navigation)

- `Breadcrumbs` - 麵包屑導航
- `Pagination` - 分頁器
- `PageCountSelector` - 每頁數量選擇器
- `Stepper` - 步驟條
- `NestedDropDownMenu` - 巢狀下拉選單

### 5. **反饋組件** (Feedback)

- `Dialog` - 對話框
- `Drawer` - 抽屜
- `Popover` - 彈出框
- `NonModalPopover` - 非模態彈出框
- `Tooltip` - 提示框
- `Toast` / `ToastContainer` - 吐司通知
- `AlertBanner` - 警告橫幅
- `Loading` - 載入指示器
- `LoadingOverlay` - 載入遮罩
- `Progress` - 進度條
- `TableProgress` - 表格進度條

### 6. **佈局組件** (Layout)

- `Layout` - 佈局組件
- `Divider` - 分隔線
- `ScrollArea` - 滾動區域
- `Compact` - 緊湊佈局
- `FullScreenBar` - 全螢幕列（支援返回、儲存、預覽、發佈等操作）

### 7. **表單輔助組件** (Form Helpers)

- `Field` - 表單欄位容器
- `Label` - 標籤
- `ControlLabel` - 控制項標籤
- `HelperText` - 輔助文字
- `OptionGroup` - 選項組

### 8. **主題系統** (Theme)

- `ThemeProvider` - 主題提供者
- `HoistThemeProvider` - 提升主題提供者

## 💻 使用方式

### 基本用法

```tsx
import { Button, Input, Dialog, Table } from '@eysoos/prisma';

function MyComponent() {
  return (
    <div>
      <Button variant="contained" size="medium">
        點擊我
      </Button>
      <Input placeholder="請輸入內容" />
    </div>
  );
}
```

### 使用主題提供者

```tsx
import { ThemeProvider, Button } from '@eysoos/prisma';

function App() {
  return (
    <ThemeProvider theme="dark">
      <Button>深色主題按鈕</Button>
    </ThemeProvider>
  );
}
```

### AI 功能按鈕範例

```tsx
import { Button } from '@eysoos/prisma';
import { useState } from 'react';

function AIGeneratorExample() {
  const [loading, setLoading] = useState(false);

  const handleGenerate = async () => {
    setLoading(true);
    // AI 生成邏輯
    await generateContent();
    setLoading(false);
  };

  return (
    <Button.AIButton loading={loading} onClick={handleGenerate}>
      AI 生成內容
    </Button.AIButton>
  );
}
```

### 全螢幕編輯列範例

```tsx
import { FullScreenBar } from '@eysoos/prisma';

function EditorPage() {
  return (
    <FullScreenBar
      title="文章編輯"
      subTitle="草稿"
      backTitle="返回"
      onBackButtonClicked={() => navigate(-1)}
      onSaveButtonClicked={() => handleSave()}
      onPreviewButtonClicked={() => handlePreview()}
      onPublishButtonClicked={() => handlePublish()}
    />
  );
}
```

### 表單組件範例

```tsx
import {
  Field,
  Input,
  Select,
  Checkbox,
  DatePicker,
  Button,
} from '@eysoos/prisma';

function FormExample() {
  return (
    <form>
      <Field label="用戶名稱">
        <Input placeholder="請輸入用戶名稱" />
      </Field>

      <Field label="部門">
        <Select
          options={[
            { value: '1', label: '研發部' },
            { value: '2', label: '設計部' },
          ]}
        />
      </Field>

      <Field label="入職日期">
        <DatePicker />
      </Field>

      <Checkbox>我同意服務條款</Checkbox>

      <Button type="submit" variant="contained">
        提交
      </Button>
    </form>
  );
}
```

### 表格組件範例

```tsx
import { Table } from '@eysoos/prisma';

function TableExample() {
  const columns = [
    { key: 'name', title: '姓名' },
    { key: 'age', title: '年齡' },
    { key: 'department', title: '部門' },
  ];

  const data = [
    { name: '張三', age: 28, department: '研發部' },
    { name: '李四', age: 32, department: '設計部' },
  ];

  return <Table columns={columns} data={data} />;
}
```

### 拖拽列表範例

```tsx
import { DraggableList } from '@eysoos/prisma';

function DragExample() {
  const [items, setItems] = useState([
    { id: '1', content: '項目 1' },
    { id: '2', content: '項目 2' },
    { id: '3', content: '項目 3' },
  ]);

  return <DraggableList items={items} onReorder={setItems} />;
}
```

### 對話框範例

```tsx
import { Dialog, Button } from '@eysoos/prisma';
import { useState } from 'react';

function DialogExample() {
  const [open, setOpen] = useState(false);

  return (
    <>
      <Button onClick={() => setOpen(true)}>打開對話框</Button>

      <Dialog open={open} onClose={() => setOpen(false)} title="提示">
        這是對話框內容
      </Dialog>
    </>
  );
}
```

## 🎨 樣式系統

### 主題支援

組件庫支援兩種內建主題:

- **Default Theme** (預設主題)
- **Dark Theme** (深色主題)

主題檔案位置:

- `style/themes/defaultTheme.scss`
- `style/themes/darkTheme.scss`

### CVA (Class Variance Authority)

使用 CVA 管理組件變體，提供類型安全的樣式變體系統。

範例: Button 組件的變體定義

```tsx
const buttonVariant = cva('base-button', {
  variants: {
    variant: {
      contained: 'button-contained',
      outlined: 'button-outlined',
      text: 'button-text',
    },
    size: {
      small: 'button-small',
      medium: 'button-medium',
      large: 'button-large',
    },
  },
});
```

## 📚 Storybook 文檔

本組件庫集成了 Storybook，提供互動式組件文檔。

### 啟動 Storybook

```bash
nx storybook shared-ui-v2
```

Storybook 配置位於 `.storybook` 目錄:

- `main.js` - 主要配置
- `preview.tsx` - 預覽配置
- `manager-head.html` - 管理器 HTML
- `storybookGlobal.scss` - 全域樣式

## 🧪 測試

### 執行單元測試

```bash
nx test shared-ui-v2
```

測試框架: [Jest](https://jestjs.io)  
測試配置: `jest.config.ts`  
測試設定: `jest.setup.ts`

## 📝 更新日誌

### 最新版本 v0.17.0 (2026-02-13)

**新增功能**:

- 新增活動頁面組件
- RichTextEditor 自動添加 `noopener noreferrer` 到連結
- 支援 RichTextEditor 的 `fullWidth` 屬性
- 更新多選與複雜表格功能
- 新增 extra large 尺寸支援

**Bug 修復**:

- 修復深色模式相關問題
- 修復 DatePicker 的 fullWidth 問題
- 修復表格 resizer 高度問題
- 修復複製貼上相關 bug
- 優化多個組件的樣式和行為

### v0.16.0 (2026-01-12)

**新增功能**:

- 新增模板功能
- 更新組件名稱規範
- 多項組件優化

### v0.15.0 (2025-12-26)

**新增功能**:

- TableData 新增凍結 action 功能
- 新增 displayToast 的 style 參數
- 支援 TableHoverData 的最大顯示數量設定
- Tag picker 高度延展支援

**Bug 修復**:

- 修復 lazy load 相關問題
- 調整表格 hover data 寬度
- 優化 tag 顯示邏輯

## 🔧 組件架構

### 標準組件結構

```
component/
├── Component.tsx          # 主組件
├── componentCVA.ts       # CVA 樣式變體定義
├── component.scss        # 組件樣式
├── Component.test.tsx    # 單元測試
├── Component.stories.tsx # Storybook 故事
├── index.ts             # 導出文件
└── types.ts             # TypeScript 類型定義
```

### 組件設計原則

1. **類型安全**: 所有組件都使用 TypeScript 編寫
2. **可訪問性**: 使用 Radix UI 確保無障礙訪問
3. **可自訂**: 支援 className 和 style props
4. **響應式**: 組件設計考慮各種螢幕尺寸
5. **主題友好**: 所有組件支援主題切換

## 🛠️ 開發指南

### 新增組件

1. 在 `src/lib/` 目錄下創建新組件資料夾
2. 創建組件相關文件 (tsx, scss, test, stories)
3. 在 `src/index.ts` 中導出組件
4. 編寫 Storybook 故事
5. 編寫單元測試

### 樣式開發

- 使用 SCSS 編寫組件樣式
- 遵循 BEM 命名規範
- 使用主題變數確保主題一致性
- 支援深色模式變體

### 建構配置

本專案使用多種建構配置:

- `vite.config.ts` - Vite 主配置
- `vite.config.umd.ts` - UMD 格式建構
- `tsconfig.lib.json` - TypeScript 庫配置
- `tsconfig.storybook.json` - Storybook TypeScript 配置

## 🔄 從 v1 遷移

### 遷移輔助組件

為了幫助從 v1 遷移到 v2,提供了以下遺留組件:

- `LegacyImageUploader` - 保持與 v1 圖片上傳器的相容性

### 遷移建議

1. 逐步替換組件,不要一次性全部遷移
2. 使用 Storybook 預覽新組件行為
3. 仔細測試表單和互動功能
4. 注意 API 差異,特別是 props 命名

## 📋 組件總覽

本套件目前包含 **60+ 個組件**，涵蓋以下類別:

- ✅ 表單輸入組件 (20+)
- 🎯 按鈕與互動組件 (4+)
- 📊 資料展示組件 (15+)
- 🧭 導航組件 (6+)
- 💬 反饋組件 (12+)
- 📐 佈局組件 (5+)
- 🔧 表單輔助組件 (5+)
- 🎨 主題系統 (2)

## 🌟 核心特色

### 1. 完整的表單解決方案

提供從基礎輸入到複雜表單的完整組件支援,包括驗證、錯誤處理、輔助文字等。

### 2. 強大的表格系統

支援基礎表格、複雜表格、Excel 風格表格、樹狀表格等多種表格形式,滿足各種資料展示需求。

### 3. 拖拽功能

集成 @hello-pangea/dnd,提供流暢的拖拽體驗,支援列表和卡片拖拽。

### 4. 主題系統

完整的主題系統支援,包括深色模式,可輕鬆自訂品牌色彩。

### 5. 現代化技術

使用最新的 React 18 特性、Radix UI 基礎組件、motion 動畫庫等現代化技術。

## 📄 授權

本套件為 ASUS 內部使用,訪問權限受限。

## 🔗 相關連結

- **Repository**: https://bpza001git.corpnet.asus/eysoos/cosmos
- **Storybook**: 本地啟動查看互動式文檔
- **Issues**: 請在 Cosmos 專案中回報問題
- **相關套件**: `@eysoos/icons` (圖標庫)

## 🏗️ 專案配置

### 建構工具

- **Nx**: Monorepo 管理工具
- **Vite**: 快速的建構工具
- **TypeScript**: 類型系統
- **SCSS**: CSS 預處理器

### 程式碼品質

- **ESLint**: 程式碼檢查 (`.eslintrc.json`)
- **Babel**: JavaScript 編譯器 (`.babelrc`)
- **Jest**: 測試框架

### 配置文件

- `nx.json` - Nx 配置
- `project.json` - 專案配置
- `tsconfig.json` - TypeScript 配置
- `vite.config.ts` - Vite 配置

---

**維護團隊**: Eysoos Team @ ASUS  
**最後更新**: 2026-03-25

# Skills 依賴目錄與 UI 元件快速參考

此文件為唯讀參考，整合了本 skill 所依賴的外部 skills 與常用元件清單。
執行規則請回到對應的 playbook，不在此文件中定義。

## 依賴 Skills 清單

| 優先級      | Skill 名稱                       | 用途                 | 在本 Skill 中的應用                                              |
| ----------- | -------------------------------- | -------------------- | ---------------------------------------------------------------- |
| 🔴 必須     | `AGENTS.md`                      | 全局 AI Agent 編碼規範 | UI 元件庫使用限制、第三方庫禁用規則                              |
| 🔴 必須     | `eysoos-utils`                   | 工具函式庫、佈局元件 | FormTemplate、ValidationInputField、WrappedComponentUtilityProps |
| 🔴 必須     | `eysoos-ui-v2`（@eysoos/prisma） | UI 元件庫            | 常用元件快速參考、元件選型決策                                   |
| 🟡 強烈推薦 | `eysoos-icons`（@eysoos/icons）  | 圖標庫               | 圖標使用規則、禁止自定義 SVG                                     |
| 🟡 強烈推薦 | `sidebar`                        | Sidebar/導航欄實作   | TopBar 實作、Shell 元件、導航結構模式                            |

## UI 元件快速參考（來自 @eysoos/prisma）

### 表單元件

| 元件           | 用途                                |
| -------------- | ----------------------------------- |
| `Input`        | 基本輸入框                          |
| `Select`       | 下拉選單                            |
| `MultiSelect`  | 多選下拉選單                        |
| `Checkbox`     | 核取方塊                            |
| `Radio`        | 單選按鈕                            |
| `Switch`       | 開關切換（必須搭配 `ControlLabel`） |
| `ControlLabel` | 控制項標籤（用於包裹 Switch）       |
| `DatePicker`   | 日期選擇器                          |
| `RangePicker`  | 日期範圍選擇器                      |
| `ColorPicker`  | 顏色選擇器                          |

### 容器與佈局元件

| 元件        | 用途                    |
| ----------- | ----------------------- |
| `Card`      | 卡片容器                |
| `Field`     | 欄位容器                |
| `Tabs`      | 標籤頁                  |
| `Dialog`    | 對話框                  |
| `Drawer`    | 抽屜元件                |
| `Accordion` | 手風琴元件（展開/收合） |

### 操作元件

| 元件         | 用途                 |
| ------------ | -------------------- |
| `Button`     | 按鈕（支援多種樣式） |
| `TextLink`   | 文字連結             |
| `IconButton` | 圖示按鈕             |

### 文字元件

| 元件                 | 用途          | 說明                            |
| -------------------- | ------------- | ------------------------------- |
| `Typography`         | 正文文本      | Line-height: 150%，用於一般內容 |
| `Typography.Heading` | 標題/卡片標題 | Line-height: 125%，用於標題層級 |
| `Label`              | 標籤文本      | 用於表單欄位標籤                |

## 工具函式快速參考（來自 @eysoos/utils）

### 核心工具

| 工具                           | 用途                                        |
| ------------------------------ | ------------------------------------------- |
| `cloneDeep`                    | 深複製物件（狀態更新時複製巢狀資料）        |
| `set`                          | 巢狀物件賦值（搭配 cloneDeep 更新巢狀欄位） |
| `FormTemplate`                 | 頁面包裝 HOC（**必須來自 @eysoos/utils**）  |
| `WrappedComponentUtilityProps` | 元件 Props 型別                             |
| `ValidationInputField`         | 驗證輸入框                                  |
| `ValidationSelectField`        | 驗證下拉選單                                |
| `ValidationTextareaField`      | 驗證多行輸入框                              |
| `Content`                      | 內容佈局元件                                |

### 佈局常數

| 常數                | 用途                         |
| ------------------- | ---------------------------- |
| `basicComponentGap` | 基本元件間距（通常 8-16px）  |
| `largeComponentGap` | 大型元件間距（通常 24-32px） |

### 其他工具

| 工具                  | 用途                        |
| --------------------- | --------------------------- |
| `urlCheckRegex`       | URL 格式驗證                |
| `toggleStatusMachine` | 狀態切換邏輯（XState 機器） |
| `toggleStatusEvent`   | 狀態切換事件                |

## 常用圖標（來自 @eysoos/icons）

| 圖標名稱       | 用途        | 使用場景           |
| -------------- | ----------- | ------------------ |
| `PreviousIcon` | 返回/上一步 | TopBar 返回按鈕    |
| `NextIcon`     | 下一步/展開 | 步驟導航、展開操作 |
| `MobileIcon`   | 行動裝置    | 裝置切換、預覽     |
| `PcIcon`       | 電腦/桌面   | 裝置切換、預覽     |

其他圖標請參考 `.agents/skills/eysoos-icons/SKILL.md`。

## 外部 Skill 文件位置

| Skill        | 文件路徑                               |
| ------------ | -------------------------------------- |
| eysoos-ui-v2 | `.agents/skills/eysoos-ui-v2/SKILL.md` |
| eysoos-icons | `.agents/skills/eysoos-icons/SKILL.md` |
| eysoos-utils | `.agents/skills/eysoos-utils/SKILL.md` |
| sidebar      | `.agents/skills/sidebar/SKILL.md`      |

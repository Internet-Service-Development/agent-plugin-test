# 原始文件段落對映表（長文件 → 模組化 Skill）

此文件將原始長文件的各章節對應到模組化 skill 的各檔案位置。
原始文件：`C:/Users/andycy_hsieh/Desktop/SKILL.md`

## 對映說明

- Keep（保留）：已涵蓋於目前的模組檔案
- Split（拆分）：已涵蓋，但分散於多份檔案
- Add（待新增）：尚未完整涵蓋；建議下次設代新增 playbook 或 reference

## 段落對映表

| 原始段落（行號）                        | 目標檔案                                                             | 動作  | 說明                                |
| --------------------------------------- | -------------------------------------------------------------------- | ----- | ----------------------------------- |
| `## 概述` (13)                          | `SKILL.md`                                                           | Keep  | 路由層目的與用法已保留              |
| `## 專案目錄結構` (22)                  | `SKILL.md`、`playbooks/page-scaffold.md`                             | Split | 高層結構在入口，實作提示在 scaffold |
| `## 命名和資料夾結構` (36)              | `playbooks/page-scaffold.md`、`playbooks/api-and-interface.md`       | Split | 命名依責任拆分                      |
| `## Global 和 Local 站點` (47)          | `playbooks/global-local.md`                                          | Keep  | 核心邏輯已保留                      |
| `## 規格文件 (FSD) 優先級規則` (80)     | `playbooks/figma-fsd-mapping.md`                                     | Keep  | 優先級規則已保留                    |
| `## 規格文件 (FSD) 解讀` (107)          | `playbooks/figma-fsd-mapping.md`                                     | Keep  | 衝突詮釋已涵蓋                      |
| `## Figma 設計對應` (127)               | `playbooks/figma-fsd-mapping.md`、`playbooks/global-local.md`        | Split | 地區對應 + 設計詮釋                 |
| `## Switch 與 Label 組合規則` (158)     | `playbooks/ui-and-icons-guardrails.md`                               | Keep  | ControlLabel + Switch 規則已保留    |
| `## 頁面實現的標準模式` (196)           | `playbooks/page-scaffold.md`                                         | Keep  | forwardRef/FormTemplate 模式已保留  |
| `#### 1. 導入規則` (269)                | `playbooks/page-scaffold.md`、`playbooks/ui-and-icons-guardrails.md` | Split | 匯入來源與 UI 套件限制              |
| `#### 1.1 Typography 使用規則` (280)    | `playbooks/ui-and-icons-guardrails.md`                               | Keep  | 規則已保留，可待擴充範例            |
| `#### 2. 狀態管理模式` (305)            | `playbooks/page-scaffold.md`                                         | Keep  | cloneDeep + set 與雙重狀態已保留    |
| `#### 3. initialDataHandler 實現` (311) | `playbooks/page-scaffold.md`                                         | Keep  | 明確的反模式已保留                  |
| `#### 4. 全局/本地條件渲染` (327)       | `playbooks/global-local.md`                                          | Keep  | isGlobal 模式已保留                 |
| `#### 5. Switch 與 Label` (342)         | `playbooks/ui-and-icons-guardrails.md`                               | Keep  | 明確保留                            |
| `## Figma 設計分析與頁面模式選擇` (379) | `playbooks/page-mode-selection.md`                                   | Keep  | 已建立專屬 playbook                 |
| `### TopBar 使用規則` (428)             | `playbooks/page-mode-selection.md`                                   | Keep  | 已包含於頁面模式 playbook           |
| `### 表格組件選擇規則` (470)            | `playbooks/table-decision-matrix.md`                                 | Keep  | 已建立專屬 playbook                 |
| `### 同專案結構參考清單` (489)          | `SKILL.md`、`checklists/done-checklist.md`                           | Split | 流程與完成檢查已分佈                |
| `## 工作流程` (583)                     | `SKILL.md`                                                           | Keep  | 路由工作流程已保留                  |
| `### 常見陷阱` (631)                    | 各 playbook 的常見錯誤                                               | Split | 依領域拆分常見錯誤                  |
| `## 範例` (642)                         | `playbooks/*`                                                        | Split | 轉化為各 playbook 的最小範例        |
| `## 整合的 Skills 與規範` (733)         | `references/skills-catalog.md`                                       | Keep  | 已建立專屬目錄                      |
| `### 🔧 工具函式與 Hooks` (824)         | `playbooks/page-scaffold.md`、`playbooks/validation.md`              | Split | 工具用法依情境拆分                  |
| `#### 表單驗證規則` (859)               | `playbooks/validation.md`                                            | Keep  | Schema/name/formikInit 規則已保留   |
| `### 🎯 圖標使用規則` (963)             | `playbooks/ui-and-icons-guardrails.md`                               | Keep  | @eysoos/icons-only 規則已保留       |
| `### 📱 導航列實現` (988)               | `playbooks/ui-and-icons-guardrails.md`                               | Keep  | TopBar/Shell 指引已保留             |
| `## 相關資源` (1038)                    | `references/*`                                                       | Split | 資源與遷移筆記已分散存放            |

## 待补充的缺口（已建立）

1. `playbooks/page-mode-selection.md` — 頁面模式判斷（模式 A / 模式 B）
2. `playbooks/table-decision-matrix.md` — 表格元件選型決策矩陣
3. `references/skills-catalog.md` — 依賴 skills 目錄與 UI 元件快速參考

## 維護原則

更新規則時，依照以下順序奧先擹考：

1. 變更屬於局部領域：只修改相關 playbook
2. 變更屬於全局限制：修改 `SKILL.md`
3. 變更屬於說明性內容：修改 `references/`（不應包含可執行規則）

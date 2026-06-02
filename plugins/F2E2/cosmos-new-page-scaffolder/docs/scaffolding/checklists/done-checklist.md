# 完成檢查清單

在確認 Cosmos 頁面任務完成前，依照下列清單逐項確認。

使用方式：

- 本清單是 Review 階段的**路由表**，不重複 playbook 規則
- 依本次實作觸及的面向，只讀對應 playbook 的 **必須（Must）** 區塊
- 如發現違規（violations），先修正再回報
- 若無法即時修正，需在回報中標記 `Known tech debt` 與影響範圍

## 依觸及面向驗收（Scoped Review）

| 觸及面向                      | 驗收 playbook                                                                                         |
| ----------------------------- | ----------------------------------------------------------------------------------------------------- |
| 頁面路由                      | [router-conventions.md](../playbooks/router-conventions.md)                                           |
| UI 元件 / Icon                | [ui-and-icons-guardrails.md](../playbooks/ui-and-icons-guardrails.md)                                 |
| 表格元件選型                  | [table-decision-matrix.md](../playbooks/table-decision-matrix.md)                                     |
| API 端點（含路徑組合）        | [api-and-interface.md](../playbooks/api-and-interface.md)                                             |
| TypeScript 型別 / enum        | [type-conventions.md](../playbooks/type-conventions.md)                                               |
| 表單 / FormTemplate           | [page-scaffold.md](../playbooks/page-scaffold.md)                                                     |
| 頁面模式 A / B / TopBar       | [page-mode-selection.md](../playbooks/page-mode-selection.md)                                         |
| Drawer                        | [drawer.md 檢查清單](../playbooks/drawer.md#檢查清單)                                                 |
| 驗證 schema / yup             | [validation.md](../playbooks/validation.md)                                                           |
| 權限判斷 / 功能可見性         | [permissions-patterns.md](../playbooks/permissions-patterns.md)                                       |
| websiteCode / Global vs Local | [global-local.md](../playbooks/global-local.md)                                                       |
| Figma 與 FSD 衝突 / FSD 標記  | [figma-fsd-mapping.md](../playbooks/figma-fsd-mapping.md)                                             |
| 參考其他專案（例如 ROG）實作  | [cross-project-guardrails.md 實作前檢查清單](../playbooks/cross-project-guardrails.md#實作前檢查清單) |

## 通用規則（每次必查）

以下項目不論觸及範圍，每次都需確認：

- [code-quality-rules.md](../playbooks/code-quality-rules.md) 的 **必須（Must）** 全部通過
- 未引入任何第三方 UI/icon 函式庫
- 未經核准未修改 `libs/shared` 或其他共享檔
- 修改的檔案無明顯 TypeScript 錯誤

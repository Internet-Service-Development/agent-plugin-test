# Permissions Patterns

適用於 dashboard 或其他需要權限清單整合、功能可見性控制的任務。

## 必須（Must）

- 權限來源應統一從 store（例如 `permissions` 或 `permissionList`）讀取
- 權限判斷應集中在頁面或 hook 層，避免散落在 route config
- 權限 key 判斷需明確且可追溯，不得使用模糊字串比對
- 缺少權限資料時需有安全預設行為（例如不顯示可編輯操作）

## 應該（Should）

- 先在 hook/selector 統一計算 `canRead`、`canEdit`、`canSubmit` 旗標，再由 UI 消費
- 多層 `subPermissions` 查找邏輯集中封裝，避免在多個元件重複展開
- 權限相關條件邏輯優先使用命名良好的布林變數

## 參考文件

- `../references/permissions-pattern-examples.md`

## 常見錯誤

- 在多個元件重複 copy 權限查找邏輯
- 權限資料尚未載入時直接進行可編輯操作
- route 層與頁面層重複做同一套權限判斷

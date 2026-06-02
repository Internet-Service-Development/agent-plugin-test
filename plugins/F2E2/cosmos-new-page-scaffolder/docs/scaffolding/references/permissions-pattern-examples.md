# Permissions Pattern Examples

## Dashboard 權限來源與導流

- `apps/dashboard/src/app/App.tsx`
- `apps/dashboard/src/layouts/layout/Layout.tsx`

## Dashboard 子權限判斷

- `apps/dashboard/src/pages/dashboard/common/DashboardTab.tsx`
- `apps/dashboard/src/pages/dashboard/eolProduct/components/EolProductTable.tsx`
- `apps/dashboard/src/pages/quickLink/QuickLink.tsx`

## 常見模式摘要

- 從 store 取 `permissions`
- 找到 feature 對應 permission node
- 從 `subPermissions` 推導 `canRead/canEdit` 旗標
- UI 僅消費旗標，不直接操作原始權限樹

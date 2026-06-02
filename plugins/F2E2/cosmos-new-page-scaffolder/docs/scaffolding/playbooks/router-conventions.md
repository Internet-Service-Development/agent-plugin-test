# Router Conventions

適用於新增或調整頁面路由、router 物件結構與 guard 行為的任務。

## 必須（Must）

- 先比對目標 app 的既有 router pattern，不可引入新 pattern
- `commercial` 使用 JSX `<Routes>/<Route>`；`brainHub`、`contentHub` 使用 `RouteObjectWithMeta`
- route `key` 必須唯一且為 snake_case；`path` 使用 kebab-case
- 權限判斷放在頁面 component，不在 route config 直接塞業務邏輯
- 無明確需求時不得新增 route-level guard

## 應該（Should）

- 使用靜態 import，避免與既有 app 的 lazy loading 策略不一致
- 需要表單頁骨架時補讀 `page-scaffold.md`
- 需要模式判斷時補讀 `page-mode-selection.md`

## 參考文件

- `../references/router-pattern-examples.md`

## 常見錯誤

- 在同一 app 混用 JSX Routes 與 RouteObject 模式
- route key 重複或命名不一致
- 在 route 層直接塞 API/權限業務邏輯

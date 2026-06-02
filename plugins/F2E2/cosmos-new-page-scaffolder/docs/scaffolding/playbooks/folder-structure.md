# Folder Structure

適用於建立新頁面時的資料夾與檔案佈局規劃。

## 必須（Must）

- 遵循目標 app 既有目錄結構與命名風格
- `api/`、`routes/`、`pages/{feature}/` 的責任分離不可混淆
- `index.tsx` 作為頁面入口，避免把整頁邏輯分散到多層不透明檔案
- 新頁面檔案應以 feature 為邊界共置

## 應該（Should）

- hooks 與頁面子元件優先與 feature 共置
- 僅在跨 feature 可重用時才提升到 shared 層
- 在規劃階段先明確列出將新增的檔案清單

## 參考文件

- `../references/folder-structure-examples.md`

## 常見錯誤

- 把 feature 專屬程式碼提前放到 shared
- routes 與 pages 命名不一致導致可追溯性下降
- API 型別散落到多處難以維護

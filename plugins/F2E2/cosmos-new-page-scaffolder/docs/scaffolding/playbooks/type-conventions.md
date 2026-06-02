# Type Conventions

適用於頁面開發中的型別放置、重用與命名規範。

## 必須（Must）

- 新增 type 前先檢查該專案內(例如 commercial)是否有已存在的 type/interface 與 `libs/shared/utils/src/types/`
- API payload/response 型別優先與 API 實作同檔共置
- 固定值集合必須使用 enum，不可使用魔術數字
- feature code 禁止新增 `any`
- 若只能沿用 shared 元件既有 `any`，需註記 `// shared component uses any — tech debt`

## 應該（Should）

- 型別命名維持 `GetXxxPayloadT`、`GetXxxResponseT` 一致風格
- 跨 app 共享型別放 `libs/shared/utils/src/types/`
- 複雜交集型別優先使用 `Simplify<T>` 降低可讀性成本

## 參考文件

- `../references/type-and-enum-examples.md`

## 常見錯誤

- 重複定義共享型別
- 在 JSX 或邏輯中直接比較 number literal
- `any` 擴散到新頁面 feature code

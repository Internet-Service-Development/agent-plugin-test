# API 與介面型別

適用於新增或修改 API 端點、payload、response 型別與欄位 enum。

## 必須（Must）

- 遵循目標 app 的 API 組織規範，位於 `apps/{app}/src/api`
- API 函式簽名需有完整的請求/回應型別
- API 函式需採 default object literal 匯出，函式命名維持 `get/post/put/patch/deleteXxx`
- 回傳型別需明確（例如 `Promise<AxiosResponse<ApiResponse<T>>>`）
- 固定數值的領域值必須用 enum 表示
- 邏輯與 JSX 中只能用 enum 值，不得使用魔術數字
- 盡量重用既有的共用型別

## 應該（Should）

- 若目標 app 已有慣例，將 API payload/response 型別放在 API 實作檔同處
- 保持命名一致：`GetXxxPayloadT`、`GetXxxResponseT` 等
- 端點參數保持明確（`websiteCode`、`id` 等）

## 參考文件

- `../references/api-function-format.md`
- `../references/type-and-enum-examples.md`

## 常見錯誤

- 用帶有注解的 `number` 代替 enum
- 型別後綴與命名不一致
- 重複定義已存在於共用函式庫的型別

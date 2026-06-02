# Figma 與 FSD 對映

適用於實作輸入同時包含 Figma 設計稿與規格文件（FSD）的任務。

## 必須（Must）

- FSD 與 Figma 衝突時，以 FSD 為優先
- 若實作以 FSD 為準而非設計稿，需明確記錄衝突說明
- 優先依循 FSD 定義的 global/local 差異

## 應該（Should）

- Figma 用於確認版面配置、層次結構與視覺意圖
- API 文件用於驗證 payload/response 合約
- 未解決的衝突記錄為假設（assumption），並向 PM/Designer 確認

## 優先級規則

1. FSD（規格文件）
2. API 規格文件
3. Figma 設計稿

## 決策範例

- FSD 說明：無字數限制
- Figma 提示：500 字
- 實作選擇：不加 `maxLength`，並在 PR/任務中附上說明

## 常見錯誤

- 將視覺提示直接視為業務限制
- 為了設計方便而忽略規格文件的規定
- 衝突未記錄就靜默解決

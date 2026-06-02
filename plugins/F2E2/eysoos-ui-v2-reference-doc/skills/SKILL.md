---
name: eysoos-ui-v2-reference-doc
description: "Generate or update .agents/skills/eysoos-ui-v2/references/*.md when a new component is added under libs/shared/ui-v2/src/lib. Use for @eysoos/prisma component documentation, ui-v2 reference markdown generation, reference format alignment, and SKILL.md index updates."
argument-hint: "Provide the ui-v2 component folder name, export name, or the files that were added under libs/shared/ui-v2/src/lib."
---

# Eysoos UI V2 Reference Doc

此技能用來處理 `libs/shared/ui-v2/src/lib` 新增元件後，補齊 `.agents/skills/eysoos-ui-v2/references` 文檔的工作。

## When to Use

- 在 `libs/shared/ui-v2/src/lib` 新增一個新的 ui-v2 元件資料夾時
- 在既有元件家族下新增可對外使用的新子元件時
- 需要補 `.agents/skills/eysoos-ui-v2/references/*.md` 文檔時
- 需要同步更新 `.agents/skills/eysoos-ui-v2/SKILL.md` 的元件索引表時
- 需要依照既有 `Button.md`、`Table.md` 這類 reference 格式產生新 md 時

## Expected Outcome

- 在 `.agents/skills/eysoos-ui-v2/references/` 建立或更新對應的元件文檔
- 文檔內容與元件目前的公開 API、使用方式、命名一致
- 若是新的可發現元件，也同步補上 `.agents/skills/eysoos-ui-v2/SKILL.md` 索引

## Source of Truth

產生文檔時，優先以下列來源為準：

1. `libs/shared/ui-v2/src/index.ts`
2. `libs/shared/ui-v2/src/lib/<component>/index.ts`
3. `libs/shared/ui-v2/src/lib/<component>/**/*.tsx`
4. `libs/shared/ui-v2/src/lib/<component>/**/*.stories.tsx`
5. `libs/shared/ui-v2/src/lib/<component>/**/*.spec.tsx`

不要憑空補 props、variant、預設值或行為。若原始碼無法確認，就在文檔中保守描述，或只寫已驗證的資訊。

## Decision Rules

### 1. 判斷是新文檔還是更新既有文檔

- 若是全新的公開元件，建立新的 `references/<ComponentName>.md`
- 若是既有 compound component 的子元件，先檢查是否應併入既有 md
- 若 `.agents/skills/eysoos-ui-v2/SKILL.md` 已將多個元件指向同一份文檔，維持相同策略，不要任意拆檔

### 2. 判斷文檔檔名

- 優先沿用 `.agents/skills/eysoos-ui-v2/SKILL.md` 既有索引的命名風格
- 若為新元件，檔名預設使用公開元件名稱，例如 `Badge.md`
- 若 repo 既有大小寫命名不一致，優先遵守現況，不要順手大量重命名

### 3. 判斷要不要更新索引

- 若 `libs/shared/ui-v2/src/index.ts` 有新增對外 export，通常也要更新 `.agents/skills/eysoos-ui-v2/SKILL.md`
- 若只是內部子元件、未對外 export，通常不更新索引

## Procedure

1. 確認此次新增或修改的是哪個元件資料夾，位置是否在 `libs/shared/ui-v2/src/lib`
2. 閱讀 `src/index.ts` 與元件資料夾的 `index.ts`，確認對外名稱與 export 方式
3. 閱讀主要元件檔、stories、spec，整理以下資訊：
   - 元件用途
   - 公開 props 或型別
   - 重要 variant / mode / size
   - 合法的引入方式
   - 最小可讀的使用範例
   - props 中引用到的 TypeScript 型別，特別是集合型別、物件型別、union 型別與 callback 參數
4. 檢查 `.agents/skills/eysoos-ui-v2/references` 中最接近的既有文檔格式
5. 使用 [component reference template](./assets/component-reference-template.md) 建立草稿
6. 將模板 placeholder 換成實際內容，刪除不適用段落，避免留下空章節
7. 若 props 含有可重用的 TypeScript 型別，依下列規則展開說明：
   - 若 props 型別是集合型別，例如 `TableColumnsTypeI[]`、`FooItem[]`，除了在 Props 表中記錄外，還要補一個獨立段落，逐項說明陣列元素型別的欄位
   - 若 props 型別是物件型別、interface、type alias、Record 或具名 union，也要視可讀性補獨立段落說明其欄位或可選值
   - 展開段落的標題應直接使用型別名稱，例如 `### TableColumnsTypeI 欄位定義`
   - 若該型別來自 callback 參數或 subheader 結構，且會直接影響使用方式，也應補充其結構說明
   - 若型別為內建 primitive、簡單 union 或不影響使用者理解，可不另外展開
8. 若該元件是新的公開元件，更新 `.agents/skills/eysoos-ui-v2/SKILL.md` 的索引表：
   - component 名稱
   - 一句 description
   - document file 路徑
9. 檢查連結、檔名、大小寫、import 路徑是否一致

## Quality Checks

- 文檔標題與元件公開名稱一致
- 引入方式與目前 export 一致
- Props 表只寫已確認的欄位
- 若 props 使用集合型別或複合型別，已額外展開其元素或結構定義，格式可參考 `Table.md` 的 `### TableColumnsTypeI 欄位定義`
- 範例使用 `@eysoos/prisma` 與 `@eysoos/icons`，不引入第三方 UI 套件
- 若元件屬於 compound component，文檔結構與既有家族文檔一致
- 若新增索引，`.agents/skills/eysoos-ui-v2/SKILL.md` 的 description 與文檔內容不互相矛盾

## Constraints

- 不要為了補文檔而修改元件行為
- 不要假設 story 就等於完整 API，仍要以實作與 export 為準
- 不要把內部測試輔助元件寫成公開能力
- 不要新增任何非 `@eysoos/*` UI 或 icon library 的使用建議
- 不要只寫 `SomeType[]` 就結束；若該型別是使用者設定元件時需要理解的資料結構，必須展開

## Asset

- 文檔模板：[assets/component-reference-template.md](./assets/component-reference-template.md)

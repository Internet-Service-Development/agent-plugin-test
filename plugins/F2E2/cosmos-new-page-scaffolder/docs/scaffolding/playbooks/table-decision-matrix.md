# 表格元件選型決策矩陣

適用於 Figma 設計包含表格，需要判斷使用哪種表格元件的任務。

## 必須（Must）

- 先以 `Table` 為預設選擇，確認有進階需求時才升級
- `TableEysoos` 為已棄用元件，新功能不得使用
- 有拖曳需求時，使用 `DraggableList`，不用 `Table` 手刻拖曳

## 決策流程

```
Figma 表格有「拖曳把手」或「drag icon」？
├── 是 → 使用 DraggableList
└── 否 → 有「欄位凍結」、「多級表頭」、「複雜篩選/排序」？
    ├── 是 → 使用 ComplexTable
    └── 否 → 資料為樹狀/階層結構？
        ├── 是 → 使用 TreeStructureTable
        └── 否 → 使用 Table（預設）
```

## 元件選型表

| 表格特徵                     | 使用元件             | 來源             | 說明                         |
| ---------------------------- | -------------------- | ---------------- | ---------------------------- |
| 普通列表，無排序/拖曳        | `Table`              | `@eysoos/prisma` | 預設選擇                     |
| 支援行拖曳重排               | `DraggableList`      | `@eysoos/prisma` | 可拖曳重排的列表             |
| 大量欄位、欄位凍結、複雜篩選 | `ComplexTable`       | `@eysoos/prisma` | 進階表格功能                 |
| 樹狀/階層結構資料            | `TreeStructureTable` | `@eysoos/prisma` | 父子節點關係                 |
| ⛔ 已棄用                    | `TableEysoos`        | —                | 僅維護舊頁面，新功能禁止導入 |

## 參考頁面

| 元件                 | 參考路徑                                                        |
| -------------------- | --------------------------------------------------------------- |
| `Table`              | `apps/rog/src/pages/wallpaper/home/pageInfo/RecommendTable.tsx` |
| `DraggableList`      | 查詢同專案或其他專案的現有實作                                  |
| `ComplexTable`       | 查詢同專案或其他專案的現有實作                                  |
| `TreeStructureTable` | 查詢同專案或其他專案的現有實作                                  |

## 常見錯誤

- 有拖曳需求卻用 `Table` 手刻排序邏輯
- 在新功能中使用 `TableEysoos`
- 複雜篩選/排序需求仍選用基本 `Table`，導致後期難以擴充

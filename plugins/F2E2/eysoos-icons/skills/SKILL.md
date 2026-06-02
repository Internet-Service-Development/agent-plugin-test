---
name: eysoos-icons
description: "@eysoos/icons 是 ASUS CMS 設計系統的 SVG 圖標庫，提供統一的圖示元件。使用本技能時，請遵循圖示使用指南並從此套件匯入所有圖示。"
metadata:
  author: asus-cms
  version: "1.0"
---

# @eysoos/icons Skill

此技能提供 `@eysoos/icons` 圖標庫的使用指南與圖示索引，確保專案中圖示使用的一致性。

## 詳細使用指南

完整的圖示使用規則、替換對照表、範例程式碼請參閱：

📖 **[圖示使用指南](./icon-usage-guidelines.md)**

指南內容包含：

- 核心規則與禁止事項
- 圖示替換指南（從其他函式庫遷移）
- 常見 React Icons / Material-UI 替換對照表
- 智能替換規則和範例
- 社交媒體、AI 功能、圖片編輯等圖示分類
- 圖示樣式應用與限制處理
- 最佳實踐

## 快速參考

### 基本使用

```tsx
import { EditIcon, SearchIcon, AddIcon, DeleteIcon } from '@eysoos/icons';

<EditIcon />
<SearchIcon />
```

### 核心規則

1. **唯一來源**：所有圖示必須使用 `@eysoos/icons`
2. **禁止使用**：Material-UI、React Icons、Font Awesome 等外部圖示庫
3. **具名匯入**：始終使用具名匯入
4. **缺失處理**：若無對應圖示，使用 `<div></div>` 佔位或選擇功能相近的現有圖示

完整的可用圖示類別清單請參閱 [圖示使用指南](./icon-usage-guidelines.md#可用圖示類別)。

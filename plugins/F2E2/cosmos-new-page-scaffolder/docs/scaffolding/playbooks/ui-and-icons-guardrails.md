# UI 與 Icon 使用限制

適用於實作頁面 UI、控制項、導覽列與表格結構的任務。

## 必須（Must）

- UI/icon/util 層只允許使用 `@eysoos/prisma`、`@eysoos/icons`、`@eysoos/utils`
- 不得引入任何第三方 UI 函式庫
- `Switch` 必須搭配 `ControlLabel`，不得使用 `Box + Label` 組合
- 所有圖示只能從 `@eysoos/icons` 匯入

## 應該（Should）

- 建立新 TopBar 前，先確認同專案是否已有現有實作可複用
- 依複雜度選擇表格元件：`Table` → `ComplexTable` → `TreeStructureTable`
- Typography 選用需與設計稿的 line-height 語意一致

## Switch 模式

```tsx
<ControlLabel
  control={
    <Switch
      checked={checked}
      disabled={!isEdit}
      onChange={e => onToggle(e.target.checked)}
    />
  }
>
  標籤文字
</ControlLabel>
```

## TopBar 模式（設計稿含左上返回 + 右上儲存時）

```tsx
<TextLink iconPosition="left" icon={<PreviousIcon />} onClick={onBack}>
  Back to Home
</TextLink>

<Button variant="contained" disabled={!isEditable || !isModified || isSaving} onClick={onSave}>
  Save
</Button>
```

## 常見錯誤

- 在頁面程式碼中引入 MUI/Antd/Radix 等元件
- 在 `@eysoos/icons` 以外自行建立 SVG icon 元件
- 在新功能中使用已棄用的表格元件

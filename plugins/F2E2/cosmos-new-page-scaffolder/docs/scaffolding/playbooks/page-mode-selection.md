# 頁面模式判斷（模式 A / 模式 B）

依據 Figma 設計特徵，判斷採用哪種頁面實作模式。

## 必須（Must）

- 依 Figma 設計特徵選擇對應模式，不混用兩種架構
- 模式 B 必須有 TopBar；模式 A 不需要 TopBar
- 先確認同專案是否已有可複用的 TopBar 實作，再決定是否新建

## 模式判斷表

| Figma 特徵                                        | 對應模式               |
| ------------------------------------------------- | ---------------------- |
| 右下角有 Save 按鈕，無 TopBar                     | 模式 A：表單編輯頁面   |
| 左上返回按鈕 + 右上 Save/Publish 按鈕，無 Sidebar | 模式 B：多步驟容器頁面 |

## 模式 A：表單編輯頁面（Right-Bottom Save）

**Figma 特徵**：右下角有 Save 按鈕，頁面無獨立 TopBar。

**實作方式**：

- 使用 `forwardRef` + `FormTemplate` 包裝
- 使用 `watchModifyHandler` 監聽修改狀態
- 向父元件暴露 `formikInit`、`initialDataHandler`、`saveHandler`
- 通常不含 TopBar，只有頁籤或子導航

**適用場景**：

- 模態框內的編輯表單
- 頁籤式設定頁面（如 PageInfo、SEO 設定）
- 需要父元件控制保存的編輯元件

**參考頁面**：`apps/rog/src/pages/wallpaper/home/pageInfo/PageInfo.tsx`

## 模式 B：多步驟容器頁面（Top-Left Back + Top-Right Save）

**Figma 特徵**：左上角有返回按鈕、右上角有 Save/Publish 按鈕，無 Sidebar 菜單。

**實作方式**：

- 頂部 TopBar（返回按鈕 + 標題 + 操作按鈕）
- 多步驟導航（ContentStepper）
- 使用 `Outlet context` 向子頁面傳遞狀態
- 底部 Footer 處理步驟導航
- 每個步驟為獨立的 `forwardRef` 元件

**適用場景**：

- 多步驟的建立/編輯流程
- 需要上一步/下一步導航
- 需要跨步驟驗證邏輯

**參考頁面**：

- `apps/rog/src/pages/wallpaper/list/detail/WallpaperContainer.tsx`
- TopBar 實作：`apps/rog/src/components/stepLayout/TopBar.tsx`
- 其他專案參考：`apps/promotion/src/components/TopBar.tsx`、`apps/contentHub/src/components/TopBar.tsx`

## TopBar 實作規則（模式 B 適用）

1. **先確認同專案是否已有 TopBar**

   - 檢查 `apps/{projectName}/src/components/stepLayout/TopBar.tsx`
   - 檢查 `apps/{projectName}/src/components/common/TopBar.tsx`
   - 若有，複用或參考現有實作

2. **若無，參考其他專案**

   - `apps/promotion/src/components/TopBar.tsx`
   - `apps/specMiddleware/src/components/common/TopBar.tsx`
   - `apps/contentHub/src/components/TopBar.tsx`
   - `apps/tagMiddleware/src/components/common/TopBar.tsx`

3. **TopBar 必要功能**

```tsx
// 返回按鈕（使用 @eysoos/icons 的 PreviousIcon）
<TextLink
  iconPosition="left"
  icon={<PreviousIcon />}
  onClick={() => navigate({ pathname: backUrl, search })}
>
  Back to Home
</TextLink>

// Save/Publish 按鈕
<Button
  variant="contained"
  disabled={!isEditable || !isModified || isSaving}
  onClick={onSave}
>
  Save
</Button>
```

4. **複雜場景**
   - 若有多個確認對話框，參考 `apps/rog/src/components/stepLayout/TopBar.tsx`
   - 若需要多步驟驗證，使用 `updateStepper` callback 傳遞驗證邏輯

## 常見錯誤

- 混用兩種模式的架構
- 模式 B 忘記實作 TopBar
- 模式 A 多餘地加入 TopBar
- 未先確認同專案是否有可複用的 TopBar 就新建

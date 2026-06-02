# Global 與 Local 邏輯

適用於依據 `websiteCode` 產生行為差異的功能。

## 必須（Must）

- 將 `websiteCode = global` 視為全球模式
- 依 FSD 要求實作欄位可見性/可編輯性的條件邏輯
- 地區邏輯需明確且可測試

## 應該（Should）

- 在元件邏輯早期推導出單一 `isGlobal` 布林值
- 將判斷邏輯放在靠近受影響欄位/元件的地方
- 避免跨地區的隱性副作用

## 核心模式

```ts
const websiteCode = useAppSelector(({ regions }) => regions.currentRegion);
const isGlobal = websiteCode === GLOBAL_WEBSITE;

<ValidationInputField
  inputProps={{
    value: data.value,
    disabled: !isGlobal,
    onChange: e => handleDataChanged('value', e.target.value),
  }}
/>;
```

## 決策說明

- Global 站通常擁有最完整的欄位集合
- Local 站可編輯欄位可能較少，或有額外的當地特有欄位
- 不確定時，以 FSD 為準並標記假設內容

## 常見錯誤

- 把所有地區當作相同行為處理
- 未確認 FSD/API 需求就直接隱藏欄位
- 地區判斷邏輯散落在程式碼各處

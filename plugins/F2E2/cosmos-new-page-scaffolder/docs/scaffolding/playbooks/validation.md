# 驗證 Schema 與欄位對映

適用於頁面包含可編輯輸入欄位且需要 schema 驗證的任務。

## 必須（Must）

- `validationSchema` 與 `initialValues` 的欄位名必須一致
- 每個 `ValidationInputField`/驗證元件的 `name` prop 必須與 schema 的 key 完全相同
- `formikInit` 需回傳 form config 供 `FormTemplate` 使用

## 應該（Should）

- 驗證訊息保持清晰且針對特定欄位
- 依模組/區塊的命名慣例分組相關欄位
- 避免在 schema 以外重複驗證邏輯

## 最小可用模式

```ts
const validationSchema = yup.object({
  fieldName: yup.string().required('此欄位為必填'),
});

const initialValues = {
  fieldName: data.fieldName || '',
};

const formikInit = () => ({
  initialValues,
  validationSchema,
});
```

```tsx
<ValidationInputField
  name="fieldName"
  inputProps={{
    value: data.fieldName,
    onChange: e => handleDataChanged('fieldName', e.target.value),
  }}
/>
```

## 常見錯誤

- Schema key 與輸入元件 `name` 不一致
- 必填欄位缺少 `initialValues` 初始值
- `formikInit` 回傳格式錯誤（需為 `{ initialValues, validationSchema }`）

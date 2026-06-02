# {{ComponentName}} 組件

## {{ComponentName}}

{{ComponentSummary}}

### 支援的 Props

| 名稱         | 型別         | 必填         | 預設值           | 用途            |
| ------------ | ------------ | ------------ | ---------------- | --------------- |
| {{propName}} | {{propType}} | {{required}} | {{defaultValue}} | {{description}} |

### {{TypeName}} 欄位定義

| 屬性          | 型別          | 說明                 |
| ------------- | ------------- | -------------------- |
| {{fieldName}} | {{fieldType}} | {{fieldDescription}} |

### 注意事項

- {{ImportantNote1}}
- {{ImportantNote2}}

### 引入方式

```ts
import { {{ImportName}}{{ExtraTypeImports}} } from '@eysoos/prisma';
```

### 組件使用範例

```tsx

// 最基本用法示意，請替換為實際範例
<{{ComponentName}} propA={value} propB="text" />

```

## 使用說明

- 若是 compound component，沿用既有家族文檔格式，可在同一份 md 追加 `## SubComponentName` 區段
- 若沒有明確預設值，不要自行填寫
- 若某 props 僅存在於內部實作、未對外 export，不要寫進文檔
- 若 stories 提供的是最佳示例，可整理後放進 `組件使用範例`
- 若 props 含 `SomeType[]`、物件型別、具名 interface/type alias，且會影響使用方式，請加入對應的 `### TypeName 欄位定義` 或可選值說明段落
- 若元件不需要 `注意事項` 或有更多段落，請依既有 reference 格式增減，不必硬套模板

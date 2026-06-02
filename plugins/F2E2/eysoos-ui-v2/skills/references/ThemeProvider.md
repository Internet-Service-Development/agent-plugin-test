
## 概述

ThemeProvider 是 eysoos/prisma 設計系統中的核心主題管理組件，基於 Zustand 狀態管理和 CSS 變數實現。它為整個設計系統提供統一的主題切換和自定義主題配置功能，確保所有 UI 組件都能響應主題變化。系統採用模組化設計，易於擴展和維護。

## 在 eysoos/prisma 設計系統中的角色

- **核心基礎設施**: 為所有 UI 組件提供主題支援
- **統一管理**: 集中管理整個設計系統的主題狀態
- **擴展性**: 支援自定義主題變數，滿足不同專案需求
- **一致性**: 確保所有組件在主題切換時保持視覺一致性

## 檔案結構

```
themeProvider/
├── index.ts                    # 主要匯出檔案
├── ThemeProvider.tsx           # 主題訂閱和應用邏輯
├── themeStore.ts              # Zustand 狀態管理
├── ThemeSwitch.tsx            # 主題切換元件
├── customTheme.ts             # 自定義主題配置
└── generateThemeTypes/
    ├── generateThemeTypes.js   # 型別生成腳本
    └── themeVariables.ts       # 主題變數型別定義
```

## 核心檔案說明

### 1. index.ts - 主要匯出檔案

```typescript
import useThemeStore from './themeStore';
import subscribeThemeChange from './ThemeProvider';
import ThemeSwitch from './ThemeSwitch';
import customTheme from './customTheme';

export { useThemeStore, subscribeThemeChange, ThemeSwitch, customTheme };
```

**功能**: 統一匯出所有主題相關的功能模組

### 2. themeStore.ts - 狀態管理

```typescript
import { create } from 'zustand';

export type ThemeType = 'default' | 'dark';

interface ThemeState {
  theme: ThemeType;
  setTheme: (newTheme: ThemeType) => void;
}

const useThemeStore = create<ThemeState>()(set => ({
  theme: 'default',
  setTheme: newTheme => set({ theme: newTheme }),
}));

export default useThemeStore;
```

**功能**:

- 使用 Zustand 管理主題狀態
- 提供 `theme` 狀態和 `setTheme` 方法
- 支援 'default' 和 'dark' 兩種主題類型

### 3. ThemeProvider.tsx - 主題應用邏輯

```typescript
import useThemeStore, { type ThemeType } from './themeStore';

const applyTheme = (theme: ThemeType) => {
  if (theme === 'dark') {
    document.body.classList.add('eysoos__dark-theme');
  } else {
    document.body.classList.remove('eysoos__dark-theme');
  }
};

const subscribeThemeChange = () => {
  const { getState, subscribe } = useThemeStore;

  // 初始設置
  applyTheme(getState().theme);

  // 訂閱狀態變化
  subscribe((state, prevState) => {
    const theme: ThemeType = state.theme;
    applyTheme(theme);
  });
};

export default subscribeThemeChange;
```

**功能**:

- 監聽主題狀態變化
- 自動在 document.body 上添加/移除 CSS 類別
- 初始化時應用當前主題

### 4. ThemeSwitch.tsx - 主題切換元件

```typescript
import Switch from '../../lib/switch';
import useThemeStore from './themeStore';

const ThemeSwitch = () => {
  const { setTheme, theme } = useThemeStore();

  return (
    <Switch
      checked={theme === 'default'}
      onChange={e => setTheme(e.target.checked ? 'default' : 'dark')}
    />
  );
};

export default ThemeSwitch;
```

**功能**:

- 提供 UI 元件來切換主題
- 使用內建的 Switch 元件
- 自動同步主題狀態

### 5. customTheme.ts - 自定義主題配置

```typescript
import { type ThemeVariables } from './generateThemeTypes/themeVariables';

interface CustomTheme {
  default?: ThemeVariables;
  darkTheme?: ThemeVariables;
}

const customTheme = (customTheme: CustomTheme) => {
  const styleElementId = 'custom-theme-styles';
  let styleElement = document.getElementById(styleElementId);

  if (!styleElement) {
    styleElement = document.createElement('style');
    styleElement.id = styleElementId;
    document.head.appendChild(styleElement);
  }

  let cssString = '';

  if (customTheme.default) {
    cssString += ':root {';
    for (const [key, value] of Object.entries(customTheme.default)) {
      cssString += `--${key}: ${value};`;
    }
    cssString += '}';
  }

  if (customTheme.darkTheme) {
    cssString += '.eysoos__dark-theme {';
    for (const [key, value] of Object.entries(customTheme.darkTheme)) {
      cssString += `--${key}: ${value};`;
    }
    cssString += '}';
  }

  styleElement.innerHTML = cssString;
};

export default customTheme;
```

**功能**:

- 動態生成 CSS 變數
- 支援預設主題和暗色主題的自定義
- 將 CSS 注入到 document head 中

### 6. generateThemeTypes.js - 型別生成腳本

```javascript
const fs = require('fs');
const path = require('path');

// 讀取 theme.scss 文件
const themePath = path.resolve(
  process.cwd(),
  'libs/shared/ui-v2/src/style/themes/defaultTheme.scss'
);
const themeContent = fs.readFileSync(themePath, 'utf8');

// 使用正則表達式抓CSS變數
const variableRegex = /--([a-zA-Z0-9-]+):\s*[^;]+;/g;
let match;
const variables = [];

while ((match = variableRegex.exec(themeContent)) !== null) {
  variables.push(match[1]);
}

// 生成 TypeScript 類型定義
const typeDefinition = `export type ThemeVariables = {
  ${variables.map(variable => `'${variable}'?: string;`).join('\n  ')}
};\n`;

// 輸出到文件
const outputPath = path.resolve(__dirname, 'themeVariables.ts');
fs.writeFileSync(outputPath, typeDefinition);

console.log('Custom theme object type has been generated:', outputPath);
```

**功能**:

- 自動從 SCSS 檔案中提取 CSS 變數
- 生成對應的 TypeScript 型別定義
- 確保型別安全的主題配置

## 使用方式

### 1. 在 eysoos/prisma 專案中初始化

在使用 eysoos/prisma 設計系統的應用程式主要入口檔案（如 Main.tsx 或 App.tsx）中：

```typescript
import { subscribeThemeChange, customTheme } from './path/to/themeProvider';

// 初始化主題訂閱
subscribeThemeChange();

// 可選：自定義主題配置
customTheme({
  default: {
    'eysoos-switch-input-disabled-bg-color': '#28a709',
  },
  darkTheme: {
    'eysoos-switch-input-disabled-bg-color': '#e977d6',
  },
});
```

### 2. 在元件中使用主題狀態

```typescript
import { useThemeStore } from './path/to/themeProvider';

const MyComponent = () => {
  const { theme, setTheme } = useThemeStore();

  return (
    <div>
      <p>當前主題: {theme}</p>
      <button
        onClick={() => setTheme(theme === 'default' ? 'dark' : 'default')}
      >
        切換主題
      </button>
    </div>
  );
};
```

### 3. 使用主題切換元件

```typescript
import { ThemeSwitch } from './path/to/themeProvider';

const Header = () => {
  return (
    <header>
      <h1>我的應用程式</h1>
      <ThemeSwitch />
    </header>
  );
};
```

### 4. 確保自定義主題覆蓋

如果需要確保自定義主題在 UI 主題載入後覆蓋：

```typescript
document.addEventListener('DOMContentLoaded', () => {
  const customThemeConfig = {
    default: {
      'eysoos-content-area-background-color': '#ffffff',
      'eysoos-button-contained-color': '#000000',
    },
    darkTheme: {
      'eysoos-content-area-background-color': '#000000',
      'eysoos-button-contained-color': '#ffffff',
    },
  };
  customTheme(customThemeConfig);
});
```

## 依賴項目

- **zustand**: 狀態管理庫
- **react**: React 框架
- **typescript**: 型別支援

## CSS 變數命名規範

作為 eysoos/prisma 設計系統的一部分，所有 CSS 變數都遵循統一的命名規範：

- **前綴**: 所有變數以 `eysoos-` 開始，標識為設計系統變數
- **結構**: `eysoos-{component}-{element}-{modifier}-{property}`
- **範例**:
  - `eysoos-button-contained-bg-color` (按鈕組件的背景色)
  - `eysoos-switch-input-disabled-bg-color` (開關組件的禁用背景色)
  - `eysoos-status-color-positive` (狀態組件的正面顏色)

這個命名規範確保了整個設計系統中變數的一致性和可維護性。

## 擴展指南

### 添加新主題類型

1. 修改 `themeStore.ts` 中的 `ThemeType`：

```typescript
export type ThemeType = 'default' | 'dark' | 'custom';
```

2. 更新 `ThemeProvider.tsx` 中的 `applyTheme` 函數：

```typescript
const applyTheme = (theme: ThemeType) => {
  document.body.className = document.body.className.replace(
    /eysoos__\w+-theme/g,
    ''
  );
  if (theme !== 'default') {
    document.body.classList.add(`eysoos__${theme}-theme`);
  }
};
```

### 添加新的 CSS 變數

1. 在 SCSS 檔案中添加新變數
2. 執行 `generateThemeTypes.js` 腳本更新型別定義
3. 在 `customTheme` 中使用新變數

## 最佳實踐

1. **型別安全**: 始終使用生成的 `ThemeVariables` 型別
2. **效能考量**: 避免頻繁切換主題，考慮添加防抖機制
3. **可訪問性**: 確保主題切換不影響可訪問性
4. **持久化**: 考慮將主題偏好儲存到 localStorage
5. **SSR 支援**: 在服務端渲染時注意主題的初始化

## 故障排除

### 常見問題

1. **主題不生效**: 檢查是否正確調用了 `subscribeThemeChange()`
2. **CSS 變數未更新**: 確認 SCSS 檔案路徑正確，重新執行型別生成腳本
3. **切換延遲**: 檢查 CSS 轉場效果是否過長

### 除錯技巧

1. 使用瀏覽器開發者工具檢查 CSS 變數值
2. 確認 `eysoos__dark-theme` 類別是否正確添加到 body
3. 檢查自定義樣式是否正確注入到 head 中

## 與其他 eysoos/prisma 組件的整合

ThemeProvider 作為設計系統的基礎設施，與其他組件緊密整合：

- **Button 組件**: 使用 `eysoos-button-*` 系列變數
- **Switch 組件**: 使用 `eysoos-switch-*` 系列變數
- **Status 組件**: 使用 `eysoos-status-*` 系列變數
- **DatePicker 組件**: 使用 `eysoos-date-picker-*` 系列變數

所有組件都會自動響應主題變化，無需額外配置。

## 總結

ThemeProvider 是 eysoos/prisma 設計系統的核心基礎設施，提供了完整的明暗主題支援，具有良好的擴展性和型別安全性。它確保了整個設計系統的視覺一致性，並為開發者提供了靈活的自定義主題能力，適合在大型 React 應用程式和設計系統中使用。

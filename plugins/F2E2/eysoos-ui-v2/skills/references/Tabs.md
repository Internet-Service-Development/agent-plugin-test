# Tabs 組件

## Tabs

標籤頁組件，提供多個面板之間的切換功能，支援不同樣式變體和編輯功能，適用於內容分組和導航場景。

### 支援的 Props

| 名稱     | 型別                    | 必填 | 預設值    | 用途                        |
| -------- | ----------------------- | ---- | --------- | --------------------------- |
| value    | number                  | 是   |           | 目前啟用的標籤頁索引        |
| variant  | 'default' \| 'lite'     | 否   | 'default' | 標籤頁樣式變體              |
| addTab   | { onClick: () => void } | 否   |           | 新增標籤頁的配置            |
| children | ReactNode               | 是   |           | 標籤頁內容（Tabs.Tab 組件） |

### Tabs.Tab Props

| 名稱                | 型別                       | 必填 | 預設值 | 用途                     |
| ------------------- | -------------------------- | ---- | ------ | ------------------------ |
| label               | string                     | 是   |        | 標籤頁顯示文字           |
| onClick             | () => void                 | 否   |        | 點擊標籤頁的回調函數     |
| num                 | number                     | 否   |        | 顯示在標籤頁上的數字     |
| isDefault           | boolean                    | 否   | false  | 是否為預設標籤頁         |
| isEnabled           | boolean                    | 否   | true   | 是否啟用標籤頁           |
| updateLabel         | (label: string) => void    | 否   |        | 更新標籤頁名稱的回調函數 |
| editMenu            | ReactNode                  | 否   |        | 編輯選單內容             |
| onPopoverOpenChange | (visible: boolean) => void | 否   |        | 編輯選單開關狀態變化回調 |

### 引入方式

```js
import { Tabs } from '@eysoos/prisma';
```

### 基本使用範例

```tsx
import { useState } from 'react';
import { Tabs } from '@eysoos/prisma';

const TabsExample = () => {
  const [selectedTab, setSelectedTab] = useState(0);

  const tabs = [{ name: '標籤1' }, { name: '標籤2' }, { name: '標籤3' }];

  return (
    <Tabs value={selectedTab} variant="default">
      {tabs.map((tab, index) => (
        <Tabs.Tab
          key={tab.name}
          label={tab.name}
          onClick={() => setSelectedTab(index)}
        />
      ))}
    </Tabs>
  );
};
```

### 帶數字通知的標籤頁

```tsx
<Tabs value={selectedTab} variant="default">
  <Tabs.Tab label="訊息" num={5} onClick={() => setSelectedTab(0)} />
  <Tabs.Tab label="通知" num={12} onClick={() => setSelectedTab(1)} />
</Tabs>
```

### 可編輯的標籤頁

```tsx
import { useState } from 'react';
import { Tabs } from '@eysoos/prisma';

const EditableTabsExample = () => {
  const [selectedTab, setSelectedTab] = useState(0);
  const [tabs, setTabs] = useState([
    { id: 1, name: '標籤1', isDefault: true, isEnabled: true },
    { id: 2, name: '標籤2', isDefault: false, isEnabled: true },
  ]);

  const addTab = () => {
    const newTab = {
      id: Date.now(),
      name: '新標籤',
      isDefault: false,
      isEnabled: true,
    };
    setTabs(prev => [...prev, newTab]);
  };

  const deleteTab = (index: number) => {
    const newTabs = [...tabs];
    newTabs.splice(index, 1);
    setTabs(newTabs);
  };

  const updateLabel = (index: number) => (label: string) => {
    setTabs(prev =>
      prev.map((tab, i) => (i === index ? { ...tab, name: label } : tab))
    );
  };

  return (
    <Tabs value={selectedTab} variant="lite" addTab={{ onClick: addTab }}>
      {tabs.map((tab, index) => (
        <Tabs.Tab
          key={tab.id}
          label={tab.name}
          isDefault={tab.isDefault}
          isEnabled={tab.isEnabled}
          onClick={() => setSelectedTab(index)}
          updateLabel={updateLabel(index)}
          editMenu={
            <Tabs.EditMenu
              deleteTab={() => deleteTab(index)}
              setDefaultTab={() => {
                /* 設為預設邏輯 */
              }}
              duplicateTab={() => {
                /* 複製邏輯 */
              }}
              changeWorkingStatus={() => {
                /* 切換狀態邏輯 */
              }}
            />
          }
        />
      ))}
    </Tabs>
  );
};
```

### 路由標籤頁範例

參考 `apps/careers/src/routes/RouterTabs.tsx` 的實作方式：

```tsx
import { useCallback } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import { Tabs } from '@eysoos/prisma';

const RouterTabs = ({ childRoutes }) => {
  const { pathname } = useLocation();
  const navigate = useNavigate();

  const activeIndexHandler = useCallback(() => {
    const pathName = pathname.toLowerCase();
    const pathSet = new Set(pathName.split('/'));
    const activeTabName = childRoutes.find(item => {
      if (!item.route) return false;
      const currentRoute = item.route.split('/')[0];
      return pathSet.has(currentRoute);
    })?.name;
    const activeTabIndex = childRoutes.findIndex(
      item => item?.name === activeTabName
    );
    return activeTabIndex > -1 ? activeTabIndex : 0;
  }, [childRoutes, pathname]);

  return (
    <Tabs value={activeIndexHandler()}>
      {childRoutes.map(({ key, name, route }) => (
        <Tabs.Tab
          key={key}
          label={name}
          onClick={() => navigate({ pathname: route })}
        />
      ))}
    </Tabs>
  );
};
```

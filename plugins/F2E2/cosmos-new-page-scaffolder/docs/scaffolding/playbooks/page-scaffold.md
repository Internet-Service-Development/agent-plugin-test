# 頁面骨架（Page Scaffold）

適用於遵循標準 wrapped component 模式的 Cosmos 表單類頁面。

## 必須（Must）

- `FormTemplate` 必須從 `@eysoos/utils` 匯入（不是 `@eysoos/prisma`）
- 使用 `forwardRef` 搭配 `WrappedComponentUtilityProps`
- 透過 `useImperativeHandle` 暴露 `formikInit`、`initialDataHandler`、`saveHandler`
- 維持雙重狀態以進行差異追蹤：`dataRaw`（原始資料）與 `data`（編輯副本）
- 在 `useEffect` 中呼叫 `watchModifyHandler([[dataRaw, data]])`
- 巢狀欄位更新時，使用 `cloneDeep` + `set`

## 應該（Should）

- `initialDataHandler` 保持為普通的 async 函式（不要用 useCallback）
- 將 fetch 邏輯放在穩定的 callback 中，並在儲存後重新整理
- 頁面層級的狀態保持最小化

## 參考骨架

```ts
const PageComponent = forwardRef(
  ({ watchModifyHandler }: WrappedComponentUtilityProps, ref) => {
    const websiteCode = useAppSelector(({ regions }) => regions.currentRegion);
    const [dataRaw, setDataRaw] = useState(initData);
    const [data, setData] = useState(initData);

    const handleDataChanged = (target: string, value: unknown) => {
      setData(prev => {
        const next = cloneDeep(prev);
        set(next, target, value);
        return next;
      });
    };

    const fetchData = useCallback(async () => {
      const result = await api.getData({ websiteCode });
      setDataRaw(result.data.result);
      setData(result.data.result);
    }, [websiteCode]);

    const initialDataHandler = async () => {
      await fetchData();
    };

    const saveHandler = useCallback(async () => {
      await api.updateData({ websiteCode, ...data });
      await fetchData();
    }, [data, fetchData, websiteCode]);

    const formikInit = () => ({});

    useImperativeHandle(ref, () => ({
      formikInit,
      initialDataHandler,
      saveHandler,
    }));

    useEffect(() => {
      watchModifyHandler([[dataRaw, data]]);
    }, [watchModifyHandler, dataRaw, data]);

    return null;
  }
);

export default FormTemplate(PageComponent);
```

## 常見錯誤

- 從錯誤的套件匯入 `FormTemplate`
- 將 `initialDataHandler` 用 `useCallback` 包裹
- 缺少差異追蹤的 `useEffect`
- 更新巢狀欄位時未使用不可變複製（immutable cloning）

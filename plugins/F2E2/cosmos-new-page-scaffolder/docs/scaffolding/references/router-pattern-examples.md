# Router Pattern Examples

## RouteObjectWithMeta 範例（brainHub/contentHub）

```ts
import { RouteObjectWithMeta } from '../../routes/index';

{
  key: 'feature_page',
  path: '/feature/page',
  element: <FeaturePage />,
  name: 'Page Display Name',
}
```

## JSX Routes 範例（commercial）

```tsx
const featureRoutes = [
  {
    key: 'feature_page',
    path: '/feature/page',
    element: <FeaturePage />,
    children: [
      { key: 'feature_page_tab', path: 'tab', element: <TabComponent /> },
    ],
  },
];

export default featureRoutes;
```

# Type And Enum Examples

```ts
export enum StatusEnum {
  Offline = 0,
  Online = 1,
}

type ItemT = {
  status: StatusEnum;
};

const isOnline = item.status === StatusEnum.Online;
```

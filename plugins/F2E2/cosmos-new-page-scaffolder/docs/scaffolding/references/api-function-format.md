# API Function Format Example

```ts
import axios, { AxiosResponse } from 'axios';
import { ApiResponse } from '@eysoos/utils';
import { apiUrl } from '../index';

export type GetXxxPayloadT = {
  websiteCode: string;
};

export type GetXxxResponseT = {
  enabled: boolean;
};

export default {
  async getXxx({
    websiteCode,
  }: GetXxxPayloadT): Promise<AxiosResponse<ApiResponse<GetXxxResponseT>>> {
    return await axios.get(`${apiUrl}/endpoint`, {
      params: { websiteCode },
    });
  },
};
```

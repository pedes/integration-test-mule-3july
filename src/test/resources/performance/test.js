import http from 'k6/http';

import { sleep } from 'k6';

export const options = {
  vus: 100,
  duration: '5s',
};

export default function () {
  http.get('https://orders-app-enw60f.5sc6y6-1.usa-e2.cloudhub.io/orders');
}
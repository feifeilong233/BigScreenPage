// 获取全球数据
// axios.get(api/overall)
import axios from 'axios';
export const overallJson = (code) => {
  return new Promise((resolve, inject) => {
    // 100000_full
    axios.get(`/datas/api/overall`).then((res) => {
      if (res.data.features) {
        resolve(res.data.features);
      } else {
        inject(res);
      }
    });
  });
};
// 获取全球每个省份
// axios.get(api/overall)
export const AreaallJson = (code) => {
  return new Promise((resolve, inject) => {
    // 100000_full
    axios
      .get(`/datas/api/area?latest=1&&country=中国&&sort=currentConfirmedCount`)
      .then((res) => {
        if (res) {
          resolve(res);
        } else {
          inject(res);
        }
      });
  });
};
export const apiAreaallJson = (code) => {
  return new Promise((resolve, inject) => {
    // 100000_full
    axios.get(`/apinews/ug/api/wuhan/app/data/list-total`).then((res) => {
      if (res) {
        resolve(res);
      } else {
        inject(res);
      }
    });
  });
};

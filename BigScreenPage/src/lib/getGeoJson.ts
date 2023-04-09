import axios from 'axios';
export const getGeoJson = (code) => {
  return new Promise((resolve, inject) => {
    // 100000_full
    axios.get(`/geojson/areas_v3/bound/geojson?code=${code}`).then((res) => {
      if (res.data.features) {
        resolve(res.data.features);
      } else {
        inject(res);
      }
    });
  });
};
export const getGeoJsonall = (code) => {
  return new Promise((resolve, inject) => {
    // 100000_full
    axios.get(`/geojson/areas_v3/bound/geojson?code=${code}`).then((res) => {
      if (res.data.features) {
        resolve(res);
      } else {
        inject(res);
      }
    });
  });
};

import TWEEN from '@tweenjs/tween.js';

// tween 轨迹动画
export const CameraAnmition = (camera, postArr) => {
  let cacheArr = [] as any;
  postArr.map((item) => {
    let { center, to, time } = item as {
      center: { x: number; y: number; z: number };
      to: { x: number; y: number; z: number };
      time: number;
    };
    cacheArr.push(cameraCon(center, to, time, camera));
  });
  for (let n = 0; n < cacheArr.length - 1; n++) {
    if (cacheArr[n + 1]) {
      cacheArr[n].chain(cacheArr[n + 1]);
    }
  }
  cacheArr[0].start();
};
function cameraCon(
  p1 = { x: 0, y: 0, z: 0 },
  p2 = { x: 30, y: 30, z: 30 },
  time = 6000,
  camera,
) {
  var tween1 = new TWEEN.Tween(p1)
    .to(p2, time || 200000)
    .easing(TWEEN.Easing.Quadratic.InOut);
  var update = function () {
    camera.position.set(p1.x, p1.y, p1.z);
  };
  tween1.onUpdate(update);
  return tween1;
}

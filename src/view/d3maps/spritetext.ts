import * as THREE from 'three';
// 地图中的文字标签
export const CreateLabel = (w, h, textArr, imgs) => {
  // canvas 宽高最好是2的倍数
  let width = w;
  let height = h;
  // 创建一个canvas元素 获取上下文环境
  let canvas = document.createElement('canvas');
  let ctx = canvas.getContext('2d') as any;
  canvas.width = width;
  canvas.height = height;
  // 设置样式
  ctx.textAlign = 'start';
  ctx.fillStyle = 'rgba(44, 62, 80, 0.65)';
  ctx.fillRect(0, 0, width, height);
  //添加背景图片，进行异步,否则可能会过早渲染,导致空白
  return new Promise((resolve, reject) => {
    let img = new Image();
    img.src = imgs;
    img.onload = () => {
      //将画布处理为透明
      ctx.clearRect(0, 0, width, height);
      //绘画图片
      ctx.drawImage(img, 0, 0, width, height);
      ctx.textBaseline = 'middle';
      // 由于文字需要自己排版 所以循环一下
      // item 是自定义的文字对象 包含文字内容 字体大小颜色 位置信息等
      ctx.font = '700 100px 微软雅黑';
      ctx.fillStyle = '#70e0f4';
      ctx.fillText(
        textArr,
        width / 2 - 50 * textArr.length,
        height / 2 + 10,
        1024,
      );
      let texture = new THREE.CanvasTexture(canvas);
      let spriteMaterial = new THREE.SpriteMaterial({
        map: texture, // 加载精灵材质的背景
        opacity: 1,
      });
      let sprite = new THREE.Sprite(spriteMaterial); // 创建精灵模型
      // 设置基本信息 就ok了
      sprite.scale.set(5, 2, 5);
      sprite.position.set(5, 2, 5);
      resolve(sprite);
    };
    //图片加载失败的方法
    img.onerror = (e) => {
      reject(e);
    };
  });
};

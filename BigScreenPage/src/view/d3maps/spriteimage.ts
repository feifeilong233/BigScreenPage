// 穿梭动画
import ImageSprite from 'image-sprite';
export const Spriteimage = (domName, lists, cb) => {
  var imageSprite = new ImageSprite(domName, {
    width: window.innerWidth,
    height: window.innerHeight,
    images: lists, // urls of your images
    mode: 'canvas',
    interval: 60,
    onLoaded: null, // once all images are loaded, will trigger this callback
    onUpdate: null, // will be invoked per frame while playing
    onComplete: null, // will be invoked once playing completed
  });
  imageSprite.play({ interval: 50 });
  changeOpacity(domName, 1);
  setTimeout(() => {
    changeOpacity(domName, 0);
    cb();
  }, 50 * (lists.length * 2));
};

const changeOpacity = (domName, val) => {
  Object.assign(document.getElementById(domName)?.style ?? {}, {
    opacity: val,
    transition: 'all .8s ease-in 0s',
  });
};

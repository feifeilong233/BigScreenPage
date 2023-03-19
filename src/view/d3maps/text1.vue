<template>
  <div>
    <div id="three-frame"></div>
    <div class="threedom"></div>
  </div>
</template>
<script lang="ts" setup>
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import { FlyControls } from 'three/examples/jsm/controls/FlyControls';
import { CSM } from 'three/examples/jsm/csm/CSM.js';
import * as d3 from 'd3';
import { getGeoJsonall } from '@/lib/getGeoJson';
import {
  CSS2DObject,
  CSS2DRenderer,
} from 'three/examples/jsm/renderers/CSS2DRenderer';
import Utils from './bars';
import { onMounted, ref } from 'vue';
import img from '../../assets/bgs.png';
import { CreateLabel } from './spritetext';
import img1 from '@/assets/starbg/BlueNebula2048_back.jpg';
import img2 from '@/assets/starbg/BlueNebula2048_bottom.jpg';
import img3 from '@/assets/starbg/BlueNebula2048_front.jpg';
import img4 from '@/assets/starbg/BlueNebula2048_left.jpg';
import img5 from '@/assets/starbg/BlueNebula2048_right.jpg';
import img6 from '@/assets/starbg/BlueNebula2048_top.jpg';
onMounted(() => {
  var scene = new THREE.Scene();
  // scene.background = new THREE.Color('#fff');
  // 星空背景
  // 顺序 右(right)，左(left)，上(top)，下(bttom)，后(back)，前(front)
  scene.background = new THREE.CubeTextureLoader().load([
    img5,
    img4,
    img6,
    img2,
    img1,
    img3,
  ]);
  var camera = new THREE.PerspectiveCamera(
    50,
    window.innerWidth / window.innerHeight,
    0.01,
    1000,
  );
  camera.position.set(0, 0, 50);
  camera.lookAt(0, 0, 0);
  var renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
  renderer.shadowMap.enabled = true; // 开启阴影

  renderer.setPixelRatio(window.devicePixelRatio);
  //   清除背景色，透明背景
  renderer.setClearColor(0x007fff, 1);
  renderer.setSize(window.innerWidth, window.innerHeight);
  document.getElementById('three-frame')?.appendChild(renderer.domElement);
  // 创建组
  let effectGroup = new THREE.Group();
  // 创建一个长方体几何体
  var geometry2 = new THREE.BoxGeometry(5, 5, 50);

  var material1 = new THREE.MeshBasicMaterial({});

  var cylinder = new THREE.Mesh(geometry2, material1);

  cylinder.rotation.x = -0.5 * Math.PI;
  cylinder.position.set(20, 10, 20);
  effectGroup.add(cylinder);
  effectGroup.traverse((a) => {
    console.log(a.type == 'Mesh');
    if (a.type == 'Mesh') {
      Utils.setCityMaterial(a);
    }
  });
  var geometry = new THREE.PlaneGeometry(1000, 1000, 1, 1);
  var material = new THREE.MeshBasicMaterial({ color: '#1f2937' });
  var floor = new THREE.Mesh(geometry, material);
  floor.material.side = THREE.DoubleSide;
  floor.rotation.x = 0.5 * Math.PI;
  // scene.add(floor);
  scene.add(effectGroup);
  // 方向控制
  var controls = new OrbitControls(camera, renderer.domElement); //创建控件对象
  // 滑动窗口惯性效果
  controls.enableDamping = true;
  controls.addEventListener('change', render);
  //  动画函数
  function render() {
    renderer.render(scene, camera);
  }
  // 时钟
  const clock = new THREE.Clock();
  // 精灵图标签
  const getTextCanvas = (w, h, textArr, imgs) => {
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
        textArr.forEach((item) => {
          ctx.font = '700 100px 微软雅黑';
          ctx.fillStyle = '#70e0f4';
          ctx.fillText(item, width / 2 - 50 * item.length, height / 2, 1024);
        });
        resolve(canvas);
      };
      //图片加载失败的方法
      img.onerror = (e) => {
        reject(e);
      };
    });
  };
  // getTextCanvas(500, 200, ['文字'], img).then((res) => {
  //   let texture = new THREE.CanvasTexture(res);
  //   console.log(texture);
  //   let spriteMaterial = new THREE.SpriteMaterial({
  //     map: texture, // 加载精灵材质的背景
  //     opacity: 1,
  //   });
  //   let sprite = new THREE.Sprite(spriteMaterial); // 创建精灵模型
  //   // 设置基本信息 就ok了
  //   sprite.scale.set(5, 2, 5);
  //   sprite.position.set(5, 2, 5);
  //   scene.add(sprite);
  // });
  CreateLabel(500, 200, '河北省', img).then((res) => {
    scene.add(res);
  });
  function renderanmi() {
    const dt = clock.getDelta();
    //  流动动画
    Utils.animate(dt);
    controls.update();
    renderer.render(scene, camera);
    window.requestAnimationFrame(renderanmi);
  }
  renderanmi();
});
</script>

<style>
#three-frame {
  width: 100vw;
  height: 100vh;
  /* background: green; */
}
</style>

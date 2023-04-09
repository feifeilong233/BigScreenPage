<template>
  <div>
    <div id="three-frame"></div>
    <div class="threedom">
      <div class="mountNode" id="mountNode"></div>
    </div>
    <div class="btns">
      <button @click="startclick">点击</button>
    </div>
  </div>
</template>
<script lang="ts" setup>
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import ImageSprite from 'image-sprite';
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
import { Spriteimage } from './spriteimage';
import { CameraAnmition } from './tweenanmi';
import { CreateLabel } from './spritetext';
import TWEEN from '@tweenjs/tween.js';
import img1 from '@/assets/cloud/1.webp';
import img2 from '@/assets/cloud/2.webp';
import img3 from '@/assets/cloud/3.jpg';
import img4 from '@/assets/cloud/4.jpg';
import img5 from '@/assets/cloud/5.webp';
import img6 from '@/assets/cloud/6.webp';
import img7 from '@/assets/cloud/7.webp';
import img8 from '@/assets/cloud/8.webp';
import img9 from '@/assets/cloud/9.webp';
import img10 from '@/assets/cloud/10.webp';
import img11 from '@/assets/cloud/11.webp';
import img12 from '@/assets/cloud/12.webp';
import img13 from '@/assets/cloud/13.webp';
// 穿云动画
const startclick = ref();
onMounted(() => {
  var scene = new THREE.Scene();
  scene.background = new THREE.Color('#fff');
  // 星空背景

  var camera = new THREE.PerspectiveCamera(
    50,
    window.innerWidth / window.innerHeight,
    0.01,
    1000,
  );
  camera.position.set(
    40.461172345236996,
    35.97141931406415,
    33.651273012410556,
  );
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
  // 事件动画
  // scene.remove
  startclick.value = () => {
    // 第一段动画
    CameraAnmition(camera, [
      {
        center: {
          x: 89.67626699596627,
          y: 107.58058095557215,
          z: 51.374711690741705,
        },
        to: {
          x: 89.67626699596627,
          y: 107.58058095557215,
          z: 51.374711690741705,
        },
        time: 300,
      },
      {
        center: {
          x: 89.67626699596627,
          y: 107.58058095557215,
          z: 51.374711690741705,
        },
        to: {
          x: 26.161626094679118,
          y: 87.52959110289915,
          z: 22.22735678679317,
        },
        time: 1000,
      },
      {
        center: {
          x: 26.161626094679118,
          y: 87.52959110289915,
          z: 22.22735678679317,
        },
        to: {
          x: 23.423599228180247,
          y: 32.38253053299535,
          z: 22.473901712741178,
        },
        time: 1000,
      },
    ]);
    // 第二段动画
    setTimeout(() => {
      Spriteimage(
        'mountNode',
        [
          img1,
          img2,
          img3,
          img4,
          img5,
          img6,
          img7,
          img8,
          img9,
          img10,
          img11,
          img12,
          img13,
        ],
        () => {
          // 移除渐变几何体
          scene.remove(effectGroup);
          // 相机动画
          CameraAnmition(camera, [
            {
              center: {
                x: 89.67626699596627,
                y: 107.58058095557215,
                z: 51.374711690741705,
              },
              to: {
                x: 89.67626699596627,
                y: 107.58058095557215,
                z: 51.374711690741705,
              },
              time: 300,
            },
            {
              center: {
                x: 89.67626699596627,
                y: 107.58058095557215,
                z: 51.374711690741705,
              },
              to: {
                x: 31.366485208227502,
                y: 42.7325471436067,
                z: 26.484221462746017,
              },
              time: 800,
            },
            {
              center: {
                x: 31.366485208227502,
                y: 42.7325471436067,
                z: 26.484221462746017,
              },
              to: {
                x: 32.19469382023058,
                y: 22.87664020700182,
                z: 27.742681212371384,
              },
              time: 1000,
            },
          ]);

          // 添加标签
          CreateLabel(500, 200, '河北省', img).then((res) => {
            scene.add(res);
          });
        },
      );
    }, 1500);
  };
  // 动画
  function renderanmi() {
    const dt = clock.getDelta();
    //  流动动画
    Utils.animate(dt);
    controls.update();
    renderer.render(scene, camera);
    TWEEN.update();
    // console.log(camera.position);
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
.threedom {
  width: 100vw;
  height: 100vh;
  position: fixed;
  background: #008c8c63;
  top: 0;
  pointer-events: none;
}
.mountNode {
  width: 100vw;
  height: 100vh;
  opacity: 0;
  /* transition: all .8s ease-in 0s; */
}
.btns {
  width: 100vw;
  height: 100vh;
  position: fixed;
  background: #7097f763;
  top: 0;
}
</style>

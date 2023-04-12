<template>
  <div class="echartsdoms flex flex-col px-5">
    <div class="echartsdoms_header flex justify-center w-full">
      <div class="bigtitle w-full">
        <div class="xline"></div>
        <div class="titlbox">
          <div class="border1"></div>
          <div class="border1"></div>
          <div class="border1"></div>
          <div>沥青路面数字孪生试验平台</div>
          <div></div>
        </div>
      </div>
    </div>
    <div class="echartsdoms_cons w-full flex justify-between">
      <div id="three-frame"></div>
      <div class="chartsdoms_cons_rights space-y-2 w-22vw">
        <div class="box1 enter-x-r w-22vw">
          <div class="title1">测试指数</div>
          <div class="h-40vh box-body">
            <a-row v-for="(item, index) in roadValue" :key="index" type="flex" align="middle">
              <a-col :span="4">
                <span>road_{{index}}</span>
              </a-col>
              <a-col :span="12">
                <a-slider @afterChange="onChange" v-model:value="item.value" :min="0" :max="0.5" :step="0.01"/>
              </a-col>
              <a-col :span="4">
                <a-input-number
                    @change="onChange"
                    v-model:value="item.value"
                    :min="0"
                    :max="0.5"
                    :step="0.01"
                    style="margin-left: 16px"
                />
              </a-col>
            </a-row>
          </div>
        </div>
        <div class="box1 enter-x-r w-22vw">
          <div class="title1">测试指数</div>
          <div class="h-40vh">

          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import 'virtual:windi.css';
import {defineAsyncComponent, ref} from 'vue';
import {onMounted} from '@vue/runtime-core';

import * as THREE from 'three';
import {GLTFLoader} from 'three/examples/jsm/loaders/GLTFLoader';
import {OrbitControls} from "three/examples/jsm/controls/OrbitControls"

let roadValue = ref([]);
roadValue.value = [
  {
    code: 0,
    value: 0.04,
  },
  {
    code: 1,
    value: 0.08,
  },
  {
    code: 2,
    value: 0.12,
  },
  {
    code: 3,
    value: 0.24,
  },
  {
    code: 4,
    value: 0.4,
  },
  {
    code: 5,
    value: 0.5,
  },
]

onMounted(() => {
  initMode();
});

let scene, camera, controls;
let idName = ref('three-frame');
//创建场景渲染
const renderer = new THREE.WebGLRenderer();
//添加gltf
let loader = new GLTFLoader()

const initMode = () => {
  scene = new THREE.Scene();
  const width = document.getElementById(idName.value)?.offsetWidth;//窗口宽度
  const height = document.getElementById(idName.value)?.offsetHeight;//窗口高度

  camera = new THREE.PerspectiveCamera(85, width / height, 0.1, 1000000);
  camera.position.set(0, 20, 80);
  camera.lookAt(scene.position);

  //灯光效果
  const point = new THREE.PointLight(0xffffff);
  point.position.set(400, 200, 300);
  scene.add(point);
  const ambient = new THREE.AmbientLight(0xffffff);
  scene.add(ambient);

  renderer.setSize(width, height);
  renderer.setClearColor(0xb9d3ff, 1);
  document.getElementById(idName.value)?.appendChild(renderer.domElement);

  loader.load('/road_gltf_7/New_road_7.gltf', (gltf) => {
    scene.add(gltf.scene);
    mouseMove();
    animate();
  });
}

// 渲染内容
const render = () => {
  renderer.render(scene, camera);
};

const mouseMove = () => {
  controls = new OrbitControls(camera, renderer.domElement); //创建控件对象
  controls.addEventListener('change', render);
};

// 压路机动画
let dir = 1;
const animate = () => {
  render();
  const car = scene.children[2].children[0].children[0].children;
  const i = [car[0].position.y, car[1].position.y, car[2].position.y, car[3].position.y, car[4].position.y];
  if (i[0] < 100 && dir == 1) {
    car[0].position.y = i[0] + 1;
    car[1].position.y = i[1] + 1;
    car[2].position.y = i[2] + 1;
    car[3].position.y = i[3] + 1;
    car[4].position.y = i[4] + 1;
  } else {
    dir = -1;
  }
  if (i[0] > -180 && dir == -1) {
    car[0].position.y = i[0] - 1;
    car[1].position.y = i[1] - 1;
    car[2].position.y = i[2] - 1;
    car[3].position.y = i[3] - 1;
    car[4].position.y = i[4] - 1;
  } else {
    dir = 1;
  }
  requestAnimationFrame(animate);
}

// 修改模型数据
const onChange = () => {
  // 循环删除从第3项开始的子场景
  for(let i=2; i<scene.children.length; i++){
    scene.remove(scene.children[i]);
  }
  console.log(scene);

  const H = [];

  roadValue.value.forEach(item => {
    H.push(parseFloat(item.value)*3);
  });

  console.log(H)
  model_load(H);
}


//找到目标模型
const FindTarget = (obj, target) => {
  obj = obj.scene;
  let i = 0;
  let j = 0;
  const mycars = [];
  while (i < 16) {
    if (obj.children[0].children[i].name.search(target) != -1) {
      mycars[j] = i;
      j = j + 1;
    }
    i = i + 1;
  }
  return mycars;
}

// 修改材质
const ChangeTexture = (obj, target, img_path) => {
  obj = obj.scene;
  const texture = new THREE.TextureLoader().load(img_path);
  texture.encoding = THREE.sRGBEncoding;
  texture.flipY = false;
  texture.needsUpdate = true;
  texture.wrapS = THREE.RepeatWrapping;
  texture.wrapT = THREE.RepeatWrapping;
  texture.repeat.set(1, 1);

  //新建材质
  obj.children[0].children[target].material = new THREE.MeshStandardMaterial({map: texture});
  obj.children[0].children[target].material.needsUpdate = true;
}

// 修改路面厚度
const ChangeDepth = (obj, target, h) => {
  obj = obj.scene;
  obj.children[0].children[target].geometry.attributes.position.data.array[2] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[10] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[34] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[58] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[66] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[74] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[82] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[90] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[106] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[114] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[162] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[186] = h;
  obj.children[0].children[target].geometry.attributes.position.data.array[7] = -1.0137795209884644;
  obj.children[0].children[target].geometry.attributes.position.data.array[15] = -1.0137795209884644;
}
// 改变模型位置
const ChangePosition = (obj, target, z) => {
  obj = obj.scene;
  obj.children[0].children[target].position.z = z;
}

let loader2 = new GLTFLoader()
const model_load = (H) => {
  let obj;
  loader2.load('/road_gltf_7/New_road_7.gltf', (gltf) => {
    obj = gltf;
    const ary = ["road_5", "road_4", "road_3", "road_2", "road_1", "road_0", "绿化带"];
    // const texture = ["New_road_7_img_007.png", "New_road_7_img_000.jpg", "New_road_7_img_005.jpg", "New_road_7_img_002.jpg", "New_road_7_img_003.jpg", "New_road_7_img_001.jpg"];
    let j = 5;
    let z = 3.28084;
    FindTarget(obj, ary[0]);
    while (j > -1) {
      const i = FindTarget(obj, ary[5 - j]);
      console.log("*********" + i);
      let n = 0;
      while (n < i.length) {
        // ChangeTexture(obj, i[n], "/road_gltf_7/" + texture[te[j] - 1]);
        ChangePosition(obj, i[n], z);
        ChangeDepth(obj, i[n], H[j]);
        n = n + 1;
      }
      z = z + H[j];
      j--;
    }
    const car = FindTarget(obj, "Caterpillar");
    console.log(car);
    let m = 0;
    while (m < 5) {
      obj.scene.children[0].children[car[0]].children[m].position.z = z;
      m++;
    }
    ChangeDepth(obj, FindTarget(obj, ary[5 - j])[0], z - 3.28084 + 0.3);
    scene.add(gltf.scene);
    render();
    animate();
    console.log(scene);
  });
}
</script>

<style lang="less" scoped>
#three-frame {
  width: 100%;
  height: 100%;
  background: rgba(153, 150, 150, 0.738);
}

.xline {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 10px;

  background: linear-gradient(to right,
  transparent,
  rgba(251, 191, 36, 0.3),
  transparent,
  rgba(251, 191, 36, 0.3),
  transparent);
  transform: translateY(-100px);
  animation: doms 0.5s linear forwards;
  animation-delay: 0.7s;
}

.bigtitle {
  display: flex;
  justify-content: center;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 40px;

  .titlbox {
    width: 28rem;
    height: 100%;
    overflow: hidden;
    position: relative;

    & > div {
      position: absolute;
      width: 100%;
      top: 0;
      left: 0;
      //  background: red;
      &:nth-of-type(1) {
        width: 80%;
        left: 10%;
        border: 100px solid rgba(251, 191, 36, 0.3);
        border-left: 80px solid transparent;
        border-right: 80px solid transparent;
        transform: translateY(-100px);
        animation: doms 0.5s linear forwards;
        animation-delay: 0.2s;
        opacity: 0;
        z-index: 9;
      }

      &:nth-of-type(2) {
        width: 90%;
        left: 5%;
        border: 100px solid rgba(251, 191, 36, 0.2);
        border-left: 80px solid transparent;
        border-right: 80px solid transparent;
        transform: translateY(-100px);
        animation: doms 0.5s linear forwards;
        animation-delay: 0.3s;
        opacity: 0;
      }

      &:nth-of-type(3) {
        width: 100%;
        border: 100px solid rgba(251, 191, 36, 0.1);
        border-left: 140px solid transparent;
        border-right: 140px solid transparent;
        transform: translateY(-100px);
        animation: doms 0.5s linear forwards;
        animation-delay: 0.4s;
        opacity: 0;
      }

      &:nth-of-type(4) {
        width: 100%;
        text-align: center;
        font-weight: 600;
        color: #c9dcf5;
        font-size: 1.2rem;
        z-index: 10;
        transform: translateY(100px);
        padding-top: 0.2rem;
        animation: doms 0.5s linear forwards;
        font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
        'Lucida Sans', Arial, sans-serif;
      }

      &:nth-of-type(5) {
        width: 80%;
        left: 10%;
        height: 10px;
        top: 38px;
        background: linear-gradient(to right,
        transparent,
        rgba(115, 208, 245, 0.7),
        transparent);
        z-index: 9;
      }
    }
  }
}

@keyframes doms {
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

.echartsdoms {
  width: 100%;
  height: 100%;

  .maobg {
    background: rgba(193, 189, 189, 0.1);
    backdrop-filter: blur(4px);
  }

  .title1 {
    color: #c9dcf5;
    border-bottom: 2px solid #525c66;
    padding: 0.3rem 0.5rem;
    position: relative;
    font-size: 0.8rem;
    font-weight: bold;

    &::before {
      content: '';
      display: inline-block;
      background: rgba(251, 191, 36, 1);
      width: 3px;
      height: 100%;
      position: absolute;
      left: 0;
      top: 0;
    }
  }

  &_cons {
    .txt1 {
      color: #c9dcf5;
      font-size: 8px;
    }

    .chartsdoms_cons_rights {
      .box1 {
        .maobg;

        .box-body {
          padding: 24px;
        }
      }
    }
  }
}
</style>

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
      <div id="map"></div>
      <div class="chartsdoms_cons_rights space-y-2 w-30vw">
        <div class="box1 enter-x-r w-30vw">
          <a-card class="h-40vh" title="测试指数" size="small">
            <a-row v-for="(item, index) in roadValue" :key="index" type="flex" align="middle" :gutter="12">
              <a-col :span="8">
                <a-select @change="onChange" style="width: 100%" v-model:value="item.code">
                  <a-select-option v-for="(item, index) in code_data" :key="index" :value="item.code"> {{ item.name }}
                  </a-select-option>
                </a-select>
              </a-col>
              <a-col :span="8">
                <a-slider @afterChange="onChange" v-model:value="item.order_by" :min="0" :max="0.5" :step="0.01"/>
              </a-col>
              <a-col :span="4">
                <a-input-number
                    @change="onChange"
                    v-model:value="item.order_by"
                    :min="0"
                    :max="0.5"
                    :step="0.01"
                />
              </a-col>
            </a-row>
            <a-space>
              <div>场景选择器:</div>
              <a-select @change="onChangeSkyBox" style="width: 100px" v-model:value="skyBox">
                <a-select-option value="sky_1">
                  场景1
                </a-select-option>
                <a-select-option value="sky_2">
                  场景2
                </a-select-option>
                <a-select-option value="sky_3">
                  场景3
                </a-select-option>
              </a-select>
              <a-button @click="handleSubmit" style="margin-left: 66px">保存</a-button>
              <a-button ghost type="primary">进入分析</a-button>
            </a-space>
          </a-card>
        </div>
        <div class="box1 enter-x-r w-30vw">
          <div class="title1">路面结构</div>
          <div class="h-45vh">
            <div id="container3D"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import 'virtual:windi.css';
import {computed, ref} from 'vue';
import {onMounted, onBeforeUnmount} from '@vue/runtime-core';
import Render3DEcharts from './useEchart.ts'

import * as THREE from 'three';
import {GLTFLoader} from 'three/examples/jsm/loaders/GLTFLoader';
import {OrbitControls} from "three/examples/jsm/controls/OrbitControls"
import {CreateLabel} from "@/views/dashboard/lib/spritetext";
import border1 from "@/assets/bgs.png";
import {findDictionaryList} from "@/api/system/dictionary";
import {SkyboxUtils} from '@/lib/threeUtils.ts';
import {useRoute} from "vue-router";
import {getTdemoById, saveOrUpdate} from "@/api/common/tdemo";
import {message} from "ant-design-vue";

let roadValue = ref([]);
let skyBox = ref('sky_2');
/*roadValue.value = [
  {
    code: 'AC13',
    order_by: 0.05,
  },
  {
    code: 'AC20',
    order_by: 0.07,
  },
  {
    code: 'AC25',
    order_by: 0.03,
  },
  {
    code: 'CS',
    order_by: 0.27,
  },
  {
    code: 'GB',
    order_by: 0.31,
  },
  {
    code: 'CBG25',
    order_by: 0.33,
  },
]*/

onMounted(() => {
  initData();
  initMode();
});

onBeforeUnmount(()=>{
  document.getElementById(idName.value)?.removeEventListener('click', onMouseClick);
  window.removeEventListener('resize', onWindowResize);
  controls.removeEventListener('change', render);
});

const code_data = ref([]);
const route = useRoute();

const initData = () => {
  getTdemoById(route.query.id).then((response) => {
    roadValue.value = response.data.data;
    renderEcharts();
  })
  findDictionaryList({parent_code: 'lmcl'}).then((response) => {
    code_data.value = response.data.data;
  })
}

const handleSubmit = () => {
  new Promise((resolve, reject) => {
    saveOrUpdate(roadValue.value).then((response) => {
      resolve(roadValue.value);
    });
  }).then((res) => {
    message.info("修改成功");
  });
}

let scene, camera, controls;
let idName = ref('map');
// 创建场景渲染
const renderer = new THREE.WebGLRenderer();
// 添加gltf
let loader = new GLTFLoader()
let width, height;

const initMode = () => {
  scene = new THREE.Scene();
  width = document.getElementById(idName.value)?.offsetWidth;//窗口宽度
  height = document.getElementById(idName.value)?.offsetHeight;//窗口高度

  camera = new THREE.PerspectiveCamera(50, width / height, 0.1, 1000000);
  camera.position.set(-20, 8.5, 80);
  camera.lookAt(scene.position);

  // 灯光效果
  const point = new THREE.PointLight(0xffffff);
  point.position.set(400, 200, 300);
  scene.add(point);
  const ambient = new THREE.AmbientLight(0xffffff);
  scene.add(ambient);

  renderer.setSize(width, height);
  renderer.setClearColor(0xb9d3ff, 1);
  document.getElementById(idName.value)?.appendChild(renderer.domElement);

  SkyboxUtils.createSkyFromTextures("sky_2").then(texture => {
    scene.background = texture;
  });

  loader.load('/road_gltf_7/New_road_7.gltf', (gltf) => {
    scene.add(gltf.scene);
    mouseMove();
    animate();
  });

  document.getElementById(idName.value)?.addEventListener('click', onMouseClick);
  window.addEventListener('resize', onWindowResize);
}

const onWindowResize = () => {
  width = document.getElementById(idName.value)?.offsetWidth;//窗口宽度
  height = document.getElementById(idName.value)?.offsetHeight;//窗口高度
  camera.aspect = width / height;
  camera.updateProjectionMatrix();
  renderer.setSize(width, height);
  render();
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

const onChangeSkyBox = () => {
  SkyboxUtils.createSkyFromTextures(skyBox.value).then(texture => {
    scene.background = texture;
  });
}

// 修改模型数据
const onChange = () => {
  renderEcharts();
  const len = scene.children.length;
  for (let i = 2; i < len; i++) {
    scene.remove(scene.children[2]);
  }

  const H = [];
  const te = [];


  roadValue.value.forEach(item => {
    H.push(parseFloat(item.order_by) * 3);
    te.push(item.code);
  });

  model_load(H, te);
}

const renderEcharts = () => {
  const dataset = [];
  roadValue.value.forEach(item => {
    const value = item.order_by * 100;
    dataset.push([0.5, 0.5, value]);
  });
  Render3DEcharts('container3D', dataset.reverse());
}

// 文字标签
const Texttags = (text, posi) => {
  CreateLabel(720, 150, text, border1, posi).then((res) => {
    scene.add(res);
  });
};

let selectObject, OBJ;

const onMouseClick = (event) => {
  console.log(camera.position)
  // 获取 raycaster 和所有模型相交的数组，其中的元素按照距离排序，越近的越靠前
  const intersects = getIntersects(event);

  // 获取选中最近的 Mesh 对象
  selectObject = undefined;
  if (intersects.length != 0 && intersects[0].object instanceof THREE.Mesh) {
    selectObject = intersects[0].object;
    changeMaterial(selectObject);
    if (OBJ != selectObject && OBJ != null) {
      changeColor(OBJ);
      OBJ = selectObject;
    }
    OBJ = selectObject;
  }

  // 循环删除从第4项开始的子场景
  const arr = scene.children.length;
  for (let i = 3; i < arr; i++) {
    scene.remove(scene.children[3]);
  }

  if (selectObject != undefined && selectObject != null) {
    const str = selectObject.name.split('_');
    const roadName = str[1] > 100 ? str[0] : getCode(parseInt(str[1])+1);
    const text = roadName + " " + (selectObject.geometry.attributes.position.data.array[2] / 3).toFixed(2);
    Texttags(text, [selectObject.position.x / 10 + 12, selectObject.position.y + 35, selectObject.position.z + 43])
  }
}

// 计算属性，根据record.code翻译出对应的code值
const getCode = (code) => {
  const item = code_data.value.find((item) => item.order_by == code);
  return item ? item.name : code;
};

// 获取与射线相交的对象数组
const getIntersects = (event) => {
  event.preventDefault();

  // 声明 raycaster 和 mouse 变量
  const raycaster = new THREE.Raycaster();
  const mouse = new THREE.Vector2();

  // 获取渲染容器的位置和大小
  const containerBounds = document.getElementById(idName.value)?.getBoundingClientRect();

  // 通过鼠标点击位置，计算出鼠标点击事件在渲染容器内的相对位置
  mouse.x = ((event.clientX - containerBounds.left) / containerBounds.width) * 2 - 1;
  mouse.y = -((event.clientY - containerBounds.top) / containerBounds.height) * 2 + 1;

  // 通过鼠标点击的位置(二维坐标)和当前相机的矩阵计算出射线位置
  raycaster.setFromCamera(mouse, camera);

  // 获取与raycaster射线相交的数组集合，其中的元素按照距离排序，越近的越靠前
  // 返回选中的对象数组
  return raycaster.intersectObjects(scene.children, true);
}

// 改变对象材质属性
const changeColor = (object) => {
  object.material.color.r = 1;
}

const changeMaterial = (object) => {
  object.material.color.r = 0;
}

// 找到目标模型
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
  const textureLoader = new THREE.TextureLoader();

  // 加载纹理图像
  textureLoader.load(img_path, (texture) => {
    texture.encoding = THREE.sRGBEncoding;
    texture.flipY = false;
    texture.wrapS = THREE.RepeatWrapping;
    texture.wrapT = THREE.RepeatWrapping;
    texture.repeat.set(1, 1);

    // 将纹理图像应用到材质
    // obj.children[0].children[target].material.map = texture;
    // 新建材质
    obj.children[0].children[target].material = new THREE.MeshStandardMaterial({map: texture});
    obj.children[0].children[target].material.needsUpdate = true;
  });
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
const model_load = (H, te) => {
  let obj;
  loader2.load('/road_gltf_7/New_road_7.gltf', (gltf) => {
    obj = gltf;
    const ary = ["road_5", "road_4", "road_3", "road_2", "road_1", "road_0", "绿化带"];
    let j = 5;
    let z = 3.28084;
    FindTarget(obj, ary[0]);
    while (j > -1) {
      const i = FindTarget(obj, ary[5 - j]);
      let n = 0;
      while (n < i.length) {
        const path = "/road_gltf_7/New_road_7_img_" + te[j] + (te[j] == 'AC13' ? ".png" : ".jpg");
        ChangeTexture(obj, i[n], path);
        ChangePosition(obj, i[n], z);
        ChangeDepth(obj, i[n], H[j]);
        n = n + 1;
      }
      z = z + H[j];
      j--;
    }
    const car = FindTarget(obj, "Caterpillar");
    let m = 0;
    while (m < 5) {
      obj.scene.children[0].children[car[0]].children[m].position.z = z;
      m++;
    }
    ChangeDepth(obj, FindTarget(obj, ary[5 - j])[0], z - 3.28084 + 0.3);
    scene.add(gltf.scene);
    render();
    animate();
  });
}
</script>

<style lang="less" scoped>
#map {
  width: 100%;
  height: 100%;
}

#container3D {
  width: 100%;
  height: 100%;
}

.xline {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 10px;

  background: linear-gradient(to right,
  transparent,
  rgba(6, 141, 193, 0.3),
  transparent,
  rgba(6, 141, 193, 0.3),
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
        border: 100px solid rgba(6, 141, 193, 0.3);
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
        border: 80px solid rgba(6, 141, 193, 0.2);
        border-left: 80px solid transparent;
        border-right: 80px solid transparent;
        transform: translateY(-100px);
        animation: doms 0.5s linear forwards;
        animation-delay: 0.3s;
        opacity: 0;
      }

      &:nth-of-type(3) {
        width: 100%;
        border: 100px solid rgba(6, 141, 193, 0.1);
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
        // background: url('../../../../assets/header.png');
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
    color: rgba(0, 0, 0, 0.85);
    border-bottom: 2px solid #525c66;
    padding: 0.3rem 0.5rem;
    position: relative;
    font-size: 0.8rem;
    font-weight: bold;

    &::before {
      content: '';
      display: inline-block;
      background: #8ce1fb;
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
      }
    }
  }
}
</style>

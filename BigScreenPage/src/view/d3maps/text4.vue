<template>
  <div id="three-frame"></div>
</template>

<script lang="ts" setup>
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import { FirstPersonControls } from 'three/examples/jsm/controls/FirstPersonControls.js';

import { CSM } from 'three/examples/jsm/csm/CSM.js';
import * as d3 from 'd3';
import { getGeoJsonall } from '@/lib/getGeoJson';
import { onMounted, ref } from 'vue';
onMounted(() => {
  var scene = new THREE.Scene();
  scene.background = new THREE.Color('#000000');
  var camera = new THREE.PerspectiveCamera(
    50,
    window.innerWidth / window.innerHeight,
    0.01,
    1000,
  );
  camera.position.set(0, -40, 50);
  camera.lookAt(0, 0, 0);
  var renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
  renderer.shadowMap.enabled = true; // 开启阴影

  renderer.setPixelRatio(window.devicePixelRatio);
  //   清除背景色，透明背景
  renderer.setClearColor(0x007fff, 1);
  renderer.setSize(window.innerWidth, window.innerHeight);
  document.getElementById('three-frame')?.appendChild(renderer.domElement);
  var geom = new THREE.BoxGeometry(5, 26, 5);
  //  加载图片材质
  var texture = new THREE.TextureLoader().load('大气.png');
  var mate = new THREE.ShaderMaterial({
    uniforms: {
      time: { value: -1.0 },
      pointTexture: {
        value: texture,
      },
    },
    vertexShader: ` 
    varying vec2 vUv;
    void main(){ 
      vUv = uv; 
      gl_Position = projectionMatrix*viewMatrix*modelMatrix*vec4( position, 1.0 );
    }
    `,
    fragmentShader: ` 
      uniform float time; 
      uniform sampler2D pointTexture; 
      varying vec2 vUv;
      void main() {
        vec2 newT = vUv + vec2( -0.02, 0.02 ) * time; 
        gl_FragColor = texture2D( pointTexture, newT ); 
        gl_FragColor.a = 0.6;
      }
    `,
  });
  var mesh = new THREE.Mesh(geom, mate);
  scene.add(mesh);
  // 方向光1
  var directionalLight = new THREE.DirectionalLight(0xffffff, 0.9);
  directionalLight.position.set(400, 200, 300);
  scene.add(directionalLight);
  // 方向光2
  var directionalLight2 = new THREE.DirectionalLight(0xffffff, 0.9);
  directionalLight2.position.set(-400, -200, -300);
  scene.add(directionalLight2);
  //环境光
  var ambient = new THREE.AmbientLight(0xffffff, 0.6);
  scene.add(ambient);
  //   地板
  var geometry = new THREE.PlaneGeometry(1000, 1000, 1, 1);
  var material = new THREE.MeshBasicMaterial({ color: '#1f2937' });
  var floor = new THREE.Mesh(geometry, material);
  floor.material.side = THREE.DoubleSide;
  floor.rotation.x = 0.5 * Math.PI;
  scene.add(floor);
  // 方向控制
  var controls = new FirstPersonControls(camera, renderer.domElement); //创建控件对象
  //   controls.addEventListener('change', render);
  controls.lookSpeed = 0.4; //鼠标移动查看的速度
  controls.movementSpeed = 20; //相机移动速度
  controls.noFly = false;
  controls.lookVertical = false;
  controls.constrainVertical = false; //约束垂直
  controls.verticalMin = 1.0;
  controls.verticalMax = 2.0;
  controls.lon = -150; //进入初始视角x轴的角度
  controls.lat = 120; //初始视角进入后y轴的角度
  //  动画函数
  var clock = new THREE.Clock();
  function renderanmi() {
    var deltaTime = clock.getDelta();
    renderer.render(scene, camera);
    controls.update(deltaTime);
    requestAnimationFrame(renderanmi);
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

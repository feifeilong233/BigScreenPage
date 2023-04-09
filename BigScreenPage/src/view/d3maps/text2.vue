<template>
  <div id="three-frame"></div>
</template>

<script lang="ts" setup>
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
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
  // 方向控制
  var controls = new OrbitControls(camera, renderer.domElement); //创建控件对象
  controls.addEventListener('change', render);
  //  动画函数
  var clock = new THREE.Clock();
  function render() {
    renderer.render(scene, camera);
  }
  let nums = 0;
  function renderanmi() {
    var deltaTime = clock.getDelta();
    renderer.render(scene, camera);
    nums += 0.3;
    nums = nums > 100 ? 0 : nums;
    mate.uniforms.time.value = nums;
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

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
  var geometry3 = new THREE.PlaneGeometry(100, 100, 10, 10);
  var materiald = new THREE.MeshBasicMaterial({
    color: '#ff0000',
    side: THREE.DoubleSide,
  });
  materiald.wireframe = true;
  let mesh = new THREE.Mesh(geometry3, materiald);
  // 由于平地添加后默认是在正前方 所以需要旋转一下
  // mesh.rotation.x = -0.5 * Math.PI;
  mesh.position.y = -1;
  mesh.position.z = -0.5;
  // 圆环
  const geometry2 = new THREE.RingGeometry(0.5, 0.3, 50);
  // transparent 设置 true 开启透明
  const material2 = new THREE.MeshBasicMaterial({
    color: 'yellow',
    side: THREE.DoubleSide,
    transparent: true,
  });
  const circleY = new THREE.Mesh(geometry2, material2);
  // 绘制地图时 y轴取反 这里同步
  circleY.position.set(1, 2, -0.5);
  circleY.scale.set(10, 10, 1);

  scene.add(circleY);
  // 圆环3
  const geometry3a = new THREE.RingGeometry(0.6, 0.7, 50);
  // transparent 设置 true 开启透明
  const material3 = new THREE.MeshBasicMaterial({
    color: 'yellow',
    side: THREE.DoubleSide,
    transparent: true,
  });
  const circleY2 = new THREE.Mesh(geometry3a, material3);
  // 绘制地图时 y轴取反 这里同步
  circleY2.position.set(1, 2, -0.5);
  circleY2.scale.set(1.5, 1.5, 1);

  scene.add(circleY2);
  // 半圆环3
  const geometry4a = new THREE.RingGeometry(0.6, 0.7, 50, 0.6, 1, 3);
  // transparent 设置 true 开启透明
  const material4 = new THREE.MeshBasicMaterial({
    color: 'yellow',
    side: THREE.DoubleSide,
    transparent: true,
  });
  const circleY4 = new THREE.Mesh(geometry4a, material4);
  // 绘制地图时 y轴取反 这里同步
  circleY4.position.set(1, 2, -0.5);
  circleY4.scale.set(2, 2, 1);
  circleY4.rotation.z = 0.3;
  scene.add(circleY4);
  // 椎体
  var geometry = new THREE.ConeBufferGeometry(0.8, 15, 32);

  var material1 = new THREE.MeshBasicMaterial({
    color: 'yellow',
    transparent: true,
    opacity: 0.6,
  });
  var cylinder = new THREE.Mesh(geometry, material1);

  cylinder.rotation.x = 0.5 * Math.PI;
  cylinder.position.set(1, 2, 7);

  scene.add(cylinder);
  scene.add(mesh);
  let nums = 3;
  render();
  var controls = new OrbitControls(camera, renderer.domElement); //创建控件对象
  controls.addEventListener('change', render);
  function render() {
    renderer.render(scene, camera);
  }
  let rotates = 0;
  //  动画函数
  function renderanmi() {
    nums -= 0.02;
    rotates += 0.0;
    rotates = rotates > 6.5 ? 0 : rotates;
    nums = nums < 0.01 ? 3 : nums;
    circleY.material.opacity = 3 / (3 - nums);
    circleY.material.opacity = nums;
    circleY.scale.set(1 + (3 - nums), 1 + (3 - nums), -0.5);
    circleY4.rotation.z = rotates;
    renderer.render(scene, camera);
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

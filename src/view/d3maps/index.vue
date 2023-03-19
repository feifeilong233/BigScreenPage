<template>
  <div>
    <div id="three-frame" ref="doms"></div>
  </div>
</template>

<script lang="ts">
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import * as d3 from 'd3';
import { getGeoJsonall } from '@/lib/getGeoJson';
import { ref } from 'vue';
let doms = ref();
// 圆环网格对象组
const circleYs: any = [];
getGeoJsonall('100000_full').then((e) => {
  initMaps(e.data.features);
});
const initMaps = (e) => {
  console.log(e);
  //  場景
  var scene = new THREE.Scene();
  scene.background = null;
  //  相机
  var camera = new THREE.PerspectiveCamera(
    45,
    window.innerWidth / window.innerHeight,
    0.1,
    1000,
  );
  camera.position.set(0, -40, 70);
  camera.lookAt(0, 0, 0);
  //  渲染器
  var renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
  renderer.shadowMap.enabled = true; // 开启阴影
  renderer.shadowMap.type = THREE.PCFSoftShadowMap;
  renderer.toneMapping = THREE.ACESFilmicToneMapping;
  renderer.toneMappingExposure = 1.25;
  //   跳转颜色
  renderer.outputEncoding = THREE.sHSVEncoding;
  renderer.setPixelRatio(window.devicePixelRatio);
  //   清除背景色，透明背景
  renderer.setClearColor(0x007fff, 1);
  renderer.setSize(window.innerWidth, window.innerHeight);
  document.getElementById('three-frame')?.appendChild(renderer.domElement);

  const color = '#008c8c';
  const province = new THREE.Object3D();
  const projection = d3
    .geoMercator()
    .center([104.0, 37.5])
    .scale(80)
    .translate([0, 0]);
  e.forEach((item, index) => {
    let cod = item.geometry.coordinates[0];
    cod = cod.length > 1 ? [[...cod]] : cod;
    cod.forEach((polygon) => {
      const shape = new THREE.Shape();
      const lineGeometry = new THREE.BufferGeometry();
      const pointsArray = new Array();
      for (let i = 0; i < polygon.length; i++) {
        // projection -- 坐标转化
        let [x, y] = projection(polygon[i]);
        pointsArray.push(new THREE.Vector3(x, -y, 3));
        if (i === 0) {
          shape.moveTo(x, -y);
        }
        shape.lineTo(x, -y);
      }
      // 添加多个 线
      lineGeometry.setFromPoints(pointsArray);
      const lineMaterial = new THREE.LineBasicMaterial({
        color: color,
      });
      // 创建线
      let lines = new THREE.Line(lineGeometry, lineMaterial);
      scene.add(lines);

      const extrudeSettings = {
        depth: 4,
        bevelEnabled: true,
        bevelSegments: 1,
        bevelThickness: 0.2,
      };
      const geometry = new THREE.ExtrudeGeometry(shape, extrudeSettings);
      const material = new THREE.MeshBasicMaterial({
        color: `#007fff`,
        transparent: true,
        opacity: 1,
      });
      const material1 = new THREE.MeshBasicMaterial({
        metalness: 0.3,
        color: '#f40',
        opacity: 0.3,
      });
      const mesh = new THREE.Mesh(geometry, [material, material1]);
      // 地图厚度
      mesh.scale.set(1, 1, 0.7);
      // 给mesh开启阴影
      mesh.castShadow = true;
      mesh.receiveShadow = true;
      mesh._color = color;
      province.add(mesh);
    });
  });

  scene.add(province);
  addlight();
  render();
  var controls = new OrbitControls(camera, renderer.domElement); //创建控件对象
  controls.addEventListener('change', render);

  function render() {
    renderer.render(scene, camera); //执行渲染操作
  }
  function addlight() {
    const light = new THREE.DirectionalLight(0xffffff, 0.5);
    const light1 = new THREE.PointLight(0xff0000, 1, 100);
    const spotLight = new THREE.SpotLight(0xffffff);
    light.position.set(20, -50, 20);
    light.castShadow = true;
    light.shadow.mapSize.width = 1024;
    light.shadow.mapSize.height = 1024;
    const projection = d3
      .geoMercator()
      .center([104.0, 37.5])
      .scale(80)
      .translate([0, 0]);
    const line = lineConnect(
      projection([106.557691, 29.559296]),
      projection([121.495721, 31.236797]),
    );
    scene.add(line);
    scene.add(light1);
    scene.add(spotLight);
    scene.add(light);
    // window.addEventListener('mousemove', setRaycaster, false)
  }
  // 通过canvas 获取坐标
  function getCanvasRelativePosition(event) {
    const rect = renderer.domElement.getBoundingClientRect();
    return {
      x: ((event.clientX - rect.left) * renderer.domElement.width) / rect.width,
      y:
        ((event.clientY - rect.top) * renderer.domElement.height) / rect.height,
    };
  }
  function setPickPosition(event) {
    let pickPosition = { x: 0, y: 0 };

    // 计算后 以画布 开始为 （0，0）点
    const pos = getCanvasRelativePosition(event);

    // 数据归一化
    pickPosition.x = (pos.x / renderer.domElement.width) * 2 - 1;
    pickPosition.y = (pos.y / renderer.domElement.height) * -2 + 1;
    return pickPosition;
  }
  // Raycaster 射线追踪
  let lastPick = null;
  function setRaycaster(event) {
    let pickPosition = setPickPosition(event);
    const raycaster = new THREE.Raycaster();
    raycaster.setFromCamera(pickPosition, camera);
    // 计算物体和射线的交点
    const intersects = raycaster.intersectObjects(scene.children, true);
    if (lastPick) {
      //@ts-ignore
      lastPick.object.material[0].color.set(0x2defff);
      //@ts-ignore
      lastPick.object.material[1].color.set(0x3480c4);
    }
    lastPick = null;
    lastPick = intersects[0];
    if (lastPick) {
      // 复原
      //@ts-ignore
      lastPick.object.material[0].color.set(0x008c8c);
      //@ts-ignore
      lastPick.object.material[1].color.set(0x008c8c);
    }

    render();
  }
  /**
   * 目标位置
   * */
  function spotCircle(spot) {
    // 圆
    const geometry1 = new THREE.CircleGeometry(0.5, 10);
    const material1 = new THREE.MeshBasicMaterial({
      color: 0xff0000,
      side: THREE.DoubleSide,
    });
    const circle = new THREE.Mesh(geometry1, material1);
    // 绘制地图时 y轴取反 这里同步
    circle.position.set(spot[0], -spot[1], spot[2] - 0.1);
    scene.add(circle);

    // 圆环
    const geometry2 = new THREE.RingGeometry(0.5, 0.7, 50);
    // transparent 设置 true 开启透明
    const material2 = new THREE.MeshBasicMaterial({
      color: 0xff0000,
      side: THREE.DoubleSide,
      transparent: true,
    });
    const circleY = new THREE.Mesh(geometry2, material2);
    // 绘制地图时 y轴取反 这里同步
    circleY.position.set(spot[0], -spot[1], spot[2] + 0.1);
    scene.add(circleY);
    // circleYs.push(circleY);

    // 地板
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
    scene.add(mesh);
    var geometrys = new THREE.CylinderBufferGeometry(5, 5, 20, 32);
    var materials = new THREE.MeshBasicMaterial({ color: 0xffff00 });
    var cylinder = new THREE.Mesh(geometrys, materials);
    cylinder.rotation.x = 0.5 * Math.PI;
    scene.add(cylinder);
  }
  // 线连接
  function lineConnect(posStart, posEnd) {
    // 根据目标坐标设置3D坐标  z轴位置在地图表面
    const [x0, y0, z0] = [...posStart, 10.01];
    const [x1, y1, z1] = [...posEnd, 10.01];
    // 使用QuadraticBezierCurve3() 创建 三维二次贝塞尔曲线
    const curve = new THREE.QuadraticBezierCurve3(
      new THREE.Vector3(x0, -y0, z0),
      new THREE.Vector3((x0 + x1) / 2, -(y0 + y1) / 2, 20),
      new THREE.Vector3(x1, -y1, z1),
    );

    // 绘制 目标位置
    spotCircle([x0, y0, z0]);
    spotCircle([x1, y1, z1]);

    const lineGeometry = new THREE.BufferGeometry();
    // 获取曲线 上的50个点
    var points = curve.getPoints(30);
    var positions: any = [];
    var colors: any = [];
    var color = new THREE.Color();

    // 给每个顶点设置演示 实现渐变
    for (var j = 0; j < points.length; j++) {
      color.setHSL(0.81666 + j, 0.88, 0.715 + j * 0.0025); // 粉色
      colors.push(color?.r, color.g, color.b);
      positions.push(points[j].x, points[j].y, points[j].z);
    }
    // 放入顶点 和 设置顶点颜色
    lineGeometry.addAttribute(
      'position',
      new THREE.BufferAttribute(new Float32Array(positions), 3, true),
    );
    lineGeometry.addAttribute(
      'color',
      new THREE.BufferAttribute(new Float32Array(colors), 3, true),
    );

    const material = new THREE.LineBasicMaterial({
      vertexColors: THREE.VertexColors,
      side: THREE.DoubleSide,
    });
    const line = new THREE.Line(lineGeometry, material);
    return line;
  }
};
</script>

<style>
#three-frame {
  width: 100vw;
  height: 100vh;
}
</style>

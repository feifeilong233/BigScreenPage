import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import { EffectComposer } from 'three/examples/jsm/postprocessing/EffectComposer.js';
import { RenderPass } from 'three/examples/jsm/postprocessing/RenderPass.js';
import { UnrealBloomPass } from 'three/examples/jsm/postprocessing/UnrealBloomPass.js';
import { ShaderPass } from 'three/examples/jsm/postprocessing/ShaderPass.js';
import { FXAAShader } from 'three/examples/jsm/shaders/FXAAShader.js';
import { Geometry } from 'three/examples/jsm/deprecated/Geometry.js';
import { CSM } from 'three/examples/jsm/csm/CSM.js';
import TWEEN from '@tweenjs/tween.js';
import * as d3 from 'd3';
import { ref, unref } from 'vue';
const vs = `
varying vec2 vUv;
void main() {
  vUv = uv;
  gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
}
`;
const fs = `
uniform sampler2D baseTexture;
uniform sampler2D bloomTexture;
varying vec2 vUv;
void main() {
  gl_FragColor = ( texture2D( baseTexture, vUv ) + vec4( 1.0 ) * texture2D( bloomTexture, vUv ) );
}
`;
let times;
var controls;
function Render3DMode(idNames = 'three-frame') {
  let renderer, sence, camera, bloomComposer, finalComposer;
  const BLOOM_LAYER = 1;
  const bloomLayer = new THREE.Layers();
  bloomLayer.set(BLOOM_LAYER);
  const centerLatlng = ref({});
  const materials = {};
  const darkMaterials = {};
  let idName = ref(idNames);
  const darkMaterial = new THREE.MeshBasicMaterial({ color: 'black' });
  //  初始化
  const initMaps = () => {
    // 场景
    sence = new THREE.Scene();
    sence.background = new THREE.Color('#000000');
    // 相机
    camera = new THREE.PerspectiveCamera(
      50,
      window.innerWidth / window.innerHeight,
      0.01,
      1000,
    );
    camera.position.set(30.9, 21.7, 37.4);
    camera.lookAt(0, 0, 0);
    // 渲染器
    renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
    renderer.shadowMap.enabled = true;
    renderer.shadowMapEnabled = true;
    renderer.shadowMapSoft = true;
    renderer.shadowMap.type = THREE.PCFSoftShadowMap;
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.getElementById(idName.value)?.appendChild(renderer.domElement);
    // 辉光材质
    const renderPass = new RenderPass(sence, camera);
    const bloomPass = new UnrealBloomPass(
      new THREE.Vector2(
        renderer.domElement.offsetWidth,
        renderer.domElement.offsetHeight,
      ),
      1,
      1,
      0.1,
    );
    bloomPass.threshold = 0;
    bloomPass.strength = 1.6;
    bloomPass.radius = 0;
    bloomComposer = new EffectComposer(renderer);
    bloomComposer.renderToScreen = false;
    bloomComposer.addPass(renderPass);
    bloomComposer.addPass(bloomPass);
    // 普通材质 自定义着色器
    finalComposer = new EffectComposer(renderer);
    const FxaaPass = createFxaaPass();
    const shaderPass = new ShaderPass(
      new THREE.ShaderMaterial({
        uniforms: {
          baseTexture: { value: null },
          bloomTexture: { value: bloomComposer.renderTarget2.texture },
        },
        vertexShader: vs,
        fragmentShader: fs,
        defines: {},
      }),
      'baseTexture',
    ); // 创建自定义的着色器Pass，详细见下
    shaderPass.needsSwap = true;
    finalComposer.addPass(renderPass);
    finalComposer.addPass(shaderPass);
    finalComposer.addPass(FxaaPass);
    addScence();
    addlight();
    CameraAnmition();
    render();
    renderanmi();
  };
  // 灯光
  const addlight = () => {
    var spotLight = new THREE.AmbientLight(0xcccccc);
    spotLight.position.set(-50, 60, 15);
    spotLight.castShadow = true; // 让光源产生阴影
    spotLight.shadowCameraVisible = true;
    // spotLight.shadowMapWidth = spotLight.shadowMapHeight = 1024*4
    sence.add(spotLight);
  };
  // 搭建组件
  const addScence = () => {
    // 添加辅助线-后期可以关闭
    // var axisHelper = new THREE.AxisHelper(500);
    // sence.add(axisHelper);
    setTerritory();
    addFloot();
    mouseMove();
    CameraAnmition();
  };
  // 发光墙，流体墙
  // 地板
  const addFloot = () => {
    //导入材质
    // var texture = new THREE.ImageUtils.loadTexture('/doms.png');
    var geometry = new THREE.PlaneGeometry(1000, 1000, 1, 1);
    var material = new THREE.MeshBasicMaterial({ color: '#1f2937' });
    var floor = new THREE.Mesh(geometry, material);
    floor.material.side = THREE.DoubleSide;
    floor.rotation.x = 0.5 * Math.PI;
    sence.add(floor);
  };
  // 几何体集合
  const setTerritory = () => {
    // //------------------- 圆柱
    // var geometry = new THREE.CylinderBufferGeometry(29, 30, 1, 100);
    // //  面材质
    // var faceMeterial = new THREE.MeshFaceMaterial([

    // ]);
    // var cylinder = new THREE.Mesh(geometry, faceMeterial);
    // cylinder.rotation.y = -0.5 * Math.PI;

    // //-------------------- 圆柱1

    const geometry1a = new THREE.CylinderBufferGeometry(29, 29, 1, 100, 1);
    // transparent 设置 true 开启透明
    const material1 = new THREE.MeshStandardMaterial({
      color: '#0F172A',
      transparent: false,
    });
    // 374151 1E293B
    // 使用分层渲染，不管用什么材质对象，都必须克隆 geometry1a.clone()
    const circleY1 = new THREE.Mesh(geometry1a.clone(), material1);
    // 绘制地图时 y轴取反 这里同步
    circleY1.position.set(0, 1, 0);
    circleY1.material.opacity = 1;
    circleY1.scale.set(1, 1, 1);
    circleY1.rotation.y = -0.5 * Math.PI;

    // //--------------- 圆环1

    const geometry4a = new THREE.RingGeometry(31, 31.5, 200);
    // transparent 设置 true 开启透明
    const material4 = new THREE.MeshStandardMaterial({
      side: THREE.DoubleSide,
      color: '#f40',
      transparent: true,
      opacity: 0.8,
    });
    const circleY4 = new THREE.Mesh(geometry4a.clone(), material4.clone());
    // 绘制地图时 y轴取反 这里同步
    circleY4.position.set(0, 0, -0.5);
    circleY4.scale.set(1, 1, 1);
    circleY4.scale.multiplyScalar(1.2);
    circleY4.rotation.x = -0.5 * Math.PI;
    circleY4.layers.enable(1);
    //半圆环
    const geometry5a = new THREE.RingGeometry(31.5, 32.7, 200, 0.6, 1, 3);
    // transparent 设置 true 开启透明
    const material5 = new THREE.MeshStandardMaterial({
      side: THREE.DoubleSide,
      color: '#f40',
      transparent: true,
      opacity: 0.8,
    });
    const circleY5 = new THREE.Mesh(geometry5a.clone(), material5.clone());
    // 绘制地图时 y轴取反 这里同步
    circleY5.position.set(0, 0, -0.5);
    circleY5.scale.set(1, 1, 1);
    circleY5.rotation.x = -0.5 * Math.PI;
    circleY5.layers.enable(1);
    //整圆
    const geometry5b = new THREE.RingGeometry(0, 28.5, 200);
    // transparent 设置 true 开启透明
    const material5a = new THREE.MeshStandardMaterial({
      side: THREE.DoubleSide,
      color: '#6b7280',
      transparent: true,
    });
    const circleY5a = new THREE.Mesh(geometry5b.clone(), material5a.clone());
    // 绘制地图时 y轴取反 这里同步
    circleY5a.position.set(0, 1.6, 0);
    circleY5a.scale.set(1, 1, 1);
    circleY5a.rotation.x = -0.5 * Math.PI;
    //圆环4
    const geometry5r = new THREE.RingGeometry(28, 29, 200);
    // transparent 设置 true 开启透明
    const material5r = new THREE.MeshStandardMaterial({
      side: THREE.DoubleSide,
      color: '#1E293B',
      transparent: true,
    });
    const circleY5r = new THREE.Mesh(geometry5r.clone(), material5r.clone());
    // 绘制地图时 y轴取反 这里同步
    circleY5r.position.set(0, 1.65, 0);
    circleY5r.scale.set(1, 1, 1);
    circleY5r.rotation.x = -0.5 * Math.PI;
    sence.add(circleY5r);
    sence.add(circleY5a);
    sence.add(circleY1);
    sence.add(ArcCurveGeometry());
    sence.add(circleY5);
    sence.add(circleY4);
    sence.add(rectShape());
    render();
  };
  // 多面圆环
  function rectShape() {
    var geometry = new THREE.TorusGeometry(27, 0.3, 16, 100, 5);
    var material = new THREE.MeshBasicMaterial({ color: '#64748B' });
    var torus = new THREE.Mesh(geometry, material);
    torus.position.set(0, 1.65, 0);
    torus.scale.set(1, 1, 1);
    torus.rotation.x = -0.5 * Math.PI;
    return torus;
  }
  // 椭圆
  function ArcCurveGeometry() {
    var positions: any = [];
    var colors: any = [];
    // 椭圆
    const lineGeometry = new THREE.BufferGeometry();
    var curve = new THREE.EllipseCurve(
      0,
      0, // ax, aY
      30,
      30, // xRadius, yRadius
      0,
      2 * Math.PI, // aStartAngle, aEndAngle
      false, // aClockwise
      0, // aRotation
    );
    var points = curve.getPoints(100);
    lineGeometry.addAttribute(
      'position',
      new THREE.BufferAttribute(new Float32Array(positions), 3, true),
    );
    lineGeometry.addAttribute(
      'color',
      new THREE.BufferAttribute(new Float32Array(colors), 3, true),
    );

    lineGeometry.setFromPoints(points);
    var material = new THREE.LineDashedMaterial({
      color: '#64748B',
      scale: 1.1,
      dashSize: 10,
      gapSize: 10,
    });
    var ellipse = new THREE.Line(lineGeometry, material);
    ellipse.computeLineDistances();
    ellipse.rotation.x = -0.5 * Math.PI;
    ellipse.layers.enable(1);
    return ellipse;
  }
  // 抗锯齿优化
  function createFxaaPass() {
    let FxaaPass = new ShaderPass(FXAAShader);
    const pixelRatio = renderer.getPixelRatio();
    FxaaPass.material.uniforms['resolution'].value.x =
      1 / (window.innerWidth * pixelRatio);
    FxaaPass.material.uniforms['resolution'].value.y =
      1 / (window.innerHeight * pixelRatio);
    FxaaPass.renderToScreen = true;
    return FxaaPass;
  }
  // 鼠标移动
  const mouseMove = () => {
    controls = new OrbitControls(camera, renderer.domElement); //创建控件对象
    controls.addEventListener('change', render);
  };
  // 地图
  const setMapDom = (e) => {
    const color = '#008c8c';
    const province = new THREE.Object3D();
    const projection = d3
      .geoMercator()
      .center([106.0, 39.5])
      .scale(47)
      .translate([0, 0]);
    e.forEach((item, index) => {
      let cod = item.geometry.coordinates[0];
      if (item.properties.name) {
        centerLatlng.value[item.properties.name] = item.properties.center;
      }
      if (
        item.properties.name == '广东省' ||
        item.properties.name == '北京市'
      ) {
        dotBarlight(
          projection(item.properties.center),
          item.properties.name == '北京市' ? '#008c8c' : 'yellow',
        );
      }
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
        // 添加多个线
        lineGeometry.setFromPoints(pointsArray);
        const lineMaterial = new THREE.LineBasicMaterial({
          color: '#b45309',
        });
        // 创建线
        let lines = new THREE.Line(lineGeometry, lineMaterial);
        lines.rotation.x = -0.5 * Math.PI;
        lines.position.set(0, 2.5, 0);
        // 地图厚度
        lines.scale.set(1, 1, 0.3);
        // lines.layers.enable(1);
        sence.add(lines);

        const extrudeSettings = {
          depth: 4,
          bevelEnabled: false,
          bevelSegments: 1,
          bevelThickness: 0.2,
        };
        const geometry = new THREE.ExtrudeGeometry(shape, extrudeSettings);
        const material = new THREE.MeshBasicMaterial({
          color: `#1E293B`,
          transparent: true,
          opacity: 1,
        });
        const material1 = new THREE.MeshBasicMaterial({
          metalness: 0.3,
          color: '#6b7280',
          opacity: 1,
        });
        const mesh = new THREE.Mesh(geometry, [material, material1]);
        mesh.position.set(0, 2, 0);
        // 地图厚度
        mesh.scale.set(1, 1, 0.3);
        // 给mesh开启阴影
        mesh.castShadow = true;
        mesh.receiveShadow = true;
        mesh._color = color;
        mesh.rotation.x = -0.5 * Math.PI;
        province.add(mesh);
      });
    });
    sence.add(province);
    render();
  };
  // 地图描边
  const setmapborder = (e) => {
    const province = new THREE.Object3D();
    const projection = d3
      .geoMercator()
      .center([106.0, 39.5])
      .scale(47)
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
        // 添加多个线
        lineGeometry.setFromPoints(pointsArray);
        const lineMaterial = new THREE.LineBasicMaterial({
          color: '#f59e0b',
        });
        // 创建线
        let lines = new THREE.Line(lineGeometry, lineMaterial);
        lines.rotation.x = -0.5 * Math.PI;
        lines.position.set(0, 0.2, 0);
        // 地图厚度
        lines.scale.set(1, 1, 1);
        lines.layers.enable(1);
        sence.add(lines);
      });
    });
    sence.add(province);
    render();
  };
  // 动画集合
  // 波动光圈
  const AnmiRingGeometry = (post, colors) => {
    const [x0, y0, z0] = [...post, 3.5];
    const geometry2 = new THREE.RingGeometry(0, 0.15, 50);
    // transparent 设置 true 开启透明
    const material2 = new THREE.MeshBasicMaterial({
      color: colors,
      side: THREE.DoubleSide,
      transparent: true,
    });
    const circleY = new THREE.Mesh(geometry2, material2);
    // 绘制地图时 y轴取反 这里同步
    circleY.position.set(x0, z0, y0);
    circleY.scale.set(2, 2, 1);
    circleY.rotation.x = -0.5 * Math.PI;
    sence.add(circleY);
    // 小-圆环
    const geometry3 = new THREE.RingGeometry(0.25, 0.3, 6);
    // transparent 设置 true 开启透明
    const material3 = new THREE.MeshBasicMaterial({
      color: colors,
      side: THREE.DoubleSide,
      transparent: true,
    });
    const circleY3 = new THREE.Mesh(geometry3, material3);
    // 绘制地图时 y轴取反 这里同步
    circleY3.position.set(x0, z0, y0);
    circleY3.scale.set(2, 2, 1);
    circleY3.rotation.x = -0.5 * Math.PI;
    circleY3.layers.enable(1);
    sence.add(circleY3);
  };
  // 光点柱
  const dotBarlight = (posStart, colors) => {
    const [x0, y0, z0] = [...posStart, 5];
    AnmiRingGeometry([x0, y0], colors);
    var geometry = new THREE.ConeBufferGeometry(0.25, 3.5, 5);
    var material1 = new THREE.MeshBasicMaterial({
      color: colors,
      transparent: true,
      opacity: 0.4,
    });
    var cylinder = new THREE.Mesh(geometry, material1);
    cylinder.position.set(x0, z0, y0);
    cylinder.layers.enable(1);
    sence.add(cylinder);
    render();
  };
  // 相机轨迹动画
  // const CameraAnmition = () => {
  //   times && clearInterval(times);
  //   let index = 0;
  //   let arrs = [
  //     { x: 30.9, y: 21.7, z: 37.4 },
  //     // 这里填充轨迹即可
  //     { x: 29.9, y: 24.7, z: 45.4 },
  //   ];
  //   times = setInterval(function () {
  //     camera.position.set(arrs[index].x, arrs[index].y, arrs[index].z);
  //     camera.lookAt(new THREE.Vertex(0, 0, 0));
  //     index++;
  //     if (index > arrs.length - 1) {
  //       clearInterval(times);
  //     }
  //     render();
  //   }, 50);
  // };
  // tween 动画
  const CameraAnmition = () => {
    var tweena = cameraCon(
      { x: 89.67626699596627, y: 107.58058095557215, z: 51.374711690741705 },
      { x: 89.67626699596627, y: 107.58058095557215, z: 51.374711690741705 },
      300,
    );
    var tweenb = cameraCon(
      { x: 89.67626699596627, y: 107.58058095557215, z: 51.374711690741705 },
      { x: 31.366485208227502, y: 42.7325471436067, z: 26.484221462746017 },
      800,
    );
    var tweenc = cameraCon(
      { x: 31.366485208227502, y: 42.7325471436067, z: 26.484221462746017 },
      { x: 32.19469382023058, y: 22.87664020700182, z: 27.742681212371384 },
      1000,
    );

    tweena.chain(tweenb);
    tweenb.chain(tweenc);
    tweena.start();
  };
  function cameraCon(
    p1 = { x: 0, y: 0, z: 0 },
    p2 = { x: 30, y: 30, z: 30 },
    time = 6000,
  ) {
    var tween1 = new TWEEN.Tween(p1)
      .to(p2, time || 200000)
      .easing(TWEEN.Easing.Quadratic.InOut);
    var update = function () {
      camera.position.set(p1.x, p1.y, p1.z);
    };
    tween1.onUpdate(update);
    return tween1;
  }
  const clock = new THREE.Clock();
  // 动画
  function renderanmi() {
    const dt = clock.getDelta();
    TWEEN.update();
    controls.update();

    render();
    window.requestAnimationFrame(renderanmi);
  }
  // 渲染
  const render = () => {
    sence.traverse(darkenNonBloomed2);
    // 2. 用 bloomComposer 产生辉光
    bloomComposer.render();
    // 3. 将转成黑色材质的物体还原成初始材质
    sence.traverse(restoreMaterial);
    // 4. 用 finalComposer 作最后渲染
    finalComposer.render();
    console.log(camera.position);
  };
  const darkenNonBloomed2 = (obj) => {
    const material = obj.material;
    if (material && bloomLayer.test(obj.layers) === false) {
      materials[obj.uuid] = material;
      if (!darkMaterials[material.type]) {
        const Proto = Object.getPrototypeOf(material).constructor;
        darkMaterials[material.type] = new Proto({ color: 0x000000 });
      }
      obj.material = darkMaterials[material.type];
    }
  };

  const restoreMaterial = (obj) => {
    if (materials[obj.uuid]) {
      obj.material = materials[obj.uuid];
      delete materials[obj.uuid];
    }
  };
  return { initMaps, setMapDom, setmapborder };
}

export default Render3DMode;

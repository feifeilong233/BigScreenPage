import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import { EffectComposer } from 'three/examples/jsm/postprocessing/EffectComposer.js';
import { RenderPass } from 'three/examples/jsm/postprocessing/RenderPass.js';
import { UnrealBloomPass } from 'three/examples/jsm/postprocessing/UnrealBloomPass.js';
import { ShaderPass } from 'three/examples/jsm/postprocessing/ShaderPass.js';
import { FXAAShader } from 'three/examples/jsm/shaders/FXAAShader.js';
import TWEEN from '@tweenjs/tween.js';
import { Geometry } from 'three/examples/jsm/deprecated/Geometry.js';
import { CreateLabel } from './spritetext';
import Utils from '@/hooks/bars';
import Utils2 from '@/hooks/anmitbars';
import * as d3 from 'd3';
import { ref, unref } from 'vue';
// 地球
import { CreateEarth } from './earth';
import { CameraAnmition, RotateAnmition } from './tweenanmi';
import { Spriteimage } from './spriteimage';
import border1 from '@/assets/bgs.png';
import img1 from '@/assets/starbg/BlueNebula2048_back.jpg';
import img2 from '@/assets/starbg/BlueNebula2048_bottom.jpg';
import img3 from '@/assets/starbg/BlueNebula2048_front.jpg';
import img4 from '@/assets/starbg/BlueNebula2048_left.jpg';
import img5 from '@/assets/starbg/BlueNebula2048_right.jpg';
import img6 from '@/assets/starbg/BlueNebula2048_top.jpg';
import img_cloud1 from '@/assets/cloud/1.webp';
import img_cloud2 from '@/assets/cloud/2.webp';
import img_cloud3 from '@/assets/cloud/3.jpg';
import img_cloud4 from '@/assets/cloud/4.jpg';
import img_cloud5 from '@/assets/cloud/5.webp';
import img_cloud6 from '@/assets/cloud/6.webp';
import img_cloud7 from '@/assets/cloud/7.webp';
import img_cloud8 from '@/assets/cloud/8.webp';
import img_cloud9 from '@/assets/cloud/9.webp';
import img_cloud10 from '@/assets/cloud/10.webp';
import img_cloud11 from '@/assets/cloud/11.webp';
import img_cloud12 from '@/assets/cloud/12.webp';
import img_cloud13 from '@/assets/cloud/13.webp';
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
let times, earthGroup;
let numsa = 0,
  numss = 0;
var animatefunsa: any = '';
function Render3DMode(idNames = 'three-frame') {
  let renderer, sence, camera, controls, finalComposer, bloomComposer;
  // 圆环
  let circleY7a, circleY6a, circleY5a;
  // 过滤材质
  const darkMaterials = {};
  const materials = {};
  // 渲染选择
  const keys = ref<boolean>(false);
  const keys2 = ref<boolean>(false);
  // 地图
  const province = new THREE.Object3D();
  var ControlGroup = new THREE.Group();
  const BLOOM_LAYER = 1;
  const centerLatlng = ref({});
  let mapsline1 = [] as any;
  // 时钟
  const clock = new THREE.Clock();
  const bloomLayer = new THREE.Layers();
  bloomLayer.set(BLOOM_LAYER);
  let idName = ref(idNames);
  //  初始化
  const initMaps = () => {
    // 场景
    sence = new THREE.Scene();
    sence.background = new THREE.Color('#000');
    // sence.fog = new THREE.Fog(0x273750,  10,  20)
    //   sence.background = new THREE.CubeTextureLoader().load([
    //     img5,
    //     img4,
    //     img6,
    //     img2,
    //     img1,
    //     img3,
    // ]);

    // 相机
    camera = new THREE.PerspectiveCamera(
      50,
      window.innerWidth / window.innerHeight,
      0.01,
      1000,
    );
    camera.position.set(
      400.461172345236996,
      350.97141931406415,
      330.651273012410556,
    );
    // camer

    camera.lookAt(100, 10, 20);
    camera.rotateY(50);
    // 渲染器
    renderer = new THREE.WebGLRenderer({
      antialias: true,
    });

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
    // addScence();
    addlight();
    // 地板
    addFloot();
    // 鼠标移动
    mouseMove();
    // 地球
    earth();
    // 组件
    setTerritory();
    // 辅助线
    // axisHelper()
    // 渲染
    render();
    renderanmi();

    initAnmite();
  };
  // 辅助线
  function axisHelper() {
    var axisHelper = new THREE.AxisHelper(500);
    sence.add(axisHelper);
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
  // 初始动画
  const initAnmite = () => {
    CameraAnmition(camera, [
      {
        center: {
          x: 889.67626699596627,
          y: 807.58058095557215,
          z: 851.374711690741705,
        },
        to: {
          x: 889.67626699596627,
          y: 807.58058095557215,
          z: 851.374711690741705,
        },
        time: 300,
      },
      {
        center: {
          x: 889.67626699596627,
          y: 807.58058095557215,
          z: 851.374711690741705,
        },
        to: {
          x: 489.67626699596627,
          y: 307.58058095557215,
          z: 351.374711690741705,
        },
        time: 1000,
      },
    ]);
  };
  // 鼠标移动
  const mouseMove = () => {
    controls = new OrbitControls(camera, renderer.domElement); //创建控件对象
    controls.addEventListener('change', render);
  };
  // 灯光
  const addlight = () => {
    // 方向光1
    var directionalLight = new THREE.DirectionalLight(0xffffff, 0.9);
    directionalLight.position.set(200, 100, 100);
    sence.add(directionalLight);
    // 方向光2
    var directionalLight2 = new THREE.DirectionalLight(0xffffff, 0.9);
    directionalLight2.position.set(-200, -100, -100);
    sence.add(directionalLight2);
    //环境光
    var ambient = new THREE.AmbientLight(0xffffff, 0.6);
    sence.add(ambient);
  };
  // 地板
  const addFloot = () => {
    //导入材质
    // var texture = new THREE.ImageUtils.loadTexture('/doms.png');
    var geometry = new THREE.PlaneGeometry(1000, 1000, 1, 1);
    var material = new THREE.MeshBasicMaterial({ color: '#27364f' });
    var floor = new THREE.Mesh(geometry, material);
    floor.material.side = THREE.DoubleSide;
    floor.rotation.x = 0.5 * Math.PI;
    ControlGroup.add(floor);
  };
  // 穿云效果:入口事件
  const intoCloud = () => {
    keys2.value = true;
    // -181.54705197055947, y: 421.74954918536514, z: -497.01190522819707
    earthGroup.rotateY(0);
    CameraAnmition(camera, [
      {
        center: {
          x: camera.position.x,
          y: camera.position.y,
          z: camera.position.z,
        },
        to: {
          x: camera.position.x,
          y: camera.position.y,
          z: camera.position.z,
        },
        time: 500,
      },
      {
        center: {
          x: camera.position.x,
          y: camera.position.y,
          z: camera.position.z,
        },
        to: {
          x: -181.54705197055947,
          y: 421.74954918536514,
          z: -497.01190522819707,
        },
        time: 1000,
      },
    ]);
    // 延迟动画
    setTimeout(() => {
      Cloudstart();
    }, 1500);
  };
  const Cloudstart = () => {
    CameraAnmition(camera, [
      {
        center: {
          x: -181.54705197055947,
          y: 421.74954918536514,
          z: -497.01190522819707,
        },
        to: {
          x: -181.54705197055947,
          y: 421.74954918536514,
          z: -497.01190522819707,
        },
        time: 300,
      },
      {
        center: {
          x: -181.54705197055947,
          y: 421.74954918536514,
          z: -497.01190522819707,
        },
        to: {
          x: -23.82530778235861,
          y: 62.300068758223205,
          z: -69.53223000061438,
        },
        time: 1500,
      },
    ]);
    // 下面是云
    setTimeout(() => {
      Spriteimage(
        'mountNode',
        [
          img_cloud1,
          img_cloud2,
          img_cloud3,
          img_cloud4,
          img_cloud5,
          img_cloud6,
          img_cloud7,
          img_cloud8,
          img_cloud9,
          img_cloud10,
          img_cloud11,
          img_cloud12,
          img_cloud13,
        ],
        () => {
          keys.value = true;
          // 移除渐变几何体
          sence.remove(earthGroup);
          // 添加地图
          sence.add(ControlGroup);
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
              time: 600,
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
              time: 900,
            },
          ]);
        },
      );
    }, 800);
  };
  // 文字标签
  const Texttags = (text, posi) => {
    CreateLabel(300, 150, text, border1, posi).then((res) => {
      ControlGroup.add(res);
    });
  };
  // 地球
  const earth = () => {
    let { group, animatefun } = CreateEarth();
    animatefunsa = animatefun;
    earthGroup = group;
    sence.add(earthGroup);
  };
  const setTerritory = () => {
    let sc = 0.9;
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
    circleY1.scale.set(sc, sc, sc);
    circleY1.rotation.y = -0.5 * Math.PI;

    // //--------------- 圆环1

    const geometry4a = new THREE.RingGeometry(40, 40.5, 250);
    // transparent 设置 true 开启透明
    const material4 = new THREE.MeshStandardMaterial({
      side: THREE.DoubleSide,
      color: '#0ea5e9',
      transparent: true,
      opacity: 0.8,
    });
    const circleY4 = new THREE.Mesh(geometry4a.clone(), material4.clone());
    // 绘制地图时 y轴取反 这里同步
    circleY4.position.set(0, 0, -0.5);
    circleY4.scale.set(sc, sc, 1);
    circleY4.scale.multiplyScalar(1.2);
    circleY4.rotation.x = -0.5 * Math.PI;
    circleY4.layers.enable(1);
    //半圆环
    const geometry5a = new THREE.RingGeometry(31.5, 32, 200, 0.6, 1, 3);
    // transparent 设置 true 开启透明
    const material5 = new THREE.MeshStandardMaterial({
      side: THREE.DoubleSide,
      color: '#0ea5e9',
      transparent: true,
      opacity: 0.8,
    });
    circleY7a = new THREE.Mesh(geometry5a.clone(), material5.clone());
    // 绘制地图时 y轴取反 这里同步
    circleY7a.position.set(0, 1.3, -0.5);
    circleY7a.scale.set(sc, sc, 1);
    circleY7a.rotation.x = -0.5 * Math.PI;
    circleY7a.layers.enable(1);
    //整圆
    const geometry5b = new THREE.RingGeometry(0, 28.5, 200);
    // transparent 设置 true 开启透明
    var textures = new THREE.TextureLoader().load('aas.png');
    const material5a = new THREE.MeshStandardMaterial({
      side: THREE.DoubleSide,
      map: textures,
      transparent: true,
    });
    circleY5a = new THREE.Mesh(geometry5b.clone(), material5a.clone());
    // 绘制地图时 y轴取反 这里同步
    circleY5a.position.set(0, 1.6, 0);
    circleY5a.scale.set(sc, sc, 1);
    circleY5a.rotation.x = -0.5 * Math.PI;
    //整圆2
    const geometry6b = new THREE.RingGeometry(0, 35.5, 350);
    // transparent 设置 true 开启透明
    var texture1a = new THREE.TextureLoader().load('cricl3.png');
    const material6a = new THREE.MeshStandardMaterial({
      side: THREE.DoubleSide,
      map: texture1a,
      transparent: true,
    });
    circleY6a = new THREE.Mesh(geometry6b.clone(), material6a.clone());
    // 绘制地图时 y轴取反 这里同步
    circleY6a.position.set(0, 1.1, 0);
    circleY6a.scale.set(1.2, 1, 1.2);
    circleY6a.rotation.x = -0.5 * Math.PI;

    //圆环4
    const geometry5r = new THREE.RingGeometry(28, 29, 200);
    // transparent 设置 true 开启透明
    const material5r = new THREE.MeshStandardMaterial({
      side: THREE.DoubleSide,
      color: '#1d2d54',
      transparent: true,
    });
    const circleY5r = new THREE.Mesh(geometry5r.clone(), material5r.clone());
    // 绘制地图时 y轴取反 这里同步
    circleY5r.position.set(0, 1.65, 0);
    circleY5r.scale.set(sc, sc, 1);
    circleY5r.rotation.x = -0.5 * Math.PI;
    ControlGroup.add(circleY5r);
    // 旋转材质
    ControlGroup.add(circleY5a);
    // ControlGroup.add(circleY6a);
    ControlGroup.add(circleY1);
    // ControlGroup.add(ArcCurveGeometry());
    // ControlGroup.add(circleY7a);
    // ControlGroup.add(circleY4);
    // ControlGroup.add(rectShape());
  };
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
  // 中国板块地图
  const setMapDom = (e) => {
    const color = '#008c8c';

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
        Texttags(item.properties.name, projection(item.properties.center));
        // addTextTips(item.properties.name,projection(item.properties.center))
        dotBarlight(
          projection(item.properties.center),
          item.properties.name == '北京市' ? '#008c8c' : '#008c8c',
        );
        // addbars(projection(item.properties.center));
      }
      cod = cod.length > 1 ? [[...cod]] : cod;
      cod.forEach((polygon, iz) => {
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
          color: '#ebcf6a',
          transparent: true,
        });
        // 创建线
        let mapsline = new THREE.Line(lineGeometry, lineMaterial);
        mapsline.rotation.x = -0.5 * Math.PI;
        // mapsline.rotation. = -0.5 * Math.PI;
        mapsline.position.set(0, 2.4, 0);
        // 地图厚度

        mapsline.scale.set(1, 1, 0.3);
        mapsline.material.opacity = 0.1;
        // mapsline.layers.enable(1);
        mapsline1.push(mapsline);
        ControlGroup.add(mapsline);
        const extrudeSettings = {
          depth: 4,
          bevelEnabled: false,
          bevelSegments: 1,
          bevelThickness: 0.2,
        };
        const geometry = new THREE.ExtrudeGeometry(shape, extrudeSettings);
        const material = new THREE.MeshBasicMaterial({
          color: '#1E293B',
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
        mesh.rotation.x = -0.5 * Math.PI;
        province.add(mesh);
        // 只有索引为2 的地标更改颜色
        Utils2.setCityMaterial(mesh, '#3b6cab', '#5e5d7c', false);
        if (index == 2) {
          Utils2.setCityMaterial(mesh, '#008c8c', '#5e5d7c', false);
        } else {
          // Utils2.setCityMaterial(mesh, '#008c8c' , '#054868', false);
        }
      });
    });

    ControlGroup.add(province);
    render();
  };
  // 地图边框
  const setmapborder = (e) => {
    const province = new THREE.Object3D();
    const province2 = new THREE.Object3D();
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
          color: '#008c8c',
        });
        // 创建线
        let lines = new THREE.Line(lineGeometry, lineMaterial);
        lines.rotation.x = -0.5 * Math.PI;
        lines.position.set(0, 0.2, 0);
        // 地图厚度
        lines.scale.set(1, 1, 1);
        lines.layers.enable(1);
        ControlGroup.add(lines);
      });
    });
    ControlGroup.add(province);

    // render();
  };
  // 光柱生长
  const addbars = (postsa) => {
    let [x, y, z] = [...postsa, 4];
    // 创建组

    let effectGroup = new THREE.Group();
    // 创建一个长方体几何体
    var geometry = new THREE.BoxGeometry(0.3, 0.3, 5);
    var material1 = new THREE.MeshBasicMaterial({});
    var cylinder = new THREE.Mesh(geometry, material1);
    cylinder.rotation.x = -0.5 * Math.PI;
    cylinder.position.set(x, z, y);
    // cylinder.layers.enable(1)
    effectGroup.add(cylinder);
    effectGroup.traverse((a) => {
      if (a.type == 'Mesh') {
        Utils.setCityMaterial(a, 'pink', '#0ea5e9', false);
      }
    });
    ControlGroup.add(effectGroup);
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
    ControlGroup.add(cylinder);
    render();
  };
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
    ControlGroup.add(circleY);
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
    ControlGroup.add(circleY3);
  };
  // 运动动画
  function renderanmi() {
    const dt = clock.getDelta();
    // 旋转动画
    numsa += dt*0.1;
    numss -= dt*0.1;
    if (!keys2.value) {
      // earthGroup.rotation
      // camera.position.set(camera.position.x,dt,camera.position.z)
      // earthGroup.rotateY(-0.005);
    }

    animatefunsa(-dt);
    // 生长动画
    Utils.animate(dt);
    Utils2.animate(dt);

    circleY5a.rotation.z = numss * -0.1;
    circleY6a.rotation.z = numss;
    circleY7a.rotation.z = numss * -0.1;
    // ControlGroup.rotation.y = numss * -0.1;
    if (numsa > 0 && numsa < 1.2) {
      mapsline1.map((item) => {
        item.material.opacity = numsa - 0.2;
      });
      // mapsline2.material.opacity = numsa - 0.2;
      // mapsline2.position.set(0, numsa - 1, 0);
    }
    TWEEN.update();
    controls.update();
    render();
    window.requestAnimationFrame(renderanmi);
  }
  // 渲染内容
  const render = () => {
    if (keys.value) {
      sence.traverse(darkenNonBloomed2);
      // buildingSweepingLightShader.uniforms.boxH.value += 0.1
      // if (buildingSweepingLightShader.uniforms.boxH.value > 10) {
      //   buildingSweepingLightShader.uniforms.boxH.value = -10
      // }
      // 2. 用 bloomComposer 产生辉光
      bloomComposer.render();
      // 3. 将转成黑色材质的物体还原成初始材质
      sence.traverse(restoreMaterial);
      // 4. 用 finalComposer 作最后渲染
      finalComposer.render();
    } else {
      renderer.render(sence, camera);
    }
  };
  const darkenNonBloomed2 = (obj) => {
    const material = obj.material;
    if (material && bloomLayer.test(obj.layers) === false) {
      materials[obj.uuid] = material;
      if (!darkMaterials[material.type]) {
        const Proto = Object.getPrototypeOf(material).constructor;
        darkMaterials[material.type] = new Proto({ color: '#000' });
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
  return { initMaps, intoCloud, setMapDom, setmapborder };
}
export default Render3DMode;

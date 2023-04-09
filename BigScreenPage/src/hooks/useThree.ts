import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import { EffectComposer } from 'three/examples/jsm/postprocessing/EffectComposer.js';
import { RenderPass } from 'three/examples/jsm/postprocessing/RenderPass.js';
import { UnrealBloomPass } from 'three/examples/jsm/postprocessing/UnrealBloomPass.js';
import { ShaderPass } from 'three/examples/jsm/postprocessing/ShaderPass.js';
import { FXAAShader } from 'three/examples/jsm/shaders/FXAAShader.js';
import TWEEN from '@tweenjs/tween.js';
import { Geometry } from 'three/examples/jsm/deprecated/Geometry.js';
import { CSM } from 'three/examples/jsm/csm/CSM.js';
import Utils from '@/hooks/bars';
import Utils2 from '@/hooks/anmitbars';
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
let buildingSweepingLightShader = {
  uniforms: {
    boxH: {
      type: 'f',
      value: -10.0,
    },
  },
  vertexShader: `
  varying vec3 vColor;
  varying float v_pz;
  void main(){
    v_pz = position.y;
    vColor = color;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
  }
`,
  fragmentShader: `
  uniform float boxH;
  varying vec3 vColor;
  varying float v_pz;
  float plot(float pct){
    return smoothstep(pct-8.0,pct,v_pz) - smoothstep(pct,pct+0.02,v_pz);
  }
  void main(){
    float f1 = plot(boxH);
    vec4 b1 = mix(vec4(0.9,0.2,1.0,0.1),vec4(f1,f1,f1,1.0),0.1);
    gl_FragColor = mix(vec4(vColor,1.0),b1,f1);
    gl_FragColor = vec4(vec3(gl_FragColor),0.9);
  }
`,
};
let times;
function Render3DMode(idNames = 'three-frame') {
  let renderer,
    sence,
    camera,
    bloomComposer,
    SweepingLightShader,
    finalComposer;
  const BLOOM_LAYER = 1;
  // 时钟
  const clock = new THREE.Clock();
  const bloomLayer = new THREE.Layers();
  bloomLayer.set(BLOOM_LAYER);
  const centerLatlng = ref({});
  const materials = {};
  const darkMaterials = {};
  let mapsline1 = [] as any,
    mapsline2,
    circleY5a,
    circleY6a,
    circleY7a;
  let idName = ref(idNames);
  const darkMaterial = new THREE.MeshBasicMaterial({ color: 'black' });
  //  初始化
  const initMaps = () => {
    // 场景
    var texture = new THREE.TextureLoader().load('bgs.jpeg');
    sence = new THREE.Scene();
    // sence.background.dispose()
    // sence.background = texture;
    // 全景图片
    // sence.background = new THREE.CubeTextureLoader()
    // .setPath('../../public/').load(
    //     [
    //         'bgs.jpeg',
    //         'bgs.jpeg',
    //         'bgs.jpeg',
    //         'bgs.jpeg',
    //         'bgs.jpeg'
    //     ]
    // )

    // 相机
    camera = new THREE.PerspectiveCamera(
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
    // camer

    camera.autoRotate = true;
    camera.lookAt(100, 10, 20);
    camera.rotateY(50);
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
    );
    // 创建自定义的着色器Pass，详细见下
    const material = new THREE.ShaderMaterial({
      uniforms: buildingSweepingLightShader.uniforms,
      vertexShader: buildingSweepingLightShader.vertexShader,
      fragmentShader: buildingSweepingLightShader.fragmentShader,
      vertexColors: buildingSweepingLightShader,
    });
    material.needsUpdate = true;

    shaderPass.needsSwap = true;
    finalComposer.addPass(renderPass);
    finalComposer.addPass(shaderPass);
    finalComposer.addPass(FxaaPass);
    addScence();
    addlight();
    // addtext();

    render();

    renderanmi();
    CameraAnmition();
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
    sence.add(effectGroup);
  };
  /* 创建字体精灵 */
  function makeTextSprite(message, parameters: any) {
    if (parameters === undefined) parameters = {};

    var fontface = parameters.fontface ? parameters['fontface'] : 'Arial';

    /* 字体大小 */
    var fontsize = parameters['fontsize'] ? parameters['fontsize'] : 18;

    /* 边框厚度 */
    var borderThickness = parameters['borderThickness']
      ? parameters['borderThickness']
      : 4;

    /* 边框颜色 */
    var borderColor = parameters['borderColor']
      ? parameters['borderColor']
      : { r: 0, g: 0, b: 0, a: 1.0 };

    /* 背景颜色 */
    var backgroundColor = parameters['backgroundColor']
      ? parameters['backgroundColor']
      : { r: 255, g: 255, b: 255, a: 1.0 };

    /* 创建画布 */
    var canvas = document.createElement('canvas');
    canvas.width = 10 * 8.1;
    canvas.height = 5 * 8.5;
    var context = canvas.getContext('2d') as any;

    /* 字体加粗 */
    context.font = '400 ' + fontsize + 'px ' + fontface;

    /* 获取文字的大小数据，高度取决于文字的大小 */
    var metrics = context.measureText(message);
    var textWidth = metrics.width;

    /* 背景颜色 */
    context.fillStyle =
      'rgba(' +
      backgroundColor.r +
      ',' +
      backgroundColor.g +
      ',' +
      backgroundColor.b +
      ',' +
      backgroundColor.a +
      ')';
    /* 边框的颜色 */
    context.strokeStyle = '#008c8c';
    context.lineWidth = 1;
    context.translate(-3, -3);
    /* 绘制圆角矩形 */
    roundRect(
      context,
      borderThickness,
      borderThickness,
      textWidth + borderThickness,
      fontsize * 1.4 + borderThickness,
      6,
    );

    /* 字体颜色 */
    context.fillStyle = '#a78bfa'; //#11cdf4
    context.fillText(
      message,
      borderThickness + 2,
      fontsize + borderThickness + 2,
    );
    // context.scale(3,3)
    /* 画布内容用于纹理贴图 */
    var texture2 = new THREE.Texture(canvas);
    texture2.needsUpdate = true;
    var spriteMaterial = new THREE.SpriteMaterial({
      map: texture2,
      transparent: true,
      useScreenCoordinates: false,
    });
    var sprite = new THREE.Sprite(spriteMaterial);
    /* 缩放比例 */
    sprite.scale.set(2.8, 1.3, 0);
    return sprite;
  }
  /* 绘制圆角矩形 */
  function roundRect(ctx, x, y, w, h, r) {
    ctx.beginPath();
    ctx.moveTo(x, y);
    ctx.lineTo(x + w, y);
    ctx.quadraticCurveTo(x + w, y, x + w, y);
    ctx.lineTo(x + w, y + h);
    ctx.quadraticCurveTo(x + w, y + h, x + w, y + h);
    ctx.lineTo(x, y + h);
    ctx.quadraticCurveTo(x, y + h - r, x, y + h);
    ctx.lineTo(x, y + r);
    ctx.quadraticCurveTo(x, y, x, y);
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
  }
  // 扫光效果

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
    var axisHelper = new THREE.AxisHelper(500);
    sence.add(axisHelper);
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
    circleY4.scale.set(1, 1, 1);
    circleY4.scale.multiplyScalar(1.2);
    circleY4.rotation.x = -0.5 * Math.PI;
    circleY4.layers.enable(1);
    //半圆环
    const geometry5a = new THREE.RingGeometry(31.5, 32.7, 200, 0.6, 1, 3);
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
    circleY7a.scale.set(1, 1, 1);
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
    circleY5a.scale.set(1, 1, 1);
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
    sence.add(circleY6a);
    sence.add(circleY1);
    sence.add(ArcCurveGeometry());
    sence.add(circleY7a);
    sence.add(circleY4);
    sence.add(rectShape());
    render();
    stageRender();
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
    var controls = new OrbitControls(camera, renderer.domElement); //创建控件对象
    controls.addEventListener('change', render);
  };
  // 添加问题tip
  function addTextTips(text, pos) {
    let [x, y, z] = [...pos, 10];
    var spriteZ = makeTextSprite(text, {
      fontsize: 25,
      borderColor: { r: 255, g: 0, b: 0, a: 0.4 } /* 边框黑色 */,
      backgroundColor: { r: 15, g: 134, b: 211, a: 0.1 } /* 背景颜色 */,
    });
    spriteZ.center = new THREE.Vector2(0, 0);
    spriteZ.position.set(x - 1, 7, y + 2);
    sence.add(spriteZ);
  }
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
        // addTextTips(item.properties.name,projection(item.properties.center))
        dotBarlight(
          projection(item.properties.center),
          item.properties.name == '北京市' ? 'pink' : 'pink',
        );
        addbars(projection(item.properties.center));
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
          color: '#11cdf4',
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
        sence.add(mapsline);
        const extrudeSettings = {
          depth: 4,
          bevelEnabled: false,
          bevelSegments: 1,
          bevelThickness: 0.2,
        };
        const geometry = new THREE.ExtrudeGeometry(shape, extrudeSettings);
        const material = new THREE.MeshBasicMaterial({
          color: index == 2 ? '#0F172A' : `#1E293B`,
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
        if (index == 2) {
          Utils2.setCityMaterial(mesh, '#0F172A', '#054868', false);
        } else {
          // Utils2.setCityMaterial(mesh, '#008c8c' , '#054868', false);
        }
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
          color: '#11cdf4',
          transparent: true,
        });
        // 创建线
        mapsline2 = new THREE.Line(lineGeometry, lineMaterial);
        mapsline2.rotation.x = -0.5 * Math.PI;
        mapsline2.position.set(0, -2, 0);
        mapsline2.material.opacity = 0;
        // 地图厚度
        mapsline2.scale.set(1, 1, 1);
        mapsline2.layers.enable(1);
        sence.add(mapsline2);
      });
    });
    sence.add(province);
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
  // 阶段渲染
  const stageRender = () => {};
  // 渲染
  const render = () => {
    // requestAnimationFrame(render)
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

    if (mapsline1.length > 1 && mapsline2 && circleY5a) {
      renderanmi2();
    }
  };
  // 动画2
  let numsa = -1;
  let numss = 0;
  function renderanmi2() {
    const dt = clock.getDelta();

    numsa += dt + 0.03;
    numss -= dt;
    circleY5a.rotation.z = numss * -1;
    circleY6a.rotation.z = numss;
    circleY7a.rotation.z = numss * -1;
    if (numsa > 0 && numsa < 1.2) {
      mapsline1.map((item) => {
        item.material.opacity = numsa - 0.2;
      });
      mapsline2.material.opacity = numsa - 0.2;
      mapsline2.position.set(0, numsa - 1, 0);
    }
    //  controls.update()
    //  render();
    //  window.requestAnimationFrame(renderanmi)
  }
  // 动画
  function renderanmi() {
    const dt = clock.getDelta();
    //  流动动画
    Utils.animate(dt);
    Utils2.animate(dt);
    //  controls.update();
    TWEEN.update();
    render();
    window.requestAnimationFrame(renderanmi);
  }
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

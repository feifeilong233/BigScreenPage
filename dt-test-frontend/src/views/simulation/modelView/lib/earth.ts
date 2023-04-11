import * as THREE from 'three';
import Earth from '@/assets/earth/Earth.png';
import daqi from '@/assets/earth/daqi.png';
import EarthNormal from '@/assets/earth/EarthNormal.png';
import EarthSpec from '@/assets/earth/EarthSpec.png';
import { CreateConLabel } from './spritetext';
import imgs from '@/assets/bgs.png';
let lnglatarr = [
  {
    name: '中国',
    sN: 'China',
    position: [116.2, 39.55],
  },
  {
    name: '智利',
    sN: 'Chile',
    position: [-70.4, -33.24],
  },
  {
    name: '乍得',
    sN: 'Chad',
    position: [14.59, 12.1],
  },
  {
    name: '英国',
    sN: 'Britain',
    position: [-0.05, 51.36],
  },
];
export const CreateEarth = () => {
  // 创建一个纹理贴图加载器
  var textureLoader = new THREE.TextureLoader();

  // 创建一个组对象，用来插入地球、大气层网格模型
  var group = new THREE.Group();
  var earthGeometry = new THREE.SphereBufferGeometry(100, 30, 30);
  var earthMaterial = new THREE.MeshPhongMaterial({
    map: textureLoader.load(Earth),
    normalMap: textureLoader.load(EarthNormal),
    normalScale: new THREE.Vector2(2.9, 2.9),
    specularMap: textureLoader.load(EarthSpec),
    transparent: true,
    opacity: 0.9,
  });
  var earthMesh = new THREE.Mesh(earthGeometry, earthMaterial);
  // 地球网格模型插入组对象中
  group.add(earthMesh);
  // 创建一个大气层几何体，注意比地球几何体的半径略大一些
  var geometry = new THREE.SphereBufferGeometry(103, 30, 30); //球体
  var texture = textureLoader.load(daqi);
  // 设置重复的作用是：能够让一个效果循环
  texture.wrapS = THREE.RepeatWrapping;
  texture.wrapT = THREE.RepeatWrapping;
  // 自定义顶点着色器对象
  var material = new THREE.ShaderMaterial({
    uniforms: {
      time: { value: -1.0 },
      fTexture: {
        value: texture,
      },
    },
    vertexShader: ` 
           varying vec2 v_Uv;   
            void main () {
              v_Uv = uv;     
              gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4( position, 1.0 );
            }
          `,
    fragmentShader: ` 
             uniform float time;     
              uniform sampler2D fTexture;    
              varying vec2 v_Uv;              
              void main () {
                vec2 new_Uv= v_Uv + vec2( 0.02, 0.02 ) * time;     
                gl_FragColor = texture2D( fTexture, new_Uv );  
              }
          `,
    transparent: true,
  });
  // 创建大气层网格模型
  var mesh = new THREE.Mesh(geometry, material);
  group.add(mesh); //大气层网格模型对象插入组对象中
  // 添加点
  let Congeo = new THREE.SphereGeometry(5, 32, 32);
  let Conmetarial = new THREE.MeshBasicMaterial({ color: '#fff' });
  var cone = new THREE.Mesh(Congeo, Conmetarial);
  let posi = createPosition([116.2, 39.55], true);
  cone.rotation.set(0.75 * Math.PI, 0, Math.acos(posi.y / 103) * Math.PI);
  cone.position.set(posi.x + 3, posi.y - 3, posi.z + 3);
  group.add(cone);
  lnglatarr.forEach((item) => {
    let posi2 = createPosition(item.position, false);
    CreateConLabel(600, 400, item.name, item.sN, imgs, [
      posi2.x,
      posi2.y,
      posi2.z,
    ]).then((res) => {
      group.add(res);
    });
  });

  const animatefun = (deltaTime) => {
    material.uniforms.time.value += deltaTime;
  };
  // 地球坐标转化
  function createPosition(lnglat, type) {
    //  笛卡尔坐标系
    let spherical = new THREE.Spherical();
    // type 主要区分 文字与标点
    spherical.radius = type ? 103 : 123; // 半径值，或者说从该点到原点的
    const lng = lnglat[0];
    const lat = lnglat[1];
    const theta = (lng + 90) * (Math.PI / 180); // 绕 y (up) 轴的赤道角（以弧度为单位）。 默认值为 0。
    const phi = (90 - lat) * (Math.PI / 180); // 与 y (up) 轴的极坐标角（以弧度为单位）。 默认值为 0。
    spherical.phi = phi; // phi是方位面（水平面）内的角度，范围0~360度
    spherical.theta = theta; // theta是俯仰面（竖直面）内的角度，范围0~180度
    let position = new THREE.Vector3();
    position.setFromSpherical(spherical);
    return position;
  }
  return {
    group,
    animatefun,
  };
};

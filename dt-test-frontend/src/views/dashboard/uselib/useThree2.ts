import * as THREE from 'three';
import {GLTFLoader} from 'three/examples/jsm/loaders/GLTFLoader';
import {OrbitControls} from "three/examples/jsm/controls/OrbitControls"
import {ref} from "vue";
import {SkyboxUtils} from '@/lib/threeUtils.ts';

export const roadAxle = ref(41442589);

function Render3DMode(idNames = 'map') {
    let scene2, camera2, controls2;
    let idName = ref(idNames);

    scene2 = new THREE.Scene();
    const width = window.innerWidth * 0.965;//窗口宽度
    const height = window.innerHeight;//窗口高度

    camera2 = new THREE.PerspectiveCamera(85, width / height, 0.1, 1000000);
    camera2.position.set(0, 20, 80);
    camera2.lookAt(scene2.position);

    //灯光效果
    const point2 = new THREE.PointLight(0xffffff);
    point2.position.set(0, 40, 0);
    scene2.add(point2);
    const ambient2 = new THREE.AmbientLight(0xffffff);
    scene2.add(ambient2);

    //创建场景渲染
    const renderer2 = new THREE.WebGLRenderer();
    renderer2.setSize(width, height);
    renderer2.setClearColor(0x5588ff, 1);
    document.getElementById(idName.value)?.appendChild(renderer2.domElement);

    SkyboxUtils.createSkyFromTextures("sky_2").then(texture => {
        scene2.background = texture;
    });

    // 渲染内容
    const render = () => {
        renderer2.render(scene2, camera2);
    };

    const mouseMove = () => {
        controls2 = new OrbitControls(camera2, renderer2.domElement); //创建控件对象
        controls2.addEventListener('change', render);
    };

    // 压路机动画
    let dir2 = 1;
    let jud = 1;
    let num = 0;

    const animate2 = () => {
        render();
        const car2 = scene2.children[2].children[0].children[1].children;
        car2[0].position.x = 0;
        car2[1].position.x = 0;
        car2[2].position.x = 0;
        car2[3].position.x = -10;
        car2[4].position.x = 0;
        if (dir2 == 1) {
            if (jud == 1) {
                scene2.children[2].children[0].children[1].position.x += 2;
                if (scene2.children[2].children[0].children[1].position.x >= 160) {
                    scene2.children[2].children[0].children[1].position.x = 160;
                    scene2.children[2].children[0].children[1].position.y = 0;
                    jud = -1;
                }
            } else {
                num += 1;
                if (num < 157) {
                    scene2.children[2].children[0].children[1].rotation.z += 0.02;
                } else {
                    scene2.children[2].children[0].children[1].rotation.z = Math.PI;
                    num = 0;
                    dir2 = 2;
                    jud = 1;
                }
            }
        } else {
            if (jud == 1) {
                scene2.children[2].children[0].children[1].position.x -= 2;
                if (scene2.children[2].children[0].children[1].position.x < -160) {
                    scene2.children[2].children[0].children[1].position.x = -160;
                    scene2.children[2].children[0].children[1].position.y = 0;
                    jud = -1;
                }
            } else {
                num += 1;
                if (num < 157) {
                    scene2.children[2].children[0].children[1].rotation.z += 0.02;
                } else {
                    scene2.children[2].children[0].children[1].rotation.z = 0;
                    num = 0;
                    dir2 = 1;
                    jud = 1;
                    roadAxle.value += 1;
                }
            }
        }
        requestAnimationFrame(animate2);
    }

    //添加gltf
    const loader2 = new GLTFLoader()
    loader2.load('/road_gltf_5/New_road_5.gltf', (gltf) => {
        scene2.add(gltf.scene);
        mouseMove();
        animate2();
    });
}

export default Render3DMode;

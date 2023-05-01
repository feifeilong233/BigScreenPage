import * as THREE from 'three'
import {CanvasSize, MessageData, WorkerFunName} from './message-data'
import {ref} from "vue";
import {GLTFLoader} from 'three/examples/jsm/loaders/GLTFLoader';
import {SkyboxUtils} from "@/lib/threeUtils";

let renderer2: THREE.WebGLRenderer
let camera2: THREE.PerspectiveCamera
let scene2: THREE.Scene

export const roadAxle = ref(41442589);

//定义初始化的函数
const main = (canvas: OffscreenCanvas) => {
    //开始创建 3D 相关场景
    renderer2 = new THREE.WebGLRenderer({ canvas });
    renderer2.setClearColor(0x5588ff, 1);
    scene2 = new THREE.Scene();

    // 初始化相机
    const initCamera = () => {
        camera2 = new THREE.PerspectiveCamera(85, 16 / 9, 0.1, 1000000)
        camera2.position.set(0, 20, 80);
        camera2.lookAt(scene2.position);

        dispatchCreateCamera({
            args: [85, 16 / 9, 0.1, 1000000],
            position: [0, 20, 80],
            lookAt: [scene2.position.x, scene2.position.y, scene2.position.z]
        })
    }

    function dispatchCreateCamera(data) {
        self.postMessage({
            type: WorkerFunName.createCamera,
            data: data
        })
    }

    initCamera();

    //灯光效果
    const point2 = new THREE.PointLight(0xffffff);
    point2.position.set(0, 40, 0);
    scene2.add(point2);
    const ambient2 = new THREE.AmbientLight(0xffffff);
    scene2.add(ambient2);

    //天空盒
    // const textureLoader = new THREE.ImageBitmapLoader()
    // textureLoader.setOptions( { imageOrientation: 'flipY' } );
    // textureLoader.load('/images/sky_3.jpg', (imageBitmap) => {
    //     const texture = new THREE.CanvasTexture(imageBitmap);
    //     const crt = new THREE.WebGLCubeRenderTarget(texture.image.height)
    //     crt.fromEquirectangularTexture(renderer2, texture)
    //     scene2.background = crt.texture
    // })
    SkyboxUtils.createSkyFromTextures2("sky_3.jpg").then(texture => {
        const crt = new THREE.WebGLCubeRenderTarget(texture.image.height);
        crt.fromEquirectangularTexture(renderer2, texture)
        scene2.background = crt.texture
    });

    // 渲染内容
    const render = () => {
        renderer2.render(scene2, camera2);
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
    const loader2 = new GLTFLoader();
    loader2.load('/road_gltf_5/New_road_5.gltf',(gltf) => {
        scene2.add(gltf.scene);
        animate2();
    });
}

const updateCamera = (data) => {
    const { position, lookAt } = data;
    camera2.position.set(...position)
    camera2.lookAt(new THREE.Vector3(...lookAt));
}

//定义用来接收画布尺寸更新的函数
const updateSize = (newSize: CanvasSize) => {
    camera2.aspect = newSize.width / newSize.height
    camera2.updateProjectionMatrix()
    renderer2.setSize(newSize.width, newSize.height, false)
}

const handleMessage = ((eve: MessageEvent<MessageData>) => {
    switch (eve.data.type) {
        case WorkerFunName.updateCamera:
            updateCamera(eve.data.params)
            break
        case WorkerFunName.main:
            main(eve.data.params)
            break
        case WorkerFunName.updateSize:
            updateSize(eve.data.params)
            break
        default:
            throw new Error(`no handle for the type`)
    }
})
self.addEventListener('message', handleMessage)

const handleMessageError = () => {
    throw new Error('Worker.ts: message error ...')
}
self.addEventListener('messageerror', handleMessageError)

//导出 {} 是因为 .ts 类型的文件必须有导出对象才可以被 TS 编译成模块，而不是全局对象
export { }

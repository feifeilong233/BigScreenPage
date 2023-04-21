import * as THREE from 'three'
import { CanvasSize, MessageData, WorkerFunName } from './message-data'
import {ref} from "vue";
import {GLTFLoader} from 'three/examples/jsm/loaders/GLTFLoader';

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
    camera2 = new THREE.PerspectiveCamera(85, 16 / 9, 0.1, 1000000);
    camera2.position.set(0, 20, 80);
    camera2.lookAt(scene2.position);

    //灯光效果
    const point2 = new THREE.PointLight(0xffffff);
    point2.position.set(0, 40, 0);
    scene2.add(point2);
    const ambient2 = new THREE.AmbientLight(0xffffff);
    scene2.add(ambient2);

    // 渲染内容
    const render = () => {
        renderer2.render(scene2, camera2);
    };

    //添加gltf
    const loader2 = new GLTFLoader();
    loader2.load('/road_gltf_5/New_road_5.gltf',(gltf) => {
        scene2.add(gltf.scene);
        render();
    });
}

//定义用来接收画布尺寸更新的函数
const updateSize = (newSize: CanvasSize) => {
    camera2.aspect = newSize.width / newSize.height
    camera2.updateProjectionMatrix()
    renderer2.setSize(newSize.width, newSize.height, false)
}

const handleMessage = ((eve: MessageEvent<MessageData>) => {
    switch (eve.data.type) {
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

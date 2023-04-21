import {onUnmounted} from "vue";
import * as THREE from 'three';
import {OrbitControls} from "three/examples/jsm/controls/OrbitControls"
import { WorkerFunName } from './message-data'
import Worker from "./worker.ts?worker"

function Render3DModel(canvasRef) {
    const canvas = canvasRef.value
    if (canvas.transferControlToOffscreen !== null) {
        console.log('当前浏览器支持 OffscreenCanvas')
    } else {
        console.log('当前浏览器不支持 OffscreenCanvas')
        return
    }

    const dispatchCameraUpdate = (data) => {
        worker.postMessage({
            type: WorkerFunName.updateCamera,
            params: data
        })
    }

    let camera;
    const createCamera = (data) => {
        const { args, position, lookAt} = data;
        camera = new THREE.PerspectiveCamera(...args)
        camera.position.set(...position);
        camera.lookAt(new THREE.Vector3(...lookAt));
        const $camera = new Proxy(camera, {
            get(target, key, receiver) {
                const value = Reflect.get(target, key, receiver)
                if (key === 'lookAt') {
                    return function ($target) {
                        value.call(target, $target)
                        dispatchCameraUpdate({
                            position: [camera.position.x, camera.position.y, camera.position.z],
                            lookAt: [$target.x, $target.y, $target.z]
                        })
                    }
                }
                return value
            }
        })
        new OrbitControls($camera, canvas)
    }

    const offscreen = canvas.transferControlToOffscreen()
    const worker = new Worker()
    worker.postMessage({type: WorkerFunName.main, params: offscreen}, [offscreen])
    worker.onmessage = function ({data}) {
        switch (data.type) {
            case WorkerFunName.createCamera:
                createCamera(data.data);
                break;
        }
    }
    const handleMessageError = (error: MessageEvent<any>) => {
        console.log(error)
    }
    const handleError = (error: ErrorEvent) => {
        console.log(error)
    }
    worker.addEventListener('messageerror', handleMessageError)
    worker.addEventListener('error', handleError)
    const handleResize = () => {
        worker.postMessage({
            type: WorkerFunName.updateSize,
            params: {width: canvas.clientWidth, height: canvas.clientHeight},
        })
    }
    handleResize()
    window.addEventListener('resize', handleResize)

    onUnmounted(() => {
        worker.removeEventListener('messageerror', handleMessageError)
        worker.removeEventListener('error', handleError)
    })
}

export default Render3DModel;

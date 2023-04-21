import {onUnmounted} from "vue";
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
    const offscreen = canvas.transferControlToOffscreen()
    const worker = new Worker()
    worker.postMessage({type: WorkerFunName.main, params: offscreen}, [offscreen])
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

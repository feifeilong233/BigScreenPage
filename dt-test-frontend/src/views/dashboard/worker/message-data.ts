//定义画布的尺寸类型数据结构
export type CanvasSize = {
    width: number,
    height: number
}

export enum WorkerFunName {
    main = 'main',
    updateSize = 'updateSize',
    updateCamera = 'updateCamera',
    createCamera = 'createCamera'
}

//定义 MessageEvent data 的数据结构
export type MessageData =
    { type: WorkerFunName.main, params: OffscreenCanvas }
    |
    { type: WorkerFunName.updateSize, params: CanvasSize }

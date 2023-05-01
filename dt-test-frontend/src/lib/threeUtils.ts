import * as THREE from 'three';

export class SkyboxUtils {
    /**
     * Creates skybox by 6 pictures. The texture should be assigned to scene.background.
     */
    public static async createSkyFromTextures(subFolder: string): Promise<THREE.CubeTexture> {
        const loader = new THREE.CubeTextureLoader();
        loader.setPath(`/images/${subFolder}/`);
        const pictures = ["right.jpg", "left.jpg", "top.jpg", "bottom.jpg", "front.jpg", "back.jpg"];
        return new Promise<THREE.CubeTexture>((resolve, reject) => {
            loader.load(pictures, (t: THREE.CubeTexture) => resolve(t));
        });
    }

    public static async createSkyFromTextures2(imgPathName: string): Promise<THREE.CanvasTexture> {
        const textureLoader = new THREE.ImageBitmapLoader()
        textureLoader.setOptions( { imageOrientation: 'flipY' } );
        return new Promise<THREE.CanvasTexture>((resolve, reject) => {
            textureLoader.load(`/images/${imgPathName}/`, (imageBitmap) => {
                const texture = new THREE.CanvasTexture(imageBitmap);
                resolve(texture);
            });
        });
    }
}

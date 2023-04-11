// @ts-nocheck
import * as THREE from 'three';
import {GLTFLoader} from 'three/examples/jsm/loaders/GLTFLoader';
import {OrbitControls} from "three/examples/jsm/controls/OrbitControls"
import {ref} from "vue";

function Render3DMode(idNames = 'three-frame') {
    let scene, camera, controls;
    let idName = ref(idNames);

    scene = new THREE.Scene();
    const width = document.getElementById(idName.value)?.offsetWidth;//窗口宽度
    const height = document.getElementById(idName.value)?.offsetHeight;//窗口高度

    camera = new THREE.PerspectiveCamera(85, width / height, 0.1, 1000000);
    camera.position.set(0, 20, 80);
    camera.lookAt(scene.position);

    //灯光效果
    const point = new THREE.PointLight(0xffffff);
    point.position.set(400, 200, 300);
    scene.add(point);
    const ambient = new THREE.AmbientLight(0xffffff);
    scene.add(ambient);

    //创建场景渲染
    const renderer = new THREE.WebGLRenderer();
    renderer.setSize(width, height);
    renderer.setClearColor(0xb9d3ff,1);
    document.getElementById(idName.value)?.appendChild(renderer.domElement);

    // 渲染内容
    const render = () => {
        renderer.render(scene, camera);
    };

    const mouseMove = () => {
        controls = new OrbitControls(camera, renderer.domElement); //创建控件对象
        controls.addEventListener('change', render);
    };

    //添加gltf
    const loader = new GLTFLoader()
    loader.load('/road_gltf_7/New_road_7.gltf', (gltf) => {
        scene.add(gltf.scene);
        mouseMove();
        animate();
    });

    // 压路机动画
    let dir = 1;
    const animate = () => {
        render();
        const car = scene.children[2].children[0].children[0].children;
        // console.log(car[0].position.y);
        const i = [car[0].position.y, car[1].position.y, car[2].position.y, car[3].position.y, car[4].position.y];
        if (i[0] < 100 && dir == 1) {
            car[0].position.y = i[0] + 1;
            car[1].position.y = i[1] + 1;
            car[2].position.y = i[2] + 1;
            car[3].position.y = i[3] + 1;
            car[4].position.y = i[4] + 1;
        } else {
            dir = -1;
        }
        if (i[0] > -180 && dir == -1) {
            car[0].position.y = i[0] - 1;
            car[1].position.y = i[1] - 1;
            car[2].position.y = i[2] - 1;
            car[3].position.y = i[3] - 1;
            car[4].position.y = i[4] - 1;
        } else {
            dir = 1;
        }
        requestAnimationFrame(animate);
    }

    // 修改模型数据
    const onChange = () => {
        const H = [];
        const te = [];
        let i = 0;
        while (i < 6) {
            const s = "text" + (i + 1);
            const txt = "tx" + (i + 1);
            H[i] = parseFloat(document.getElementById(s)?.value) * 3;
            te[i] = (document.getElementById(txt)?.value);
            i = i + 1;
        }
        model_load(H, te)
    }

    //找到目标模型
    const FindTarget = (obj, target) => {
        obj = obj.scene;
        let i = 0;
        let j = 0;
        const mycars = [];
        while (i < 16) {
            if (obj.children[0].children[i].name.search(target) != -1) {
                mycars[j] = i;
                j = j + 1;
            }
            i = i + 1;
        }
        return mycars;
    }

    // 修改材质
    const ChangeTexture = (obj, target, img_path) => {
        obj = obj.scene;
        const texture = new THREE.TextureLoader().load(img_path);
        texture.encoding = THREE.sRGBEncoding;
        texture.flipY = false;
        texture.needsUpdate = true;
        texture.wrapS = THREE.RepeatWrapping;
        texture.wrapT = THREE.RepeatWrapping;
        texture.repeat.set(1, 1);

        //新建材质
        obj.children[0].children[target].material = new THREE.MeshStandardMaterial({map: texture});
        obj.children[0].children[target].material.needsUpdate = true;
    }

    // 修改路面厚度
    const ChangeDepth = (obj, target, h) => {
        obj = obj.scene;
        obj.children[0].children[target].geometry.attributes.position.data.array[2] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[10] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[34] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[58] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[66] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[74] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[82] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[90] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[106] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[114] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[162] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[186] = h;
        obj.children[0].children[target].geometry.attributes.position.data.array[7] = -1.0137795209884644;
        obj.children[0].children[target].geometry.attributes.position.data.array[15] = -1.0137795209884644;
    }

    // 改变模型位置
    const ChangePosition = (obj, target, z) => {
        obj = obj.scene;
        obj.children[0].children[target].position.z = z;
    }

    const model_load = (H, te) => {
        let obj;
        loader.load('/road_gltf_7/New_road_7.gltf', (gltf) => {
            obj = gltf;
            const ary = ["road_5", "road_4", "road_3", "road_2", "road_1", "road_0", "绿化带"];
            const texture = ["New_road_7_img_007.png", "New_road_7_img_000.jpg", "New_road_7_img_005.jpg", "New_road_7_img_002.jpg", "New_road_7_img_003.jpg", "New_road_7_img_001.jpg"];
            let j = 5;
            let z = 3.28084;
            FindTarget(obj, ary[0]);
            while (-1 < j) {
                const i = FindTarget(obj, ary[5 - j]);
                console.log("*********" + i);
                let n = 0;
                while (n < i.length) {
                    ChangeTexture(obj, i[n], "/road_gltf_7/" + texture[te[j] - 1]);
                    ChangePosition(obj, i[n], z);
                    ChangeDepth(obj, i[n], H[j]);
                    n = n + 1;
                }
                z = z + H[j];
                j--;
            }
            const car = FindTarget(obj, "Caterpillar");
            console.log(car);
            let m = 0;
            while (m < 5) {
                obj.scene.children[0].children[car[0]].children[m].position.z = z;
                m++;
            }
            ChangeDepth(obj, FindTarget(obj, ary[5 - j])[0], z - 3.28084 + 0.3);
            scene.add(gltf.scene);
            render();
            animate();
            console.log(scene);
        });
    }

    return { onChange };
}

export default Render3DMode;

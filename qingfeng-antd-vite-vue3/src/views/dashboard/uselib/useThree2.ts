import * as THREE from 'three';
import {ref} from "vue";

function Render3DMode(idNames = 'map') {
    let scene2, camera2;
    let idName = ref(idNames);
//创建场景
    scene2 = new THREE.Scene();
    // scene.background = new THREE.Color(0xffffff);
    //创建相机，设置相机的位置

    const width = window.innerWidth * 0.7;//窗口宽度
    // var height = window.innerHeight;//窗口高度
    // var width = 910;//窗口宽度
    const height = window.innerHeight * 0.5;//窗口高度
    console.log(width);
    console.log(height);
    const k = width / height;//窗口宽高比
    const s = 2000;//三维场景缩放系数
    //       //创建相机对象
    //        var camera=new THREE.OrthographicCamera(-s*k,s*k, s,-s,1,1000);
    //        camera.position.set(20000,20000,20000);//设置相机位置
    //        camera.lookAt(scene.position);//设置相机方向(指向的场景对象)

    camera2 = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000000);
    camera2.position.set(0, 20, 80);
    // camera.position.set(1,1,1);
    // console.log(scene.position);
    camera2.lookAt(scene2.position);


    // camera = new THREE.OrthographicCamera( width / - 2, width / 2, height / 2, height / - 2, 0.1, 11000 );

    // camera = new THREE.OrthographicCamera( -s*k, s*k, -s ,s, 0.1, 11000 );
    // camera.position.set(1500, 1500, 1500);
    // camera.lookAt(scene.position);
    //灯光效果
    const point2 = new THREE.PointLight(0xffffff);
    // point.position.set(400,200,300);
    point2.position.set(0, 40, 0);
    scene2.add(point2);

    const ambient2 = new THREE.AmbientLight(0xffffff);
    scene2.add(ambient2);
    //创建场景渲染
    const renderer2 = new THREE.WebGLRenderer();
    renderer2.setSize(width, height);
    renderer2.setClearColor(0x5588ff, 1);
    document.getElementById(idName.value)?.appendChild(renderer2.domElement);

    //添加gltf
    const loader2 = new THREE.GLTFLoader();
    // road_gltf/New_road.gltf
    loader2.load('/road_gltf_5/New_road_5.gltf', function (gltf) {
        console.log(gltf);

        scene2.add(gltf.scene);

    }, undefined, function (error) {

        console.error(error);

    });
}

export default Render3DMode;

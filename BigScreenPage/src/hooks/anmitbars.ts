import * as THREE from 'three';
export default {
  time: { value: 0 },
  StartTime: { value: 0 },
  isStart: true,
  forMaterial(materials, callback) {
    if (!callback || !materials) return false;
    if (Array.isArray(materials)) {
      materials.forEach((mat) => {
        callback(mat);
      });
    } else {
      callback(materials);
    }
  },
  setCityMaterial(object, color1 = '#008c8c', color2 = '#054868', uAns) {
    // 确定oject的geometry的box size
    object.geometry.computeBoundingBox();
    object.geometry.computeBoundingSphere();

    const { geometry } = object;

    // 获取geometry的长宽高 中心点
    const { center, radius } = geometry.boundingSphere;
    geometry.verticesNeedUpdate = true;

    const { max, min } = geometry.boundingBox;

    const size = new THREE.Vector3(max.x - min.x, max.y - min.y, max.z - min.z);
    this.forMaterial(object.material, (material) => {
      // material.opacity = 0.6;
      material.transparent = true;
      // material.color.setStyle("#1B3045");

      material.onBeforeCompile = (shader) => {
        shader.uniforms.time = this.time;
        shader.uniforms.uAns = uAns;
        shader.uniforms.uStartTime = this.StartTime;
        // 中心点
        shader.uniforms.uCenter = {
          value: center,
        };

        // geometry大小
        shader.uniforms.uSize = {
          value: size,
        };

        shader.uniforms.uTopColor = {
          value: new THREE.Color(color1),
        };
        shader.uniforms.uDownColor = {
          value: new THREE.Color(color2),
        };
        // 效果开关
        shader.uniforms.uSwitch = {
          value: new THREE.Vector3(
            0, // 扩散
            0, // 左右横扫
            0, // 向上扫描
          ),
        };

        // 扩散中心点
        shader.uniforms.uFlow = {
          value: new THREE.Vector3(
            1, // 0 1开关
            1, // 范围
            0.5, // 速度
          ),
        };

        // 效果颜色
        shader.uniforms.uColor = {
          value: new THREE.Color('#f40'),
        };
        // 效果颜色
        shader.uniforms.uFlowColor = {
          value: new THREE.Color('#5588AA'),
        };

        // 效果透明度
        shader.uniforms.uOpacity = {
          value: 1,
        };

        // 效果透明度
        shader.uniforms.uRadius = {
          value: radius,
        };

        /**
         * 对片元着色器进行修改
         */
        const fragment = ` 
                varying vec4 vPositionMatrix;
                 varying vec3 vPosition;
    
                 uniform float time;
                // 扩散参数
                uniform float uRadius;
                uniform float uOpacity;
                // 初始动画参数
                uniform float uStartTime;
                uniform float uAns;   
                uniform vec3 uSize;
                uniform vec3 uFlow;
                uniform vec3 uColor;
                uniform vec3 uCenter;
                uniform vec3 uSwitch;
                uniform vec3 uTopColor;
                uniform vec3 uDownColor; 
                uniform vec3 uFlowColor; 
    
    void main() {
        `;
        let fragmentColor = `
                vec3 distColor = outgoingLight;
                float dstOpacity = diffuseColor.a; 
                float indexMix = vPosition.z / (uSize.z * 0.90);
                distColor = mix(uDownColor, uTopColor, indexMix);
                
                
                // 流动效果
                if (uFlow.x > 0.3) {
                    // 扩散速度 
                    float dTime = mod(1.1 * uFlow.z, uSize.z);  
                    // 流动范围
                    float topY = vPosition.z + uFlow.y+0.5;
                    if (dTime > vPosition.z && dTime < topY) {
                        // 颜色渐变 
                        float dIndex = sin((topY - dTime) / uFlow.y * PI);
                
                        distColor = mix(distColor, uFlowColor,  dIndex); 
                    }
                } 
                gl_FragColor = vec4(distColor, dstOpacity * uStartTime);
                    `;
        shader.fragmentShader = shader.fragmentShader.replace(
          'void main() {',
          fragment,
        );
        shader.fragmentShader = shader.fragmentShader.replace(
          'gl_FragColor = vec4( outgoingLight, diffuseColor.a );',
          fragmentColor,
        );

        /**
         * 对顶点着色器进行修改
         */
        const vertex = `
                varying vec4 vPositionMatrix;
                varying vec3 vPosition;
                uniform float uStartTime;
                void main() {
                        vPositionMatrix = projectionMatrix * vec4(position, 1.0);
                        vPosition = position;
                        `;
        const vertexPosition = `
                vec3 transformed = vec3(position.x, position.y , position.z * uStartTime);
                `;
        shader.vertexShader = shader.vertexShader.replace(
          'void main() {',
          vertex,
        );
        shader.vertexShader = shader.vertexShader.replace(
          '#include <begin_vertex>',
          vertexPosition,
        );
      };
    });
  },
  animate(dt) {
    if (dt > 1) return false;
    this.time.value += dt;
    // 启动
    if (this.isStart) {
      this.StartTime.value += dt * 0.3;
      if (this.StartTime.value >= 1) {
        this.StartTime.value = 1;
        this.isStart = false;
      }
    }
  },
};

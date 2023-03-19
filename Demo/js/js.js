
$(function () {
echarts_1();
echarts_2();
echarts_4();
echarts_31();
echarts_32();
echarts_33();
echarts_5();
echarts_6();
show_3D();
function show_3D() {
    //创建场景
scene = new THREE.Scene();
// scene.background = new THREE.Color(0xffffff);
//创建相机，设置相机的位置

var width = 740;//窗口宽度
var height = 400;//窗口高度
console.log(width);
console.log(height);
   var k = width/height;//窗口宽高比
  var s =2000;//三维场景缩放系数
//       //创建相机对象
//        var camera=new THREE.OrthographicCamera(-s*k,s*k, s,-s,1,1000);
//        camera.position.set(20000,20000,20000);//设置相机位置
//        camera.lookAt(scene.position);//设置相机方向(指向的场景对象)

camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000000);
camera.position.set(0,20,80);
// camera.position.set(1,1,1);
// console.log(scene.position);
camera.lookAt(scene.position);


// camera = new THREE.OrthographicCamera( width / - 2, width / 2, height / 2, height / - 2, 0.1, 11000 );

// camera = new THREE.OrthographicCamera( -s*k, s*k, -s ,s, 0.1, 11000 );
// camera.position.set(1500, 1500, 1500);
// camera.lookAt(scene.position);
//灯光效果
var point=new THREE.PointLight(0xffffff);
// point.position.set(400,200,300);
point.position.set(0,40,0);
scene.add(point);

var ambient = new THREE.AmbientLight(0xffffff);
scene.add(ambient);
//创建场景渲染
var renderer = new THREE.WebGLRenderer();
renderer.setSize(width, height);
renderer.setClearColor(0x5588ff,1);
document.getElementById("map").appendChild(renderer.domElement);



// var geometry = new THREE.BoxGeometry( 100, 100, 100);  //边长100的正方体   
// var material = new THREE.MeshLambertMaterial({
//     color: 0xFF0000
// });
// var mesh = new THREE.Mesh(geometry, material);
// scene.add(mesh);


  //添加gltf
var loader = new THREE.GLTFLoader();
// road_gltf/New_road.gltf
loader.load('road_gltf_5/New_road_5.gltf', function ( gltf ) {
console.log(gltf);
// gltf.scene.children[0].children[13].children[0].material.color.r=1;
// gltf.scene.children[0].children[13].children[0].geometry.boundingBox.max.z=3000;
// gltf.scene.children[0].children[13].children[0].geometry.attributes.position.array[5]=3000;
// gltf.scene.children[0].children[13].children[0].geometry.attributes.position.array[8]=3000;
// gltf.scene.children[0].children[13].children[0].geometry.attributes.position.array[17]=3000;
// gltf.scene.children[0].children[13].children[0].geometry.attributes.position.array[20]=3000;

// gltf.scene.children[0].children[13].children[0].geometry.attributes.position.array=new Float32Array([500,-50000, 0, 500, -50000, 3000, -500, -50000, 3000, -500, -50000, 0, -500, 50000, 0, -500, 50000, 3000, 500, 50000, 3000, 500, 50000, 0]);
// console.log(gltf.scene.children[0].children[13].children[0].material.color);
// console.log(gltf.scene.children[0].children[13].children[0].geometry.boundingBox.max);
// console.log(gltf.scene.children[0].children[13].children[0].geometry.attributes.position.array);
// c=gltf.scene.children[0].children[13].children[0].material.color;

scene.add( gltf.scene );


}, undefined, function ( error ) {

console.error( error );

} );

function animate() {
requestAnimationFrame( animate );
renderer.render( scene, camera );
}
animate();
function onWindowResize() {

camera.aspect = width / height;
camera.updateProjectionMatrix();

renderer.setSize( width, height );

render();

}

function render(){
  renderer.render( scene, camera );

}
render();
   var controls=new THREE.OrbitControls(camera,document.getElementById("map"));
  controls.addEventListener('change',render);
window.addEventListener( 'resize', onWindowResize );

}
function echarts_1() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echart1'));

       option = {
  //  backgroundColor: '#00265f',
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        }
    },
    grid: {
        left: '0%',
		top:'10px',
        right: '0%',
        bottom: '4%',
       containLabel: true
    },
    xAxis: [{
        type: 'category',
      		// data: ['商超门店', '教育培训', '房地产', '生活服务', '汽车销售', '旅游酒店', '五金建材'],
            data:[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],

        axisLine: {
            show: true,
         lineStyle: {
                color: "rgba(255,255,255,.1)",
                width: 1,
                type: "solid"
            },
        },
		
        axisTick: {
            show: false,
        },
		axisLabel:  {
                interval: 0,
               // rotate:50,
                show: true,
                splitNumber: 15,
                textStyle: {
 					color: "rgba(255,255,255,.6)",
                    fontSize: '12',
                },
            },
    }],
    yAxis: [{
        type: 'value',
        axisLabel: {
           //formatter: '{value} %'
			show:true,
			 textStyle: {
 					color: "rgba(255,255,255,.6)",
                    fontSize: '12',
                },
        },
        axisTick: {
            show: false,
        },
        axisLine: {
            show: true,
            lineStyle: {
                color: "rgba(255,255,255,.1	)",
                width: 1,
                type: "solid"
            },
        },
        splitLine: {
            lineStyle: {
               color: "rgba(255,255,255,.1)",
            }
        }
    }],
    series: [
		{
        type: 'bar',
        // data: [200, 300, 300, 900, 1500, 1200, 600],
        data:[4.4533, 
            5.0184 ,
            5.4729 ,
            5.6846 ,
            5.8265 ,
            5.9318 ,
            6.0169 ,
            6.0334 ,
            6.0394 ,
            6.1108 ,
            6.1722 ,
            6.2254 ,
            6.2732 ,
            6.3139 ,
            6.3511 ,
            6.3616 ,
            6.3971 ,
            6.4280 ,
            6.4569 ,
            6.4840 ,
            6.5095 ,
            6.5394 ,
            6.5462 ,
            6.5698 
            ],
        barWidth:'35%', //柱子宽度
       // barGap: 1, //柱子之间间距
        itemStyle: {
            normal: {
                color:'#2f89cf',
                opacity: 1,
				barBorderRadius: 5,
            }
        }
    }
		
	]
};
      
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
function echarts_2() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echart2'));

       option = {
  //  backgroundColor: '#00265f',
    tooltip: {
        trigger: 'axis',
        axisPointer: { type: 'shadow'}
    },
    grid: {
        left: '0%',
		top:'10px',
        right: '0%',
        bottom: '4%',
       containLabel: true
    },
    xAxis: [{
        type: 'category',
      		// data: ['浙江', '上海', '江苏', '广东', '北京', '深圳', '安徽'],
            data:[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],
        axisLine: {
            show: true,
         lineStyle: {
                color: "rgba(255,255,255,.1)",
                width: 1,
                type: "solid"
            },
        },
		
        axisTick: {
            show: false,
        },
		axisLabel:  {
                interval: 0,
               // rotate:50,
                show: true,
                splitNumber: 15,
                textStyle: {
 					color: "rgba(255,255,255,.6)",
                    fontSize: '12',
                },
            },
    }],
    yAxis: [{
        type: 'value',
        axisLabel: {
           //formatter: '{value} %'
			show:true,
			 textStyle: {
 					color: "rgba(255,255,255,.6)",
                    fontSize: '12',
                },
        },
        axisTick: {
            show: false,
        },
        axisLine: {
            show: true,
            lineStyle: {
                color: "rgba(255,255,255,.1	)",
                width: 1,
                type: "solid"
            },
        },
        splitLine: {
            lineStyle: {
               color: "rgba(255,255,255,.1)",
            }
        }
    }],
    series: [
		{
       
        type: 'bar',
        // data: [1500, 1200, 600, 200, 300, 300, 900],
        data:[5.11 ,
            5.34 ,
            5.09 ,
            5.62 ,
            5.95 ,
            5.66 ,
            6.29 ,
            5.83 ,
            6.67 ,
            6.30 ,
            8.27 ,
            7.39 ,
            7.13 ,
            7.41 ,
            7.53 ,
            8.40 ,
            7.88 ,
            7.55 ,
            6.44 ,
            6.22 ,
            6.26 ,
            6.01 ,
            5.67 ,
            5.80 
            ],
        barWidth:'35%', //柱子宽度
       // barGap: 1, //柱子之间间距
        itemStyle: {
            normal: {
                color:'#27d08a',
                opacity: 1,
				barBorderRadius: 5,
            }
        }
    }
		
	]
};
      
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
function echarts_5() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echart5'));

       option = {
  //  backgroundColor: '#00265f',
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        }
    },
    
    grid: {
        left: '0%',
		top:'10px',
        right: '0%',
        bottom: '2%',
       containLabel: true
    },
    xAxis: [{
        type: 'category',
      		// data: ['浙江', '上海', '江苏', '广东', '北京', '深圳', '安徽', '四川'],
            data:[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],
        axisLine: {
            show: true,
         lineStyle: {
                color: "rgba(255,255,255,.1)",
                width: 1,
                type: "solid"
            },
        },
		
        axisTick: {
            show: false,
        },
		axisLabel:  {
                interval: 0,
               // rotate:50,
                show: true,
                splitNumber: 15,
                textStyle: {
 					color: "rgba(255,255,255,.6)",
                    fontSize: '12',
                },
            },
    }],
    yAxis: [{
        type: 'value',
        axisLabel: {
           //formatter: '{value} %'
			show:true,
			 textStyle: {
 					color: "rgba(255,255,255,.6)",
                    fontSize: '12',
                },
        },
        axisTick: {
            show: false,
        },
        axisLine: {
            show: true,
            lineStyle: {
                color: "rgba(255,255,255,.1	)",
                width: 1,
                type: "solid"
            },
        },
        splitLine: {
            lineStyle: {
               color: "rgba(255,255,255,.1)",
            }
        }
    }],
    series: [{
        type: 'bar',
        data: [2, 3, 3, 9, 15, 12, 6, 4, 6, 7, 4, 10],
        data:[1.88, 
            1.82 ,
            1.87 ,
            1.84 ,
            1.88 ,
            1.84 ,
            1.83 ,
            1.96 ,
            1.97 ,
            1.95 ,
            1.81 ,
            1.96 ,
            1.80 ,
            1.79 ,
            1.98 ,
            2.09 ,
            1.98 ,
            2.00 ,
            2.24 ,
            1.98 ,
            1.91 ,
            1.95 ,
            1.89 ,
            1.83 
            ],
        barWidth:'35%', //柱子宽度
       // barGap: 1, //柱子之间间距
        itemStyle: {
            normal: {
                color:'#2f89cf',
                opacity: 1,
				barBorderRadius: 5,
            }
        }
    }
	]
};
      
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
	
function echarts_4() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echart4'));

    option = {
	    tooltip: {
        trigger: 'axis',
        axisPointer: {
            lineStyle: {
                color: '#dddc6b'
            }
        }
    },
		    legend: {
    top:'0%',
        data:['STR1','STR2'],
                textStyle: {
           color: 'rgba(255,255,255,.5)',
			fontSize:'12',
        }
    },
    grid: {
        left: '10',
		top: '30',
        right: '10',
        bottom: '10',
        containLabel: true
    },

    xAxis: [{
        type: 'category',
        boundaryGap: false,
axisLabel:  {
                textStyle: {
 					color: "rgba(255,255,255,.6)",
					fontSize:12,
                },
            },
        axisLine: {
			lineStyle: { 
				color: 'rgba(255,255,255,.2)'
			}

        },

   data: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24']

    }, {

        axisPointer: {show: false},
        axisLine: {  show: false},
        position: 'bottom',
        offset: 20,

       

    }],

    yAxis: [{
        type: 'value',
        axisTick: {show: false},
        axisLine: {
            lineStyle: {
                color: 'rgba(255,255,255,.1)'
            }
        },
       axisLabel:  {
                textStyle: {
 					color: "rgba(255,255,255,.6)",
					fontSize:12,
                },
            },

        splitLine: {
            lineStyle: {
                 color: 'rgba(255,255,255,.1)'
            }
        }
    }],
    series: [
		{
        name: 'STR1',
        type: 'line',
         smooth: true,
        symbol: 'circle',
        symbolSize: 5,
        showSymbol: false,
        lineStyle: {
			
            normal: {
				color: '#0184d5',
                width: 2
            }
        },
        areaStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: 'rgba(1, 132, 213, 0.4)'
                }, {
                    offset: 0.8,
                    color: 'rgba(1, 132, 213, 0.1)'
                }], false),
                shadowColor: 'rgba(0, 0, 0, 0.1)',
            }
        },
			itemStyle: {
			normal: {
				color: '#0184d5',
				borderColor: 'rgba(221, 220, 107, .1)',
				borderWidth: 12
			}
		},
        // data: [3, 4, 3, 4, 3, 4, 3, 6, 2, 4, 2, 4,3, 4, 3, 4, 3, 4, 3, 6, 2, 4, 2, 4],
        data:[15.56 ,
            15.85 ,
            14.95 ,
            15.15 ,
            6.33 ,
            15.29 ,
            17.04 ,
            17.24 ,
            16.76 ,
            17.93 ,
            23.96 ,
            26.89 ,
            27.05 ,
            32.83 ,
            27.88 ,
            31.50 ,
            33.49 ,
            33.10 ,
            33.84 ,
            38.27 ,
            37.46 ,
            33.19 ,
            40.49 ,
            42.23 
            ],

    }, 
{
        name: 'STR2',
        type: 'line',
        smooth: true,
        symbol: 'circle',
        symbolSize: 5,
        showSymbol: false,
        lineStyle: {
			
            normal: {
				color: '#00d887',
                width: 2
            }
        },
        areaStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: 'rgba(0, 216, 135, 0.4)'
                }, {
                    offset: 0.8,
                    color: 'rgba(0, 216, 135, 0.1)'
                }], false),
                shadowColor: 'rgba(0, 0, 0, 0.1)',
            }
        },
			itemStyle: {
			normal: {
				color: '#00d887',
				borderColor: 'rgba(221, 220, 107, .1)',
				borderWidth: 12
			}
		},
        // data: [5, 3, 5, 6, 1, 5, 3, 5, 6, 4, 6, 4, 8, 3, 5, 6, 1, 5, 3, 7, 2, 5, 1, 4],
        data:[15.67 ,
            15.98 ,
            14.81 ,
            16.36 ,
            8.53 ,
            16.56 ,
            18.11 ,
            18.35 ,
            18.57 ,
            21.66 ,
            26.12 ,
            31.78 ,
            31.79 ,
            35.51 ,
            36.92 ,
            38.18 ,
            42.61 ,
            42.19 ,
            31.55 ,
            49.42 ,
            34.39 ,
            37.94 ,
            51.86 ,
            49.89 
            ]

    }, 
	
		 ]

};
      
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
function echarts_6() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echart6'));

        option = {
            tooltip: {
            trigger: 'axis',
            axisPointer: {
                lineStyle: {
                    color: '#dddc6b'
                }
            }
        },
                legend: {
        top:'0%',
            data:['STR1','STR2'],
                    textStyle: {
               color: 'rgba(255,255,255,.5)',
                fontSize:'12',
            }
        },
        grid: {
            left: '10',
            top: '30',
            right: '10',
            bottom: '10',
            containLabel: true
        },
    
        xAxis: [{
            type: 'category',
            boundaryGap: false,
    axisLabel:  {
                    textStyle: {
                         color: "rgba(255,255,255,.6)",
                        fontSize:12,
                    },
                },
            axisLine: {
                lineStyle: { 
                    color: 'rgba(255,255,255,.2)'
                }
    
            },
    
       data: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24']
    
        }, {
    
            axisPointer: {show: false},
            axisLine: {  show: false},
            position: 'bottom',
            offset: 20,
    
           
    
        }],
    
        yAxis: [{
            type: 'value',
            axisTick: {show: false},
            axisLine: {
                lineStyle: {
                    color: 'rgba(255,255,255,.1)'
                }
            },
           axisLabel:  {
                    textStyle: {
                         color: "rgba(255,255,255,.6)",
                        fontSize:12,
                    },
                },
    
            splitLine: {
                lineStyle: {
                     color: 'rgba(255,255,255,.1)'
                }
            }
        }],
        series: [
            {
            name: 'STR1',
            type: 'line',
             smooth: true,
            symbol: 'circle',
            symbolSize: 5,
            showSymbol: false,
            lineStyle: {
                
                normal: {
                    color: '#0184d5',
                    width: 2
                }
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgba(1, 132, 213, 0.4)'
                    }, {
                        offset: 0.8,
                        color: 'rgba(1, 132, 213, 0.1)'
                    }], false),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                }
            },
                itemStyle: {
                normal: {
                    color: '#0184d5',
                    borderColor: 'rgba(221, 220, 107, .1)',
                    borderWidth: 12
                }
            },
            // data: [3, 4, 3, 4, 3, 4, 3, 6, 2, 4, 2, 4,3, 4, 3, 4, 3, 4, 3, 6, 2, 4, 2, 4],
            data:[1.01 ,
                1.03 ,
                0.99 ,
                0.97 ,
                0.99 ,
                1.04 ,
                1.04 ,
                1.07 ,
                1.08 ,
                1.01 ,
                0.90 ,
                0.91 ,
                0.91 ,
                0.81 ,
                0.89 ,
                0.86 ,
                0.80 ,
                0.84 ,
                0.98 ,
                0.84 ,
                0.86 ,
                0.86 ,
                0.87 ,
                0.81             
                ],
    
        }, 
    {
            name: 'STR2',
            type: 'line',
            smooth: true,
            symbol: 'circle',
            symbolSize: 5,
            showSymbol: false,
            lineStyle: {
                
                normal: {
                    color: '#00d887',
                    width: 2
                }
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgba(0, 216, 135, 0.4)'
                    }, {
                        offset: 0.8,
                        color: 'rgba(0, 216, 135, 0.1)'
                    }], false),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                }
            },
                itemStyle: {
                normal: {
                    color: '#00d887',
                    borderColor: 'rgba(221, 220, 107, .1)',
                    borderWidth: 12
                }
            },
            // data: [5, 3, 5, 6, 1, 5, 3, 5, 6, 4, 6, 4, 8, 3, 5, 6, 1, 5, 3, 7, 2, 5, 1, 4],
            data:[1.08 ,
                1.18 ,
                1.04 ,
                1.05 ,
                1.07 ,
                1.09 ,
                1.12 ,
                1.12 ,
                1.13 ,
                1.06 ,
                1.03 ,
                0.94 ,
                0.94 ,
                0.89 ,
                0.90 ,
                0.93 ,
                0.83 ,
                0.85 ,
                0.99 ,
                0.85 ,
                0.96 ,
                0.90 ,
                0.86 ,
                0.95                 
                ]
    
        }, 
        
             ]
    
    };
          
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
            window.addEventListener("resize",function(){
                myChart.resize();
            });
    }
function echarts_31() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('fb1')); 
option = {
   
	    title: [{
        text: 'STR3',
        left: 'center',
        textStyle: {
            color: '#fff',
			fontSize:'16'
        }

    }],
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)",
position:function(p){   //其中p为当前鼠标的位置
            return [p[0] + 10, p[1] - 10];
        }
    },
    legend: {
        
top:'70%',
       itemWidth: 10,
        itemHeight: 10,
        data:['AC13-65(SBS)','AC20(AH30#)','CBG25-1','CBG25-1','GS'],
                textStyle: {
            color: 'rgba(255,255,255,.5)',
			fontSize:'12',
        }
    },
    series: [
        {
        	name:'STR3',
            type:'pie',
			center: ['50%', '42%'],
            radius: ['40%', '60%'],
                  color: ['#065aab', '#066eab', '#0682ab', '#0696ab', '#06a0ab','#06b4ab','#06c8ab','#06dcab','#06f0ab'],	
            label: {show:false},
			labelLine: {show:false},
            data:[
                {value:4, name:'AC13-65(SBS)'},
                {value:8, name:'AC20(AH30#)'},
                {value:20, name:'CBG25-1'},
                {value:20, name:'CBG25-1'},
                {value:20, name:'GS'},
            ]
        }
    ]
};
      
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
function echarts_32() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('fb2'));
option = {
   
	    title: [{
        text: 'STR4',
        left: 'center',
        textStyle: {
            color: '#fff',
			fontSize:'16'
        }

    }],
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)",
position:function(p){   //其中p为当前鼠标的位置
            return [p[0] + 10, p[1] - 10];
        }
    },
    legend: {
        
    top:'70%',
       itemWidth: 10,
        itemHeight: 10,
        data:['AC13-70(SBS)','AC20(AH30#)','AC10(SBS)','LCC','CBG25-1','GB'],
                textStyle: {
           color: 'rgba(255,255,255,.5)',
			fontSize:'12',
        }
    },
    series: [
        {
        	name:'STR4',
            type:'pie',
			center: ['50%', '42%'],
            radius: ['40%', '60%'],
            color: ['#065aab', '#066eab', '#0682ab', '#0696ab', '#06a0ab','#06b4ab','#06c8ab','#06dcab','#06f0ab'],	
            label: {show:false},
			labelLine: {show:false},
            data:[
                {value:4, name:'AC13-70(SBS)'},
                {value:6, name:'AC20(AH30#)'},
                {value:2, name:'AC10(SBS)'},
                {value:24, name:'LCC'},
                {value:20, name:'CBG25-1'},
                {value:20, name:'GB'},
            ]
        }
    ]
};
      
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
function echarts_33() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('fb3'));
option = {
	    title: [{
        text: 'STR5',
        left: 'center',
        textStyle: {
            color: '#fff',
			fontSize:'16'
        }

    }],
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)",
position:function(p){   //其中p为当前鼠标的位置
            return [p[0] + 10, p[1] - 10];
        }
    },
    legend: {
    top:'70%',
       itemWidth: 10,
        itemHeight: 10,
        data:['AC13-70(SBS)','AC20(AH30#)','AC10(SBS)','CC','CBG25-1','GB'],
                textStyle: {
            color: 'rgba(255,255,255,.5)',
			fontSize:'12',
        }
    },
    series: [
        {
        	name:'STR5',
            type:'pie',
			center: ['50%', '42%'],
            radius: ['40%', '60%'],
                   color: ['#065aab', '#066eab', '#0682ab', '#0696ab', '#06a0ab','#06b4ab','#06c8ab','#06dcab','#06f0ab'],	
            label: {show:false},
			labelLine: {show:false},
            data:[
                {value:4, name:'AC13-70(SBS)'},
                {value:6, name:'AC20(AH30#)'},
                {value:2, name:'AC10(SBS)'},
                {value:24, name:'CC'},
                {value:20, name:'CBG25-1'},
                {value:20, name:'GB'},
            ]
        }
    ]
};
      
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
				
	
})



		
		
		


		










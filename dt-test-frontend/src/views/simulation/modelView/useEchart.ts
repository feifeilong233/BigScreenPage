import echarts from "@/lib/echarts";
import {ref} from "vue";

function Render3DEcharts (idNames = 'container3D', dataset) {
    let idName = ref(idNames);
    const dom = document.getElementById(idName.value);
    const myChart = echarts.init(dom);

    const days = [1.0];
    const series = [];

    for (let i = 0; i < dataset.length; i++) {
        series.push({
            type: 'bar3D',
            data: dataset[i],
            stack: 'stack',
            shading: 'lambert',
            emphasis: {
                label: {
                    show: false
                }
            }
        });
    }

    myChart.setOption({
        xAxis3D: {
            type: 'category',
            data: days
        },
        yAxis3D: {
            type: 'category',
            data: days
        },
        zAxis3D: {
            type: 'value'
        },
        grid3D: {
            boxWidth: 140,
            boxDepth: 140,
            light: {
                main: {
                    shadow: true,
                    quality: 'ultra',
                    intensity: 1.5
                }
            }
        },
        series: series
    });
}

export default Render3DEcharts;

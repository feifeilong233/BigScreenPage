<template>
  <div class="echartTemp">
    <!-- <div class="echartTemp_title">地图</div> -->
    <div class="elementName" style="width: 100%; height: 100%"></div>
  </div>
</template>

<script lang="ts" setup>
import { PropType } from 'vue';
import echarts from '@/lib/echarts';
import { geoJson, geoCoordMap } from '@/lib/mapjson';

import { onMounted } from 'vue';

onMounted(() => {
  initMaps(document.querySelector('.elementName'), 'default');
});
// 更换数据 通过此功能实现动态更改数据
const initMaps = (el, t) => {
  const myChart = echarts.init(el, t);
  echarts.registerMap('world', geoJson);
  var data_tmp = [
    { name: '中国', value: 199 },
    { name: '印度', value: 42 },
    { name: '韩国', value: 102 },
    { name: '日本', value: 81 },
  ];
  // var max = 480,
  //     min = 9; // todo
  // var maxSize4Pin = 100,
  //     minSize4Pin = 20;

  var convertData = function (data) {
    var res = [];
    for (var i = 0; i < data.length; i++) {
      var geoCoord = geoCoordMap[data[i].name];
      if (geoCoord) {
        res.push({
          name: data[i].name,
          value: geoCoord.concat(data[i].value),
        });
      }
    }
    return res;
  };
  const option = {
    grid: {
      left: '5%',
      right: '5%',
    },

    tooltip: {
      trigger: 'item',
      formatter: function (params) {
        if (typeof params.value[2] == 'undefined') {
          return params.name + ' : ' + params.value;
        } else {
          return params.name + ' : ' + params.value[2];
        }
      },
    },
    legend: {
      orient: 'vertical',
      y: 'bottom',
      x: 'right',
      data: ['流量'],
      textStyle: {
        color: '#fff',
      },
    },
    visualMap: {
      show: false,
      min: 0,
      max: 500,
      left: 'left',
      top: 'bottom',
      text: ['高', '低'], // 文本，默认为数值文本
      calculable: true,
      seriesIndex: [1],
      inRange: {},
    },
    geo: {
      map: 'world',
      zoom: 1.2,
      show: true,
      roam: true,
      label: {
        normal: {
          show: false,
        },
        emphasis: {
          show: false,
        },
      },
      itemStyle: {
        normal: {
          areaColor: '#3a7fd5',
          borderColor: '#0a53e9', //线
          shadowColor: '#092f8f', //外发光
          shadowBlur: 20,
        },
        emphasis: {
          areaColor: '#0a2dae', //悬浮区背景
        },
      },
    },
    series: [
      {
        symbolSize: 5,
        label: {
          normal: {
            formatter: '{b}',
            position: 'right',
            show: false, //是否显示地名
          },
          emphasis: {
            show: true,
          },
        },
        itemStyle: {
          normal: {
            color: '#fff',
          },
        },
        name: 'light',
        type: 'scatter',
        coordinateSystem: 'geo',
        data: convertData(data_tmp),
      },
      {
        type: 'map',
        map: 'china',
        geoIndex: 0,
        aspectScale: 0.75, //长宽比
        showLegendSymbol: false, // 存在legend时显示
        label: {
          normal: {
            show: false,
          },
          emphasis: {
            show: false,
            textStyle: {
              color: '#fff',
            },
          },
        },
        roam: true,
        itemStyle: {
          normal: {
            areaColor: '#031525',
            borderColor: '#FFFFFF',
          },
          emphasis: {
            areaColor: '#2B91B7',
          },
        },
        animation: false,
        data: data_tmp,
      },
      {
        name: 'Top 5',
        type: 'scatter',
        coordinateSystem: 'geo',
        symbol: 'pin',
        symbolSize: [50, 50],
        label: {
          normal: {
            show: true,
            textStyle: {
              color: '#fff',
              fontSize: 9,
            },
            formatter(value) {
              return value.data.value[2];
            },
          },
        },
        itemStyle: {
          normal: {
            color: '#dfae10', //标志颜色
          },
        },
        data: convertData(
          data_tmp
            .sort(function (a, b) {
              return b.value - a.value;
            })
            .slice(0, 11),
        ), // 流量最大的前
        showEffectOn: 'render',
        rippleEffect: {
          brushType: 'stroke',
        },
        hoverAnimation: true,
        zlevel: 1,
      },
    ],
  };
  myChart.setOption(option);
};
</script>
<style lang="less" scoped>
.echartTemp {
  width: 100%;
  height: 100%;
  position: relative;
  &_title {
    position: absolute;
    width: 100%;
    top: 0;
    left: 0;
    color: #d1effe;
    font-size: 0.9rem;
    padding-left: 0.5rem;
    background: linear-gradient(to right, transparent, #535b6b, transparent);
    text-align: center;
    // border: 1px solid #9dd9f3;
    // border-image:linear-gradient(90deg,hsla(0,0%,100%,0),#9dd9f3,hsla(0,0%,100%,0)) 1;
  }
}
</style>

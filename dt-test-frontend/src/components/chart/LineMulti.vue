<template>
  <a-card :title="title" :loading="loading">
    <div ref="chartRef" :style="{ height, width }"></div>
  </a-card>
</template>
<script lang="ts">
import {defineComponent, PropType, ref, Ref, reactive, watchEffect} from 'vue';
import {useECharts} from '@/hooks/useEChart';
import {getCode} from "./typeEnum";

export default defineComponent({
  name: 'lineMulti',
  props: {
    chartData: {
      type: Array,
      default: () => [],
      required: true,
    },
    option: {
      type: Object,
      default: () => ({}),
    },
    type: {
      type: String as PropType<string>,
      default: 'line',
    },
    width: {
      type: String as PropType<string>,
      default: '100%',
    },
    height: {
      type: String as PropType<string>,
      default: 'calc(100vh - 78px)',
    },
    area: {
      type: Boolean as PropType<boolean>,
      default: false
    }
  },
  setup(props) {
    const chartRef = ref<HTMLDivElement | null>(null);
    const {setOptions} = useECharts(chartRef as Ref<HTMLDivElement>);
    const option = reactive({
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'shadow',
          label: {
            show: true,
            backgroundColor: '#333',
          },
        },
      },
      legend: {
        top: 30,
      },
      grid: {
        top: 60,
      },
      xAxis: {
        type: 'category',
        splitLine: {
          show: true,
          lineStyle: {
            width: 1,
            type: 'solid',
            color: 'rgba(226,226,226,0.5)',
          },
        },
        data: [],
      },
      yAxis: [
        {
          type: 'value',
        },
        {
          type: 'value',
        },
        {
          type: 'value',
          min: 7.3,
          show: false,
        },
      ],
      series: [],
    });

    watchEffect(() => {
      props.chartData && initCharts();
    });

    function initCharts() {
      if (props.option) {
        Object.assign(option, props.option);
      }
      //图例类型
      let typeArr = Array.from(new Set(props.chartData.map((item) => item.type)));
      //轴数据
      let xAxisData = Array.from(new Set(props.chartData.map((item) => item.name)));
      let seriesData = [];
      typeArr.forEach((type) => {
        let obj = {name: getCode(type), type: props.type, yAxisIndex: type == 7 || type == 6 ? 1 : type === 4 ? 2 : 0, smooth: type === 7 || type === 3};
        if (props.area && type !== 7) {
          Object.assign(obj, {smooth: true, areaStyle: {}});
        }
        let chartArr = props.chartData.filter((item) => type === item.type);
        //data数据
        obj['data'] = chartArr.map((item) => item.value);
        seriesData.push(obj);
      });
      option.series = seriesData;
      option.xAxis.data = xAxisData;
      setOptions(option);
    }

    return {chartRef};
  },
});
</script>

<style lang="less" scoped>
/deep/ .ant-card-body {
  padding: 0;
}
</style>

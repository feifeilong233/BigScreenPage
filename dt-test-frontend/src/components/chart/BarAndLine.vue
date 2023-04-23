<template>
  <a-card :title="title" :loading="loading">
    <div ref="chartRef" :style="{ height, width }"></div>
  </a-card>
</template>
<script lang="ts">
  import { defineComponent, PropType, ref, Ref, reactive, watchEffect } from 'vue';
  import { useECharts } from '@/hooks/useEChart';
  import {getCode} from "./typeEnum";

  export default defineComponent({
    name: 'BarAndLine',
    props: {
      chartData: {
        type: Array,
        default: () => [],
      },
      option: {
        type: Object,
        default: () => ({}),
      },
      width: {
        type: String as PropType<string>,
        default: '100%',
      },
      height: {
        type: String as PropType<string>,
        default: 'calc(100vh - 78px)',
      },
      title: String,
      loading: Boolean
    },
    setup(props) {
      const chartRef = ref<HTMLDivElement | null>(null);
      const { setOptions, echarts } = useECharts(chartRef as Ref<HTMLDivElement>);
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
        xAxis: {
          type: 'category',
          data: [],
        },
        yAxis: [
          {
            type: 'value',
            name: '',
            position: 'left',
          },
          {
            type: 'value',
            name: '',
            position: 'right',
          },
        ],
        series: [
          {
            name: 'bar',
            type: 'bar',
            data: [],
          },
        ],
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
        let j = 0;
        typeArr.forEach((type) => {
          option.yAxis[j].name = getCode(type);
          let obj = { name: getCode(type) };
          let chartArr = props.chartData.filter((item) => type === item.type);
          //data数据
          obj['data'] = chartArr.map((item) => item.value);
          obj['type'] = chartArr[0].seriesType;
          obj['yAxisIndex'] = j;
          seriesData.push(obj);
          j++;
        });
        option.series = seriesData;
        option.xAxis.data = xAxisData;
        setOptions(option);
      }
      return { chartRef };
    },
  });
</script>

<style lang="less" scoped>
/deep/ .ant-card-body {
  padding: 0;
}
</style>

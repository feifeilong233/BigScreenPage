<template>
  <a-card :title="title" :loading="loading">
    <div ref="chartRef" :style="{ width, height }"></div>
  </a-card>
</template>

<script lang="ts" setup>
import {PropType, Ref, ref, watch, onMounted } from 'vue';
import { queryRoadStructureByParentName } from "@/api/common/chart";
import { useECharts } from '@/hooks/useEChart';
const props = defineProps({
  width: {
    type: String as PropType<string>,
    default: '100%',
  },
  height: {
    type: String as PropType<string>,
    default: '300px',
  },
  title: String,
});

const loading = ref(true);

const dataSource = ref([]);

onMounted(() => {
  queryRoadStructureByParentName(props.title).then((res) => {
    loading.value = false;
    dataSource.value = res.data.data;
  });
})

const chartRef = ref<HTMLDivElement | null>(null);
const { setOptions } = useECharts(chartRef as Ref<HTMLDivElement>);
watch(
    () => loading.value,
    () => {
      if (loading.value) {
        return;
      }
      setOptions({
        tooltip: {
          trigger: 'item',
        },
        legend: {
          bottom: '1%',
          left: 'center',
        },
        series: [
          {
            name: props.title,
            type: 'pie',
            radius: ['70%', '80%'],
            center: ['50%', '40%'],
            color: ['#5ab1ef', '#b6a2de', '#67e0e3', '#2ec7c9'],
            data: dataSource.value,
            roseType: 'radius',
            animationType: 'scale',
            animationEasing: 'exponentialInOut',
            animationDelay: function () {
              return Math.random() * 400;
            },
            itemStyle: {
              // borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2,
            },
          },
          {
            name: props.title,
            type: 'pie',
            radius: ['40%', '70%'],
            center: ['50%', '40%'],
            avoidLabelOverlap: false,
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2,
            },
            label: {
              show: false,
              position: 'center',
            },
            emphasis: {
              label: {
                show: true,
                fontSize: '14',
                fontWeight: 'bold',
              },
            },
            labelLine: {
              show: false,
            },
            data: dataSource.value,
            animationType: 'scale',
            animationEasing: 'exponentialInOut',
            animationDelay: function () {
              return Math.random() * 100;
            },
          },
        ],
      });
    },
    { immediate: true }
);
</script>

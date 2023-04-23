<template>
  <page-header-wrapper>
    <div v-if="type === 2 || type === undefined" class="md:flex enter-y">
      <RoadStructurePie title="STR1" class="md:w-1/3 w-full"/>
      <RoadStructurePie title="STR2" class="md:w-1/3 !md:mx-4 !md:my-0 !my-4 w-full"/>
      <RoadStructurePie title="STR3" class="md:w-1/3 w-full"/>
    </div>
    <div v-if="type === 1 || type === undefined">
      <BarAndLine title="平整度检测数据" :chartData="barLineData1" :loading="loading" height="50vh"></BarAndLine>
      <BarAndLine title="抗滑性能检测数据" :chartData="barLineData2" :loading="loading" height="50vh"></BarAndLine>
    </div>
    <div v-if="type === 3 || type === undefined">
      <LineMulti :chartData="LineMultiData" title="车辙检测数据" :loading="loading" height="50vh"></LineMulti>
      <LineMulti :chartData="AreaData" title="FWD弯沉检测数据" :loading="loading" height="50vh" area></LineMulti>
    </div>
  </page-header-wrapper>
</template>

<script lang="ts" setup>
import 'virtual:windi.css';
import RoadStructurePie from "./components/RoadStructurePie.vue";
import BarAndLine from "@/components/chart/BarAndLine.vue";
import LineMulti from "@/components/chart/LineMulti.vue";
import {onMounted, ref} from 'vue';
import {useRoute} from "vue-router";
import {queryRoadFlatnessByPname} from "@/api/common/chart";
const route = useRoute();
const type = ref(0);
const loading = ref(true);
type.value = route.query.type;
const barLineData1 = ref([]);
const barLineData2 = ref([]);
const LineMultiData = ref([]);
const AreaData = ref([]);

onMounted(() => {
  queryRoadFlatnessByPname('STR1').then((response) => {
    loading.value = false;
    barLineData1.value = response.data.data
        .filter(obj => obj.type == 1 || obj.type == 3)
        .map((item) => {
          return {
            ...item,
            seriesType: item.type == 1 ? 'bar' : 'line'
          };
        });
    barLineData2.value = response.data.data
        .filter(obj => obj.type == 2 || obj.type == 4)
        .map((item) => {
          return {
            ...item,
            seriesType: item.type == 2 ? 'bar' : 'line'
          };
        });
    LineMultiData.value = response.data.data.filter(obj => obj.type == 3 || obj.type == 4 || obj.type == 6)
    AreaData.value = response.data.data.filter(obj => obj.type == 7 || obj.type == 8 || obj.type == 9)
  });
})
</script>

<style lang="less" scoped>

</style>

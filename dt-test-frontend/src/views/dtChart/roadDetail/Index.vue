<template>
  <page-header-wrapper>
    <div v-if="type == 3" class="md:flex enter-y">
      <RoadStructurePie title="STR1" class="md:w-1/3 w-full"/>
      <RoadStructurePie title="STR2" class="md:w-1/3 !md:mx-4 !md:my-0 !my-4 w-full"/>
      <RoadStructurePie title="STR3" class="md:w-1/3 w-full"/>
    </div>
    <div v-if="type == 2">
      <BarAndLine title="平整度检测数据" :chartData="barLineData" :loading="loading1" height="50vh"></BarAndLine>
    </div>
  </page-header-wrapper>
</template>

<script lang="ts" setup>
import 'virtual:windi.css';
import RoadStructurePie from "./components/RoadStructurePie.vue";
import BarAndLine from "@/components/chart/BarAndLine.vue";
import {onMounted, ref} from 'vue';
import {useRoute} from "vue-router";
import {queryRoadFlatnessByPname} from "@/api/common/chart";

const route = useRoute();
const type = ref(0);
const loading1 = ref(true);
type.value = route.query.type;
const barLineData = ref([]);

onMounted(() => {
  queryRoadFlatnessByPname('STR1').then((response) => {
    loading1.value = false;
    barLineData.value = response.data.data
        .filter(obj => obj.type == 1 || obj.type == 3)
        .map((item) => {
          return {
            ...item,
            seriesType: item.type == 1 ? 'bar' : 'line'
          };
        });
  });
})
</script>

<style lang="less" scoped>

</style>

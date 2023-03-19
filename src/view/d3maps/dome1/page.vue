<template>
  <div>
    <div id="three-frame"></div>
    <div class="threedom">
      <div class="mountNode" id="mountNode"></div>
      <!--  -->
    </div>
    <div class="echartshow" v-if="showechart">
      <Comps></Comps>
    </div>
    <div class="echarts">
      <button @click="clickhandle">asdasd</button>
    </div>
  </div>
</template>

<script lang="ts" setup>
// 圆盘地盘 地盘动画
import Comps from './comps/comps.vue';
import Render3DMode from './lib/usethree2';
import { onMounted, ref } from '@vue/runtime-core';
import { getGeoJsonall } from '@/lib/getGeoJson';
let { initMaps, intoCloud, setMapDom, setmapborder } =
  Render3DMode('three-frame');
let showechart = ref(false);
const clickhandle = () => {
  intoCloud();
  setTimeout(() => {
    showechart.value = true;
  }, 5000);
};
onMounted(() => {
  initMaps();
  getGeoJsonall('100000_full').then((e) => {
    setMapDom(e.data.features);
  });
  getGeoJsonall('100000').then((e) => {
    // console.log()
    setmapborder(e.data.features);
  });
});
</script>

<style scoped>
#three-frame {
  width: 100vw;
  height: 100vh;
  /* background: green; */
}
.threedom {
  width: 100vw;
  height: 100vh;
  position: fixed;
  /* background: #008c8c63; */
  top: 0;
  left: 0;
  pointer-events: none;
}
.mountNode {
  width: 100vw;
  height: 100vh;
  opacity: 0;
  /* transition: all .8s ease-in 0s; */
}
.echartshow {
  width: 100vw;
  height: 100vh;
  position: fixed;
  top: 0;
  left: 0;
  pointer-events: none;
  box-shadow: inset 0 10px 200px 100px #273750;
}
.echarts {
  position: fixed;
  top: 0;
  left: 0;
}
</style>

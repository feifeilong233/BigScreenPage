<template>
  <div id="three-frame"></div>
</template>

<script lang="ts" setup>
// 圆盘地盘 地盘动画
import Render3DMode from '@/hooks/useThree';
import { onMounted } from '@vue/runtime-core';
import { getGeoJsonall } from '@/lib/getGeoJson';
let { initMaps, setMapDom, setmapborder } = Render3DMode('three-frame');
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

<style>
#three-frame {
  width: 100vw;
  height: 100vh;
}
</style>

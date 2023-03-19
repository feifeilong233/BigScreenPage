<!--
 * @Author: your name
 * @Date: 2022-04-12 19:20:41
 * @LastEditTime: 2022-04-23 12:47:44
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \vuebig-screen\src\view\d3maps\dome\dome1.vue
-->
<template>
  <div class="doms">
    <div id="three-frame"></div>
    <div class="echartbox">
      <Comps></Comps>
    </div>
  </div>
</template>

<script lang="ts" setup>
import Comps from './comps.vue';
// 圆盘地盘 地盘动画
import Render3DMode from './uselib/useThree1';
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
.doms {
  width: 100vw;
  height: 100vh;
  background: #4d5353;
}
.echartbox {
  width: 100vw;
  height: 100vh;
  position: fixed;
  /* background: rgba(153, 150, 150, 0.738); */
  top: 0;
  left: 0;
  pointer-events: none;
}
</style>

<template>
  <div class="doms">
    <div class="echartbox">
      <Comps></Comps>
    </div>
<!--    <div id="map"></div>-->
    <canvas ref="canvasRef" class="three-frame"></canvas>
  </div>
</template>

<script lang="ts" setup>
import Comps from './comps.vue';
import Render3DMode from './uselib/useThree2';
import Render3DModel from './worker/useThree';
import {onMounted} from '@vue/runtime-core';
import {ref} from "vue";

const canvasRef = ref(null)
onMounted(() => {
  // Render3DMode('map');
  Render3DModel(canvasRef);
});
</script>

<style lang="less" scoped>
#map {
  width: 100%;
  height: 100vh;
}

.three-frame {
  width: 100%;
  height: 100vh;
}

.doms {
  width: 100%;
  height: 100vh;
  //background: #4d5353;
}

.echartbox {
  width: 100%;
  height: 100%;
  position: absolute;
  /* background: rgba(153, 150, 150, 0.738); */
  top: 0;
  left: 0;
  //pointer-events: none;
}
</style>

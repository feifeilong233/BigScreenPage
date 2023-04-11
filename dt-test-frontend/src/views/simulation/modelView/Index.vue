<template>
  <div class="doms">
    <div class="echart-box">
      <Comps></Comps>
    </div>
  </div>
</template>

<script lang="ts" setup>
import Comps from './comps.vue';
</script>

<style lang="less" scoped>
.doms {
  width: 100%;
  height: 100vh;
  //background: #4d5353;
}

.echart-box {
  width: 100%;
  height: 100%;
  position: absolute;
  //background: rgba(153, 150, 150, 0.738);
  top: 0;
  left: 0;
}
</style>

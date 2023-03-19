<template>
  <div class="min-w-screen w-screen min-h-screen flex">
    <div class="silder min-h-screen py-8 px-8 w-15rem bg-dark-1 shadow-lg">
      <Silder />
    </div>
    <div class="min-h-screen py-3 px-2 flex-1 bg-gray-100">
      <Main />
    </div>
  </div>
</template>
<script setup>
import { defineAsyncComponent, onMounted, reactive } from 'vue';
const witchs = reactive({
  isload: true,
});
const Main = defineAsyncComponent(() => import('./main.vue'));
const Silder = defineAsyncComponent(() => import('./silder.vue'));
onMounted(() => {
  witchs.isload = false;
});
</script>
<style lang="less" scoped>
@import url('../style/commit.css');
</style>

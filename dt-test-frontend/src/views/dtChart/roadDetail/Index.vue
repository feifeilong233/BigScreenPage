<template>
  <page-header-wrapper>
    <div class="md:flex enter-y">
      <RoadStructurePie title="STR1" class="md:w-1/3 w-full" />
      <RoadStructurePie title="STR2" class="md:w-1/3 !md:mx-4 !md:my-0 !my-4 w-full"/>
      <RoadStructurePie title="STR3" class="md:w-1/3 w-full" />
    </div>
  </page-header-wrapper>
</template>

<script lang="ts" setup>
import 'virtual:windi.css';
import RoadStructurePie from "./components/RoadStructurePie.vue";
</script>

<style lang="less" scoped>

</style>
